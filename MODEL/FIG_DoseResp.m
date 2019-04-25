% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

clear;
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
p.mKo = 0.0028;     % [0.005,0.02] nM/min | Constitutive synthesis rate
p.aK  = 0.00001;    % [0,1]
p.nK  = 2.6;
p.kK  = 12;         % [0.01,100] nM | Michaelis-Menten constants
p.gK  = 0.01;       % [0.01,0.24] 1/min | Dilution rate (first-order)
p.e0  = 0.0001;     % [0.05,140] 1/min | Dissociation (unbinding) rate
p.eP  = 0.0375;     % [0.0012,2000] 1/nM 1/min | Association (binding) rate
p.eM  = 0.05;       % [0.03,2] 1/nM 1/min | Active (mass-action) degradation

FmZ  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmY  = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x.*c).^n)./(((x.*c).^n)+(k^n)))))];
FmKc = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmKo = @(x,c,m,a,n,k) [m];
    
SS = zeros(2,length(P),6);
for OL = 0:1
    if(OL)
        p.mK = p.mKo;
        FmK  = FmKo;
    else
        p.mK = p.mKc;
        FmK  = FmKc;
    end
        
    % Steady states
    for i = 1:length(P)
        SS(OL+1,i,:) = FN_SS_Hill(P(i),p,FmZ,FmK,FmY,1e-4);
    end
    clear OL i
end

%% Feedback saturation threshold
i1 = [1:(length(P)-1)]; i2 = i1 + 1;
DY = abs(SS(1,i2,2)-SS(1,i1,2))./SS(1,i1,2);
DP = abs(P(i2)-P(i1))./P(i1);
DY = [NaN,DY./DP];
clear i1 i2

%% Figure
expD = load('RawData\ExpData.mat');     % Exp Data

fig = figure();
fig.Units = 'inches';
fig.PaperPosition = [13.5 1 6 3];
fig.Position = fig.PaperPosition;
CM = colormap('parula');
CM = CM(64:-1:1,:);
axes('Position',[0.075 0.55 0.375 0.375])
hold on;
    % Closed loop
    plot(P,SS(1,:,2),'LineWidth',1.5,'Color',[1 0 0],'DisplayName','CL')
    plot(expD.P(3:11),expD.Xc(6,[3:11]),'LineStyle','none','Marker','o',...
        'Color',[1 0 0],'DisplayName','CL')
    % Open loop
    plot(P,SS(2,:,2),'LineWidth',1.5,'Color',[0.5 0.5 0.5],'DisplayName','OL')
    plot(expD.P(3:11),expD.Xo(6,[3:11]),'LineStyle','none','Marker','o',...
        'Color',[0.5 0.5 0.5],'DisplayName','OL')
    
    d = DY;
    d([d<=0.15]) = exp(min(log(SS(1,:,2)))-10);
    d([d>0.15])  = exp(max(log(SS(1,:,2)))+10);
    plot(P,d,'Color',[0.8 0.8 0.8])
    clear d
        ylabel('ZPM')
        xlim([min([P,expD.P(3:11)]) max([P,expD.P(3:11)])])
        ylim([min([expD.Xc(6,[3:11]),expD.Xo(6,[3:11]),SS(1,:,2),SS(2,:,2)]) max([expD.Xc(6,[3:11]),expD.Xo(6,[3:11]),SS(1,:,2),SS(2,:,2)])])
        box('on')
        set(gca,'XScale','log','YTick','','XTick',[1,10],'XTickLabel','')

axes('Position',[0.075 0.15 0.375 0.375])
hold on;
    % Closed loop
    plot(P,SS(1,:,6),'LineWidth',1.5,'Color',[0.93 0.7 0.125],...
        'DisplayName','CL')
    plot(expD.P(3:11),expD.Yc(6,[3:11]),'LineStyle','none','Marker','o',...
        'Color',[0.93 0.7 0.125],'DisplayName','CL')
    % Open loop
    plot(P,SS(2,:,6),'LineWidth',1.5,'Color',[0.5 0.5 0.5],'DisplayName','OL')
    plot(expD.P(3:11),expD.Yo(6,[3:11]),'LineStyle','none','Marker','o',...
        'Color',[0.5 0.5 0.5],'DisplayName','OL')
    
    d = DY;
    d([d<=0.15]) = exp(min(log(SS(1,:,5)))-100);
    d([d>0.15])  = exp(max(log(SS(1,:,5)))+100);
    plot(P,d,'Color',[0.8 0.8 0.8])
    clear d
        ylabel('Output')
        xlabel('P')
        xlim([min([P,expD.P(3:11)]) max([P,expD.P(3:11)])])
        ylim([min([expD.Yc(6,[3:11]),expD.Yo(6,[3:11]),SS(1,:,5),SS(2,:,5)]) max([expD.Yc(6,[3:11]),expD.Yo(6,[3:11]),SS(1,:,5),SS(2,:,5)])])
        box('on')
        set(gca,'XScale','log','YScale','log',...
            'YTick','','XTick',[1,10])

axes('Position',[0.55 0.55 0.275 0.375])
hold on;
    % Closed loop
    plot(P,SS(1,:,1)+SS(1,:,4),'LineWidth',1.5,...
        'Color',[0.467 0.675 0.188],'DisplayName','CL')
    % Open loop
    plot(P,SS(2,:,1)+SS(2,:,4),'LineWidth',1.5,...
        'Color',[0.7 0.7 0.7],'DisplayName','OL')
    
    d = DY;
    d([d<=0.15]) = exp(min(log(SS(1,:,1)+SS(1,:,4)))-100);
    d([d>0.15])  = exp(max(log(SS(1,:,1)+SS(1,:,4)))+100);
    plot(P,d,'Color',[0.8 0.8 0.8])
    clear d
        ylabel('GEM')
        xlim([min(P) max(P)])
        ylim([min(SS(1,:,1)+SS(1,:,4)) max(SS(1,:,1)+SS(1,:,4))])
        box('on')
        set(gca,'XScale','log','YScale','log',...
            'YTick','','XTick',[1,10],'XTickLabel','')
axes('Position',[0.55 0.15 0.275 0.375])
hold on;
    % Closed loop
    plot(P,SS(1,:,3)+SS(1,:,4),'LineWidth',1.5,'Color',[0 0.75 0.75],...
        'DisplayName','CL')
    % Open loop
    plot(P,SS(2,:,3)+SS(2,:,4),'LineWidth',1.5,'Color',[0.7 0.7 0.7],...
        'DisplayName','OL')
    
    d = DY;
    d([d<=0.15]) = exp(min(log(SS(1,:,3)+SS(1,:,4)))-100);
    d([d>0.15])  = exp(max(log(SS(1,:,3)+SS(1,:,4)))+100);
    plot(P,d,'Color',[0.8 0.8 0.8])
    clear d
        ylabel('Key')
        xlabel('P')
        xlim([min(P) max(P)])
        ylim([min(SS(1,:,3)+SS(1,:,4)) max(SS(1,:,3)+SS(1,:,4))])
        box('on')
        set(gca,'XScale','log','YScale','log',...
            'YTick','','XTick',[1,10])
        
    annotation('textbox',[0.83 0.03 0.17 0.94],...
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
