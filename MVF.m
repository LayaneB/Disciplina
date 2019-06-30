%% MVF
clear; close all; clc;
%% Casos
test = '3';
switch test
    
    case '1'
        si = 'fquad'; cc = 'periodica'; xl = -1; xr = 1; CFL = 0.4;  ne = 200;ae = 1;
        t = 0; tmax = 1; a = 1; fflux = 'linear'; rm_solver = 'LLF'; metodo = 'MUSCL';
            
    case '2'
        si = 'fstep'; cc = 'dirichlet'; xl = -1; xr = 1; CFL = 0.8; ne = 200; ae = 0;  
        t = 0; tmax = 1; a= 1; fflux = 'burgers'; rm_solver = 'ROE-E'; metodo = 'MVF';
    case '3'
        si = 'bl'; cc = 'dirichlet'; xl = 0; xr = 1; CFL = 0.4; ne = 200; ae = 0;  
        t = 0; tmax = 0.2; a= 1; fflux = 'bl'; rm_solver = 'LLF'; metodo = 'MUSCL';

end

h = (xr - xl)/ne; 
x = xl:h:xr; xe = x(1)+h/2:h:x(end)-h/2;
dt = CFL*h; nsteps = round(tmax/dt); n = 1;
s0 = SolIni(si,xe);
k=-1;
while n < nsteps
     esp=meth(metodo,cc,rm_solver,fflux,a,s0,h,k);
     sn = s0 -(dt/h)*esp;
       
    t = t + dt; s0 = sn;
    n = n +1;
    figure (1)
    plot(xe,sn,'.r')
    
    grid on; xlabel('x'); ylabel('S')
    axis([0 1 0 1])
    switch metodo
        case 'MVF'
            title('MVF');
        case 'MUSCL'
            title('MUSCL');  
    end
    pause(dt);
end

% cálculo dos erros 
%Linf(m)=max(abs(se-s0)); L1(m)=sum(abs(se-s0)*hm(m))/(xr-xl); L2(m)=sqrt((sum((se-s0).^2)*hm(m))/(xr-xl));
   
    BL_Semi_Analitic_Solution;
    hold off
