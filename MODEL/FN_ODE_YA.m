% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

function dYdt = FN_ODE_YA(t,y)
    load Par_ODE.mat
    
    if(t<120)
        P = iP(1);
    else
        P = iP(2);
    end

    %% Species:
    G  = y(1);
    Z  = y(2);
    K  = y(3);
    C  = y(4);
    Y  = y(5);
    YA = y(6);
    
    %% Functions:
    FmZ = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
    FmY = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
    FmK = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
    if(OL)
        clear FmK
        FmK = @(x,c,m,a,n,k) [m];
    end
    
    %% ODEs
    dYdt = [p.mG - (p.gG*G) - (p.eP*G.*K) + (p.e0*C);
        	FmZ(G+C,p.E,p.mZ,p.aZ,p.nZ,p.kZ) - (p.gZ*Z);
            FmK(Z,P,p.mK,p.aK,p.nK,p.kK) - (p.gK*K) - (p.eP*G.*K) + ((p.e0+p.eM)*C);
            (-p.gK*C) + (p.eP*G.*K) - ((p.e0+p.eM)*C);
            FmY(Z,P,p.mY,p.aY,p.nK,p.kK)  + (p.kYd*YA) - (p.kYa*Y)- (p.gY*Y);
            (p.kYa*Y) - (p.kYd*YA) - (p.gY*YA)];
