% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

clear
% Co-factors (hormones):
p.E = 7.5;
p.P = 1;

myT  = 'mKc';
myTn = '\mu_K [nM min^{-1}]';
myTp = 10.^[-2.5:0.05:2.5];
myTo = myTp*0;

myP  = 'P';
myPn = 'Pg [nM]';
pp   = 10.^[-1:0.1:2];

%% Parameters
p.mG  = 0.006;      % [0.005,0.02] nM/min | Constitutive synthesis rate
p.gG  = 0.02;
p.mZ  = 11;
p.aZ  = 0.000001;	% [0,1]
p.nZ  = 2.2;
p.kZ  = 36;         % [0.01,100] nM | Michaelis-Menten constants
p.gZ  = 0.01;       % [0.0048,0.0114] 1/min | RFP-psd degradation rate in dark
p.mY  = 0.125*6;
    p.kYa = 0.01;
    p.kYd = 0;
p.aY  = 0.03;       % [0,1]
p.gY  = 0.05;       % [0.0301,0.0408] 1/min | RFP-degODC degradation rate
p.mKc = 2;
p.mKo = 0.0005;     % [0.005,0.02] nM/min | Constitutive synthesis rate
p.aK  = 0.00001;    % [0,1]
p.nK  = 2.6;
p.kK  = 12;         % [0.01,100] nM | Michaelis-Menten constants
p.gK  = 0.01;       % [0.01,0.24] 1/min | Dilution rate (first-order)
p.e0  = 0.0001;     % [0.05,140] 1/min | Dissociation (unbinding) rate
p.eP  = 0.0375;     % [0.0012,2000] 1/nM 1/min | Association (binding) rate
p.eM  = 0.05;       % [0.03,2] 1/nM 1/min | Active (mass-action) degradation

% Functions:
FmZ  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmY  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x.*c).^n)./(((x.*c).^n)+(k^n)))))];
FmKc = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmKo = @(x,c,m,a,n,k) [m];

%% Steady states:
SS = zeros(length(myTo),length(pp),6);
for o = 1:length(myTo)
    o
    p.(myT) = p.(myT)*myTp(o);
    if(myTo(o))
        p.mK = p.mKo;
        FmK  = FmKo;
    else
        p.mK = p.mKc;
        FmK  = FmKc;
    end
    for i = 1:length(pp)
        p.(myP) = p.(myP)*pp(i);
        SS(o,i,:) = FN_SS_Hill(p.P,p,FmZ,FmK,FmY,1e-5);
        p.(myP) = p.(myP)/pp(i);
    end
    p.(myT) = p.(myT)/myTp(o);
end
clear i o
save FIG_SupplTune_FB_muK_L.mat

%% Feedback saturation threshold
DY = zeros(length(myTo),length(pp));
pI = p.(myP)*pp;
i1 = [1:(length(pp)-1)]; i2 = i1 + 1;
DP(1,:) = [NaN,abs(pI(i2)-pI(i1))./pI(i1)];
for o = 1:length(myTo)
    ss = SS(o,:,1)+SS(o,:,4);
    DY(o,:) = [NaN,abs(ss(i2)-ss(i1))./ss(i1)];
    DY(o,:) = DY(o,:)./DP;
end
clear i1 i2 DP ss

%% Figure | Steady states
fig = figure();
fig.Units = 'inches';
fig.PaperPosition = [3.5 1 4 2];
fig.Position = fig.PaperPosition;

% Color scale
CM = colormap('parula');
CM = CM(64:-1:1,:);
    
tI = p.(myT)*myTp;
pI = p.(myP)*pp;

% minS = -1; maxS = -0.5;
minS = 0.01; maxS = 0.25;

axes('Position',[0.15 0.3 0.8 0.6])
hold on;
for o = 1:length(myTo)
%     ss = log10(SS(o,:,1)+SS(o,:,4));
    ss = DY(o,:);
    C  = ceil(64*(ss-minS)/(maxS-minS));
    C([C>64]) = 64; C([C<1]) = 1; C(isnan(C)) = 1;
    for i = 2:length(pI)
        plot(tI(o),pI(i),'Color',CM(C(i),:),...
            'Marker','s','MarkerFaceColor',CM(C(i),:))
    end
    clear ss
end
    set(gca,'XScale','log','YScale','log')
    box('on')
    xlim([min(tI) max(tI)])
    xlabel(myTn)
    ylim([min(pI) max(pI)])
    ylabel(myPn)
    clear d o tI pI
    
%% END
