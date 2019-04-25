% Modular and tunable biological feedback control using a de novo protein switch
% Ng et al. (2019)
%
% Created by Mariana Gomez-Schiavon

clear
OL = 0; % Open loop flag
ii = [0.7813,1.5625,3.125,6.25];
T  = [0:(60*12)];

%% Parameter values
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
p.mK  = 2;
p.mKo = 0.0028;     % [0.005,0.02] nM/min | Constitutive synthesis rate
p.aK  = 0.00001;    % [0,1]
p.nK  = 2.6;
p.kK  = 12;         % [0.01,100] nM | Michaelis-Menten constants
p.gK  = 0.01;       % [0.01,0.24] 1/min | Dilution rate (first-order)
p.e0  = 0.0001;     % [0.05,140] 1/min | Dissociation (unbinding) rate
p.eP  = 0.0375;     % [0.0012,2000] 1/nM 1/min | Association (binding) rate
p.eM  = 0.05;       % [0.03,2] 1/nM 1/min | Active (mass-action) degradation

p.E = 7.5;

% Functions:
FmZ = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmY = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
FmK = @(x,c,m,a,n,k) [m*(a + ((1-a)*(((x*c).^n)./(((x*c).^n)+(k^n)))))];
if(OL)
    FmK = @(x,c,m,a,n,k) [m];
    p.mK = p.mKo;
end

%% Initial conditions (steady state):
yO =  FN_SS_Hill(ii(1),p,FmZ,FmK,FmY,1e-4);

%% ODE
SS = zeros(length(ii),6,length(T));
for i = 1:length(ii)
    iP = [ii(1),ii(i)];
    save('Par_ODE.mat','p','iP','OL')
    [t,y] = ode45(@FN_ODE_YA,T,yO);
    SS(i,:,:) = y';
end
clear i t y iP

%% Figure
fig = figure();
fig.Units = 'inches';
fig.PaperPosition = [10 1 10 6];
fig.Position = fig.PaperPosition;
CM = colormap('parula');
CM = CM(64:-1:1,:);
subplot(2,2,1)
hold on;
for i = 1:length(ii)
    ss(T+1) = SS(i,6,:);
    plot(T/60,ss,'LineWidth',2,'Color',CM(i*16,:),...
        'DisplayName',cat(2,'Pg = ',num2str(ii(i)),' nM'))
end
        ylabel('Y')
        xlabel('Time [hrs]')
        box('on')
        grid('on')
        set(gca,'YScale','log','XTick',[0:2:12],'XTickLabel',[-2:2:10])
subplot(2,2,2)
hold on;
for i = 1:length(ii)
    ss(T+1) = SS(i,1,:)+SS(i,4,:);
    plot(T/60,ss,'LineWidth',2,'Color',CM(i*16,:),...
        'DisplayName',cat(2,'Pg = ',num2str(ii(i)),' nM'))
end
        ylabel('G+C')
        xlabel('Time [hrs]')
        box('on')
        grid('on')
        set(gca,'YScale','log','XTick',[0:2:12],'XTickLabel',[-2:2:10])
subplot(2,2,3)
hold on;
for i = 1:length(ii)
    ss(T+1) = SS(i,2,:);
    plot(T/60,ss,'LineWidth',2,'Color',CM(i*16,:),...
        'DisplayName',cat(2,'Pg = ',num2str(ii(i)),' nM'))
end
        ylabel('Z')
        xlabel('Time [hrs]')
        box('on')
        grid('on')
        set(gca,'YScale','log','XTick',[0:2:12],'XTickLabel',[-2:2:10])
subplot(2,2,4)
hold on;
for i = 1:length(ii)
    ss(T+1) = SS(i,3,:)+SS(i,4,:);
    plot(T/60,ss,'LineWidth',2,'Color',CM(i*16,:),...
        'DisplayName',cat(2,'Pg = ',num2str(ii(i)),' nM'))
end
        ylabel('K+C')
        xlabel('Time [hrs]')
        box('on')
        grid('on')
        set(gca,'YScale','log','XTick',[0:2:12],'XTickLabel',[-2:2:10])
        legend('show','Location','NorthEast')
        clear ss i
        
    annotation('textbox',[0.0865 0.9427 0.8375 0.0486],...
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
                          ', \mu_K=',num2str(p.mK,2),...
                          ', \alpha_K=',num2str(p.aK,2),...
                          ', n_K=',num2str(p.nK,2),...
                          ', K_K=',num2str(p.kK,2),...
                          ', \gamma_K=',num2str(p.gK,2),...
                          ', \eta_0=',num2str(p.e0,2),...
                          ', \eta_+=',num2str(p.eP,2),...
                          ', \eta_-=',num2str(p.eM),...
                          ', E=',num2str(p.E))},...
            'FontSize',8,'FitBoxToText','off');
