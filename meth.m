function [esp]=meth(metodo,cc,rm_solver,fflux,a,s0,h,k)
[flux,dflux]=funflux(fflux,a);
    switch metodo
        case 'MVF'
           sl = [0 s0]; sr = [s0 0];
        case 'MUSCL'
            %sl = [s0(1) s0]; sr = [s0 s0(end)];
            N=length(s0);
            s0=[s0(1) s0 s0(end)];
            sl=zeros(1,N+1); sr=zeros(1,N+1);
            %extrapolação
            for i = 2:N+1
               
                rl = (s0(i+1)-s0(i)+h^2)./(s0(i)-s0(i-1)+h^2);
                sl(i) = s0(i) + 0.25.*minmod(rl).*((1-k)*(s0(i)-s0(i-1))+(1+k)*(s0(i+1)-s0(i)));
%               sl(i) = s0(i) - 0.5*minmod(r1)([s0(i)-sl(i),s0(i+1)-s0(i),s0(i)-s0(i-1)]).*(s0(i)-s0(i-1));
            end
            for i = 1:N
                rr = (s0(i+1)-s0(i)+h^2)./(s0(i+2)-s0(i+1)+h^2);
                sr(i) = s0(i+1) - 0.25.*minmod(rr)*((1-k)*(s0(i+2)-s0(i+1))+(1+k)*(s0(i+1)-s0(i)));
%               sr(i) = s0(i) + 0.5*minmod(rr)*([sr(i)-s0(i),s0(i+1)-s0(i),s0(i+2)-s0(i+1)]).*(s0(i+2)-s0(i+1));
            end
       
    end
    %% Condição de contorno
    switch cc
        case 'periodica'
        sl(1)=sl(end); sr(end) = sr(1);
        case 'dirichlet'
        sl(1) =1; sr(end) = sr(end-1);
    end
    %% Fluxo númerico
    [fl,fr] = FluxNum(rm_solver,flux,dflux,s0,sl,sr);
    esp = (fr-fl);
end