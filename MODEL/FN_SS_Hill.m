% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

function ss = FN_SS_Hill(Pi,p,FmZ,FmK,FmY,eps)
    iK = [0 (FmK(1000,Pi,p.mK,p.aK,p.nK,p.kK)/p.gK)];
    dG = 1; dZ = 1; dK = 1; dC = 1;
    while(max(abs([dG dZ dK dC]))>1e-4)
        K = [iK(1):((iK(2)-iK(1))/1000000):iK(2)];
        if(isempty(K))
            K = 1e-6;
        end
        C = p.mG*K./((p.gG*((p.gK+p.e0+p.eM)/p.eP))+((p.gK+p.eM)*K));
        G = (p.mG+(p.e0*C))./(p.gG+(p.eP*K));
        Z = FmZ(G+C,p.E,p.mZ,p.aZ,p.nZ,p.kZ)/p.gZ;

        dK = FmK(Z,Pi,p.mK,p.aK,p.nK,p.kK) - (p.gK*K) - (p.eP*G.*K) + ((p.e0+p.eM)*C);
        j  = find([(dK(1:max(1,length(dK)-1)).*dK(min(2,length(dK)):length(dK)))<=0]);

        if(isempty(j))
            G = NaN;
            Z = NaN;
            K = NaN;
            C = NaN;
            Y  = NaN;
            YA = NaN;
            break;
        else
            iK = [K(max(1,j-1)) K(min(length(K),j+1))];

            G = G(j);
            Z = Z(j);
            K = K(j);
            C = C(j);
            Y  = FmY(Z,Pi,p.mY,p.aY,p.nK,p.kK)/(p.gY+p.kYa-(p.kYd*p.kYa/(p.kYd+p.gY)));
            YA = p.kYa*Y/(p.gY+p.kYd);

            dG = p.mG - (p.gG*G) - (p.eP*G.*K) + (p.e0*C);
            dZ = FmZ(G+C,p.E,p.mZ,p.aZ,p.nZ,p.kZ) - (p.gZ*Z);
            dK = FmK(Z,Pi,p.mK,p.aK,p.nK,p.kK) - (p.gK*K)...
                - (p.eP*G.*K) + ((p.e0+p.eM)*C);
            dC = (-p.gK*C) + (p.eP*G.*K) - ((p.e0+p.eM)*C);
        end
    end
    ss = [G Z K C Y YA];
