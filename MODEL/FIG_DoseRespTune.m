% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

clear;
myP  = 'eP';
myPn = '\eta_+';
myPp = [1,1,3/10,3/100];
% myP  = 'mKc';
% myPn = '\mu_K';
% myPp = [1,1,3/30,3/300];
myOL = [1,0,0,0];

% Co-factors (hormones):
p.E = 7.5;
P = 10.^[log10(0.1953):0.01:log10(50)];%[0.1953,0.3906,0.7813,1.5625,3.125,6.5,12.5,25,50];%

% Parameter values
p.mG  = 0.006;      % [0.005,0.02] nM/min | Constitutive synthesis rate
p.gG  = 0.02;
p.mZ  = 11;
p.aZ  = 0.000001;	% [0,1]
p.nZ  = 2.2;
p.kZ  = 36;         % [0.01,100] nM | Michaelis-Menten constants
p.gZ  = 0.01;       % [0.0048,0.0114] 1/min | RFP-psd degradation rate in dark
p.mY  = 0.125*6;
    p.kYa = 0.01;
    p.kYd = 0;%p.kYa/1000;
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


FmZ  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmY  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmKc = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmKo = @(x,c,m,a,n,k) [m];
    
SS = zeros(length(myOL),length(P),6);
for o = 1:length(myOL)
    OL = myOL(o);
    p.(myP) = p.(myP)*myPp(o);
    if(OL)
        p.mK = p.mKo;
        FmK  = FmKo;
    else
        p.mK = p.mKc;
        FmK  = FmKc;
    end
        
    % Steady states
    for i = 1:length(P)
        SS(o,i,:) = FN_SS_Hill(P(i),p,FmZ,FmK,FmY,1e-4);
    end
    clear OL i
    p.(myP) = p.(myP)/myPp(o);
end

%% Figure
fig = figure();
fig.Units = 'inches';
fig.PaperPosition = [13.5 1 6 3];
fig.Position = fig.PaperPosition;
axes('Position',[0.1 0.55 0.375 0.375])
hold on;
    CM = [0.5 0.5 0.5; 1 0 0; 1 0.6 0.6; 1 0.8 0.8];
    % Closed loop
    for o = 2:length(myOL)
        plot(P,SS(o,:,2),'LineWidth',1.5,'Color',CM(o,:),...
            'DisplayName',cat(2,'CL | ',myPn,' \times ',num2str(myPp(o))))
    end
    % Open loop
    plot(P,SS(1,:,2),'LineWidth',1.5,'Color',CM(1,:),'DisplayName','OL')
        ylabel('ZPM')
        xlim([min(P) max(P)])
        box('on')
        set(gca,'XScale','log','YScale','log',...
            'YTick','','XTick',[1,10],'XTickLabel','')
axes('Position',[0.1 0.15 0.375 0.375])
hold on;
    CM = [0.5 0.5 0.5; 0.467 0.675 0.188; 0.6 0.8 0; 0.8 1 0.4];
%     CM = [0.5 0.5 0.5;0.93 0.69 0.125;1 0.8 0;0.965 0.91 0.6];
    % Closed loop
    for o = 2:length(myOL)
        plot(P,SS(o,:,6),'LineWidth',1.5,'Color',CM(o,:),...
            'DisplayName',cat(2,'CL | ',myPn,' \times ',num2str(myPp(o))))
    end
    % Open loop
    plot(P,SS(1,:,6),'LineWidth',1.5,'Color',CM(1,:),'DisplayName','OL')
        ylabel('Output')
        xlabel('P')
        xlim([min(P) max(P)])
        box('on')
        set(gca,'XScale','log','YScale','log',...
            'YTick','','XTick',[1,10])
        
    annotation('textbox',[0.7 0.47 0.28 0.375],...
            'String',{cat(2,'\mu_G=',num2str(p.mG,2),...
                          ', \gamma_G=',num2str(p.gG,2),...
                          ', \mu_Z=',num2str(p.mZ,2),...
                          ', \alpha_Z=',num2str(p.aZ,2),...
                          ', n_Z=',num2str(p.nZ,2),...
                          ', K_Z=',num2str(p.kZ,2),...
                          ', \gamma_Z=',num2str(p.gZ,2),...
                          ', \mu_Y=',num2str(p.mY,2),...
                          ', \alpha_Y=',num2str(p.aY,2),...
                          ', \gamma_Y=',num2str(p.gY,2),...
                          ', \kappa_+=',num2str(p.kYa),...
                          ', \kappa_-=',num2str(p.kYd),...
                          ', \mu_{K|C}=',num2str(p.mKc,2),...
                          ', \mu_{K|O}=',num2str(p.mKo,2),...
                          ', \alpha_K=',num2str(p.aK,2),...
                          ', n_K=',num2str(p.nK,2),...
                          ', K_K=',num2str(p.kK,2),...
                          ', \gamma_K=',num2str(p.gK,2),...
                          ', \eta_0=',num2str(p.e0,2),...
                          ', \eta_+=',num2str(p.eP,2),...
                          ', \eta_-=',num2str(p.eM),...
                          ', E=',num2str(p.E))},...
            'FontSize',8,'FitBoxToText','off');
        
%% END
