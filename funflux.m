function [flux,dflux]=funflux(fflux,a)
switch fflux
    case 'linear'
        flux = @(s) a*s; dflux = @(s) a;
    case 'burgers'
        flux = @(s) (s.^2)/2; dflux = @(s) s;
    case 'bl'
        flux = @(s) ((s).^2)./((s.^2)+a.*((1-s).^2));
        dflux = @(s) (2.*a.*(1-s).*s)./(((s.^2)+a.*(1-s).^2).^2);
        %dflux = @(s) (2*a + 4*a.*s.^2 + 2.*s.^2 - 6*a.*s)./(((s.^2)+a.*(1-s).^2).^2)
end
end

