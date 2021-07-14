%% CODE TO GENERATE ALL FIGURES IN MONTEIRO, HART AND KACELNIK 2021
% Tiago Monteiro 2021
% all data is available with the paper
clear

%% Figure 1 and Extended figure 1 %% 
% Generates normalised amplitude traces of the stimuli used inthe experiment,
% depicted in Figure 1c,d and Extended figure 1

[shortQuack,Fs] = audioread('duckSoundShort.wav'); % this should be the duck sound short  stimulus
[longQuack,Fs] = audioread('duckSoundLong.wav'); % this should be the duck sound long stimulus
[shortNoise,Fs] = audioread('whiteNoiseShort.wav'); % this should be the white noise burst short stimulus
[longNoise,Fs] = audioread('whiteNoiseLong.wav'); % this should be the white noise burst long stimulus

info = audioinfo('duckSoundLong.wav')
t = 0:seconds(1/Fs) : seconds(info.Duration);
t = t(1:end-1);
time = seconds(0:2);

figure ('Name','Monteiro et al. (2021) - sound snippets')
sgtitle('sound stimulus', 'FontSize',36)
subplot(2,2,1)
plot(t(1:length(shortQuack)),shortQuack(:,1), 'color','k')
title('duck sound | SHORT','fontsize',18)
ylabel('amplitude (normalized)','fontsize',16)
ax = gca;
ax.XAxis.Limits = [time(1) time(3)];
ylim([-1,1])
set(gca,...
        'tickdir','out',...
        'layer','top',...
        'box','off',...
        'linewidth',2,...
        'layer','top',...
        'TickLength',[0 0],...
        'xticklabel',{[]},...
        'yticklabel',{[]});
    
subplot(2,2,2)
plot(t,longQuack(:,1),'color','k')
title('duck sound | LONG','fontsize',18)
ylim([-1,1])
xlim([t(1) t(end)])

set(gca,...
        'tickdir','out',...
        'layer','top',...
        'box','off',...
        'linewidth',2,...
        'layer','top',...
        'TickLength',[0 0],...
         'xticklabel',{[]},...
        'yticklabel',{[]});
    
subplot(2,2,3)
plot(t(1:length(shortNoise)),shortNoise(:,1),'color','k')
title('white noise | SHORT','fontsize',18)
xlabel('time','fontsize',16)
ylabel('amplitude (normalized)','fontsize',16)
ax = gca;
ax.XAxis.Limits = [time(1) time(3)];
ylim([-1,1])
set(gca,...
        'tickdir','out',...
        'layer','top',...
        'box','off',...
        'linewidth',2,...
        'layer','top',...
        'TickLength',[0 0],...
        'yticklabel',{[]});
    
subplot(2,2,4)
plot(t,longNoise(:,1),'color','k')%
title('white noise | LONG','fontsize',18)
xlabel('time','fontsize',16)
ylim([-1,1])
xlim([t(1) t(end)])

set(gca,...
        'tickdir','out',...
        'layer','top',...
        'box','off',...
        'linewidth',2,...
        'layer','top',...
        'TickLength',[0 0],...
        'yticklabel',{[]});
    
%% FIGURE 2 and Extended figure 3 %%
% Load data files
prefNatural = readmatrix('preferenceDuckSound.csv'); % imprinting with duck sound
prefArtificial = readmatrix('preferenceWhiteNoise.csv'); % imprinting with white noise burst

% parse data and calculate means and SEMs
soundANDtimeNAT = prefNatural(prefNatural(:,4)==1);
soundNAT = prefNatural(prefNatural(:,4)==2);
timeEqualNAT = prefNatural(prefNatural(:,4)==3);
timeDiffNAT = prefNatural(prefNatural(:,4)==4);

mean_soundANDtimeNat = nanmean(soundANDtimeNAT);
mean_soundNat = nanmean(soundNAT);
mean_timeEqualNat = nanmean(timeEqualNAT);
mean_timeDiffNat = nanmean(timeDiffNAT);

SEsoundANDtimeNAT = nanstd(soundANDtimeNAT/sqrt(numel(soundANDtimeNAT)));
SEsoundNAT = nanstd(soundNAT/sqrt(numel(soundNAT)));
SEtimeEqualNAT = nanstd(timeEqualNAT/sqrt(numel(timeEqualNAT)));
SEtimeDiffNAT = nanstd(timeDiffNAT/sqrt(numel(timeDiffNAT)));

soundANDtimeNAT_SHORT = prefNatural(prefNatural(:,4)==1 & prefNatural(:,2)==1);
soundNAT_SHORT = prefNatural(prefNatural(:,4)==2 & prefNatural(:,2)==1);
timeEqualNAT_SHORT = prefNatural(prefNatural(:,4)==3 & prefNatural(:,2)==1);
timeDiffNAT_SHORT = prefNatural(prefNatural(:,4)==4 & prefNatural(:,2)==1);

soundANDtimeNAT_LONG = prefNatural(prefNatural(:,4)==1 & prefNatural(:,2)==2);
soundNAT_LONG = prefNatural(prefNatural(:,4)==2 & prefNatural(:,2)==2);
timeEqualNAT_LONG = prefNatural(prefNatural(:,4)==3 & prefNatural(:,2)==2);
timeDiffNAT_LONG = prefNatural(prefNatural(:,4)==4 & prefNatural(:,2)==2);

soundANDtimeART = prefArtificial(prefArtificial(:,4)==1);
soundArt = prefArtificial(prefArtificial(:,4)==2);
timeEqualArt = prefArtificial(prefArtificial(:,4)==3);
timeDiffArt = prefArtificial(prefArtificial(:,4)==4);

mean_soundANDtimeArt = nanmean(soundANDtimeART);
mean_soundArt = nanmean(soundArt);
mean_timeEqualArt = nanmean(timeEqualArt);
mean_timeDiffArt = nanmean(timeDiffArt);

SEsoundANDtimeART = nanstd(soundANDtimeART/sqrt(numel(soundANDtimeART)));
SEsoundArt = nanstd(soundArt/sqrt(numel(soundArt)));
SEtimeEqualArt = nanstd(timeEqualArt/sqrt(numel(timeEqualArt)));
SEtimeDiffArt = nanstd(timeDiffArt/sqrt(numel(timeDiffArt)));

soundANDtimeARTSHORT = prefArtificial(prefArtificial(:,4)==1 & prefArtificial(:,2)==1);
soundArtSHORT = prefArtificial(prefArtificial(:,4)==2 & prefArtificial(:,2)==1);
timeEqualArtSHORT = prefArtificial(prefArtificial(:,4)==3 & prefArtificial(:,2)==1);
timeDiffArtSHORT = prefArtificial(prefArtificial(:,4)==4 & prefArtificial(:,2)==1);

soundANDtimeARTLONG = prefArtificial(prefArtificial(:,4)==1 & prefArtificial(:,2)==2);
soundArtLONG = prefArtificial(prefArtificial(:,4)==2 & prefArtificial(:,2)==2);
timeEqualArtLONG = prefArtificial(prefArtificial(:,4)==3 & prefArtificial(:,2)==2);
timeDiffArtLONG = prefArtificial(prefArtificial(:,4)==4 & prefArtificial(:,2)==2);

% Plot data
colorSOUNDandTIME = [0, 160, 117]/255;
colorSOUND = [215,95,28]/255;
colorTIME = [117,114,177]/255;

figure ('Name','Monteiro et al. (2021) - Figure 2')
hold on

vSOUNDTIME_nat = [0 -1; 0 1; 2.5 1; 2.5 -1];
vSOUND_nat = [2.5 -1; 2.5 1; 4.5 1; 4.5 -1];
vTIMEequal_nat = [4.5 -1; 4.5 1; 6.5 1; 6.5 -1];
vTIMEdiff_nat = [6.5 -1; 6.5 1; 8.6 1; 8.6 -1];

f = [1 2 3 4];
patch('Faces',f,'Vertices',vSOUNDTIME_nat,'FaceColor',colorSOUNDandTIME, 'FaceAlpha',.1,'HandleVisibility','off')
patch('Faces',f,'Vertices',vSOUND_nat,'FaceColor',colorSOUND, 'FaceAlpha',.1,'HandleVisibility','off')
patch('Faces',f,'Vertices',vTIMEequal_nat,'FaceColor',colorTIME, 'FaceAlpha',.1,'HandleVisibility','off')
patch('Faces',f,'Vertices',vTIMEdiff_nat,'FaceColor',colorTIME, 'FaceAlpha',.2,'HandleVisibility','off')

plot([2.5,2.5],[-2,2],'-k','linewidth',1.5,'HandleVisibility','off')
plot([4.5,4.5],[-2,2],'-k','linewidth',1.5,'HandleVisibility','off')
plot([6.5,6.5],[-2,2],'-k','linewidth',1.5,'HandleVisibility','off')

plot([0 9],[0 0],'-k','linewidth',1.5,'HandleVisibility','off')

plot([1.5,1.5],[-.43,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([3.5,3.5],[-.52,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([5.5,5.5],[0,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([7.5,7.5],[0,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')

bar(1,mean_soundANDtimeNat,...
    .75, 'edgecolor','k', 'facecolor','w', 'linewidth',1.5)
bar(3,mean_soundNat,...
    .75, 'edgecolor','k', 'facecolor','w', 'linewidth',1.5,'HandleVisibility','off')
bar(5,mean_timeEqualNat,...
    .75, 'edgecolor','k', 'facecolor','w', 'linewidth',1.5,'HandleVisibility','off')
bar(7,mean_timeDiffNat,...
    .75, 'edgecolor','k', 'facecolor','w', 'linewidth',1.5,'HandleVisibility','off')

bar(2,mean_soundANDtimeArt,...
    .75, 'edgecolor','k', 'facecolor','k', 'linewidth',1.5)
bar(4,mean_soundArt,...
    .75, 'edgecolor','k', 'facecolor','k', 'linewidth',1.5,'HandleVisibility','off')
bar(6,mean_timeEqualArt,...
    .75, 'edgecolor','k', 'facecolor','k', 'linewidth',1.5,'HandleVisibility','off')
bar(8,mean_timeDiffArt,...
    .75,'edgecolor','k', 'facecolor','k', 'linewidth',1.5,'HandleVisibility','off')

plot([1 1],[(mean_soundANDtimeNat-SEsoundANDtimeNAT) (mean_soundANDtimeNat+SEsoundANDtimeNAT)],'-k','linewidth',1.5)
plot([3 3],[(mean_soundNat-SEsoundNAT) (mean_soundNat+SEsoundNAT)],'-k','linewidth',1.5)
plot([5 5],[(mean_timeEqualNat-SEtimeEqualNAT) (mean_timeEqualNat+SEtimeEqualNAT)],'-k','linewidth',1.5)
plot([7 7],[(mean_timeDiffNat-SEtimeDiffNAT) (mean_timeDiffNat+SEtimeDiffNAT)],'-k','linewidth',1.5)

plot([2 2],[(mean_soundANDtimeArt-SEsoundANDtimeART) (mean_soundANDtimeArt+SEsoundANDtimeART)],'-k','linewidth',1.5)
plot([4 4],[(mean_soundArt-SEsoundArt) (mean_soundArt+SEsoundArt)],'-k','linewidth',1.5)
plot([6 6],[(mean_timeEqualArt-SEtimeEqualArt) (mean_timeEqualArt+SEtimeEqualArt)],'-k','linewidth',1.5)
plot([8 8],[(mean_timeDiffArt-SEtimeDiffArt) (mean_timeDiffArt+SEtimeDiffArt)],'-k','linewidth',1.5)

set(gca,...
    'tickdir','out',...
    'layer','top',...
    'box','on',...
    'linewidth',2,...
    'TickLength',[0 0],...
    'ytick',[-0.5, -0.25, 0, 0.25, 0.5],...
    'xtick',[],...
    'fontsize',14);

plot([0.4 0.5],[-0.5 -0.5],'-k','linewidth',2)
plot([0.4 0.5],[-0.25 -0.25],'-k','linewidth',2)
plot([0.4 0.5],[0.25 0.25],'-k','linewidth',2)
plot([0.4 0.5],[0.5 0.5],'-k','linewidth',2)
 
text(4.6,-0.103,'target = imprint','fontsize',11)
text(6.6,-0.103,['target' ' ' '\neq' ' ' 'imprint'],'fontsize',11)

text(0.85,-0.46,'sound','fontsize',16,'color',colorSOUNDandTIME)
text(1.3,-0.515,'&','fontsize',16,'color',colorSOUNDandTIME)
text(1,-0.56,'time','fontsize',16,'color',colorSOUNDandTIME)
text(3,-0.56,'sound','fontsize',16,'color',colorSOUND)
text(5.2,-0.56,'time','fontsize',16,'color',colorTIME)
text(7.2,-0.56,'time','fontsize',16,'color',colorTIME)

leg = legend('imprint to duck sound', 'imprint to noise','location','northeast')

axis square                                                          
xlim([0.4 8.55])
ylim([-.6,.6])
xlabel('Discriminating dimension', 'fontsize',20)
ylabel('Preference for target', 'fontsize',20) 

%% Extended figure 3
dummy = nan(40,8);
dummy(1:(length(soundANDtimeNAT_SHORT) + length(soundANDtimeNAT_LONG)),1) = [soundANDtimeNAT_SHORT;soundANDtimeNAT_LONG];
dummy(1:(length(soundANDtimeARTSHORT) + length(soundANDtimeARTLONG)),2) = [soundANDtimeARTSHORT;soundANDtimeARTLONG];
dummy(1:(length(soundNAT_SHORT) + length(soundNATLONG)),3) = [soundNAT_SHORT;soundNATLONG];
dummy(1:(length(soundArtSHORT) + length(soundArtLONG)),4) = [soundArtSHORT;soundArtLONG];
dummy(1:(length(timeEqualNAT_SHORT) + length(timeEqualNATLONG)),5) = [timeEqualNAT_SHORT;timeEqualNATLONG];
dummy(1:(length(timeEqualArtSHORT) + length(timeEqualArtLONG)),6) = [timeEqualArtSHORT;timeEqualArtLONG];
dummy(1:(length(timeDiffNAT_SHORT) + length(timeDiffNATLONG)),7) = [timeDiffNAT_SHORT;timeDiffNATLONG];
dummy(1:(length(timeDiffArtSHORT) + length(timeDiffArtLONG)),8) = [timeDiffArtSHORT;timeDiffArtLONG];

%s = rng; remove comment in case you want to re-shuffle the jitter of individual data points
N=20;
a=0.8;
b=1.2;
r = a + (b-a).*rand(N,1);
r1 = r; r2 = r1+1; r3=r1+2; r4=r1+3; r5=r1+4; r6=r1+5; r7=r1+6; r8=r1+7;

colorSOUNDandTIME = [0, 160, 117]/255;
colorSOUND = [215,95,28]/255;
colorTIME = [117,114,177]/255;

figure ('Name','Monteiro et al. (2021) - Extended figure 3')
plot([0 9],[0 0],'--k','linewidth',0.8,'HandleVisibility','off')
hold on

vSOUNDTIME_nat = [0 -3; 0 3; 1.5 3; 1.5 -3];
vINT1nat = [2.5 -3; 2.5 3; 3.5 3; 3.5 -3];
vTIMEequal_nat = [4.5 -3; 4.5 3; 5.5 3; 5.5 -3];
vTIMEdiff_nat = [6.5 -3; 6.5 3; 7.5 3; 7.5 -3];

vEASYart = [1.5 -3; 1.5 3; 2.5 3; 2.5 -3];
vINT1art = [3.5 -3; 3.5 3; 4.5 3; 4.5 -3];
vINT2art = [5.5 -3; 5.5 3; 6.5 3; 6.5 -3];
vHARDart = [7.5 -3; 7.5 3; 8.5 3; 8.5 -3];

f = [1 2 3 4];

plot([1.5,1.5],[-1.9,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([3.5,3.5],[-1.9,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([5.5,5.5],[-1.9,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')
plot([7.5,7.5],[-1.9,2],'--','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')

plot([2.5,2.5],[-3,3],'-k','linewidth',1.5,'HandleVisibility','off')
plot([4.5,4.5],[-3,3],'-k','linewidth',1.5,'HandleVisibility','off')
plot([6.5,6.5],[-3,3],'-k','linewidth',1.5,'HandleVisibility','off')

plot([0 9],[0 0],'-','color',[.5 .5 .5],'linewidth',.8,'HandleVisibility','off')

[h,l,mx,md,bw]=violin([dummy(:,1) dummy(:,2) dummy(:,3) dummy(:,4) dummy(:,5) dummy(:,6) dummy(:,7) dummy(:,8)],...
    'edgecolor',[],'facecolor', [colorSOUNDandTIME;colorSOUNDandTIME;colorSOUND; colorSOUND; colorTIME; colorTIME; colorTIME;colorTIME],...
    'facealpha',.2,'mc',[],'linewidth',.5,'medc',[],'plotlegend',0,...
    'HandleVisibility','off')
legend('off')

plot([.6 1.4], [mean_soundANDtimeNat mean_soundANDtimeNat],'-', 'color',colorSOUNDandTIME,'linewidth',7)
plot([2.6 3.4], [mean_soundNat mean_soundNat],'-', 'color',colorSOUND,'linewidth',7)
plot([4.6 5.4], [mean_timeEqualNat mean_timeEqualNat],'-', 'color',colorTIME,'linewidth',7)
plot([6.6 7.4], [mean_timeDiffNat mean_timeDiffNat],'-', 'color',colorTIME,'linewidth',7)
plot([.65 1.35], [mean_soundANDtimeNat mean_soundANDtimeNat],'-w', 'linewidth',2.5)
plot([2.65 3.35], [mean_soundNat mean_soundNat],'-w','linewidth',2.5)
plot([4.65 5.35], [mean_timeEqualNat mean_timeEqualNat],'-w','linewidth',2.5)
plot([6.65 7.35], [mean_timeDiffNat mean_timeDiffNat],'-w','linewidth',2.5)

plot([1.6 2.4], [mean_soundANDtimeArt mean_soundANDtimeArt],'-', 'color',colorSOUNDandTIME,'linewidth',7)
plot([3.6 4.4], [mean_soundArt mean_soundArt],'-', 'color',colorSOUND,'linewidth',7)
plot([5.6 6.4], [mean_timeEqualArt mean_timeEqualArt],'-', 'color',colorTIME,'linewidth',7)
plot([7.6 8.4], [mean_timeDiffArt mean_timeDiffArt],'-', 'color',colorTIME,'linewidth',7)

plot(r1(1:numel(soundANDtimeNAT_SHORT)),soundANDtimeNAT_SHORT,'o',...
    'MarkerEdgeColor',colorSOUNDandTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1)

plot(r3(1:numel(soundNAT_SHORT)),soundNAT_SHORT,'o',...
    'MarkerEdgeColor',colorSOUND,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r5(1:numel(timeEqualNAT_SHORT)),timeEqualNAT_SHORT,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r7(1:numel(timeDiffNAT_SHORT)),timeDiffNAT_SHORT,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r1(1:numel(soundANDtimeNAT_LONG)),soundANDtimeNAT_LONG,'o',...
    'MarkerEdgeColor',colorSOUNDandTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1)

plot(r3(1:numel(soundNATLONG)),soundNATLONG,'o',...
    'MarkerEdgeColor',colorSOUND,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r5(1:numel(timeEqualNATLONG)),timeEqualNATLONG,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r7(1:numel(timeDiffNATLONG)),timeDiffNATLONG,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r2(1:numel(soundANDtimeARTSHORT)),soundANDtimeARTSHORT,'o',...
    'MarkerEdgeColor',colorSOUNDandTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r4(1:numel(soundArtSHORT)),soundArtSHORT,'o',...
    'MarkerEdgeColor',colorSOUND,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r6(1:numel(timeEqualArtSHORT)),timeEqualArtSHORT,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r8(1:numel(timeDiffArtSHORT)),timeDiffArtSHORT,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','k',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r2(1:numel(soundANDtimeARTLONG)),soundANDtimeARTLONG,'o',...
    'MarkerEdgeColor',colorSOUNDandTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1)

plot(r4(1:numel(soundArtLONG)),soundArtLONG,'o',...
    'MarkerEdgeColor',colorSOUND,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r6(1:numel(timeEqualArtLONG)),timeEqualArtLONG,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

plot(r8(1:numel(timeDiffArtLONG)),timeDiffArtLONG,'o',...
    'MarkerEdgeColor',colorTIME,...
    'MarkerFaceColor','w',...
    'MarkerSize',7,...
    'linewidth', 1,'HandleVisibility','off')

ylim([-2.5 2])
xlim([0.4 8.55])
plot([0.4 0.5],[-2 -2],'-k','linewidth',2)
plot([0.4 0.5],[-1 -1],'-k','linewidth',2)
plot([0.4 0.5],[1 1],'-k','linewidth',2)

legend('off')
set(gca,...
    'tickdir','out',...
    'layer','top',...
    'box','on',...
    'linewidth',2,...
    'TickLength',[0 0],...
    'ytick',[-2 -1 0 1 2],...
    'xtick',[],...
    'fontsize',14);

text(4.6,-2,'target = imprint','fontsize', 11)
text(6.65,-2,['target' ' ' '\neq' ' ' 'imprint'],'fontsize', 11)

text(0.85,-2,'sound','fontsize',16,'color',colorSOUNDandTIME)
text(1.3,-2.2,'&','fontsize',16,'color',colorSOUNDandTIME)
text(1,-2.35,'time','fontsize',16,'color',colorSOUNDandTIME)
text(3,-2.35,'sound','fontsize',16,'color',colorSOUND)
text(5.2,-2.35,'time','fontsize',16,'color',colorTIME)
text(7.2,-2.35,'time','fontsize',16,'color',colorTIME)


xlabel('Discriminating dimension', 'fontsize',20)
ylabel('Preference for target', 'fontsize',20) 
axis square

%% Extended figure 2 %%
% plot example trajectories for individual animals

% load data
clear
load('ALLdata.mat') % readme file available with rawData file in Dryad
% https://datadryad.org/stash/share/hCdF2WhcsjUsxUXia2Kb8vTq53aItP8-O8OyV2m2C4I

% top row of the figure (example animals 1-4):
% example #1
expGroup = data.processed.imprinting.natural.short.easy; % select Experimental Group (see readme.txt) 

% plot data
colorRED = [1 0 0];
colorGREEN = [46 139 87]/255;
colorORANGE = [212 139 63]/255;
colorBLUE = [0 0.4470 0.7410];  
colorPINK = [160 32 240]/255;

ii = 11 % corresponds to animal #6 of this group
figure ('Name','Monteiro et al. (2021) - Extended figure 2')
subplot(2,4,1)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)
plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #2
expGroup = data.processed.imprinting.natural.short.int1_soundDIFF; % select Experimental Group (see readme.txt) 

ii = 3 % corresponds to animal #2 of this group
subplot(2,4,2)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii)*-1,expGroup(:,ii+1)*-1, 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #3
expGroup = data.processed.imprinting.natural.short.int2_timeDIFF; % select Experimental Group (see readme.txt) 

ii = 13 % corresponds to animal #7 of this group 

subplot(2,4,3)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #4
expGroup = data.processed.imprinting.natural.short.hard; % select Experimental Group (see readme.txt) 

ii = 1 % corresponds to animal #1 of this group 

subplot(2,4,4)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% bottom row of the figure (example animals 5-8)
% example #5
expGroup = data.processed.imprinting.natural.long.easy; % select Experimental Group (see readme.txt) 

ii = 11 % corresponds to animal #6 of this group 

subplot(2,4,5)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #6
expGroup = data.processed.imprinting.natural.long.int1_soundDIFF; % select Experimental Group (see readme.txt) 

ii = 11 % corresponds to animal #6 of this group 

subplot(2,4,6)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii)*-1,expGroup(:,ii+1)*-1, 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #7
expGroup = data.processed.imprinting.natural.long.int2_timeDIFF; % select Experimental Group (see readme.txt) 

ii = 39 % corresponds to animal #20 of this group 

subplot(2,4,7)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

clear expGroup

% example #8
expGroup = data.processed.imprinting.natural.long.hard; % select Experimental Group (see readme.txt) 

ii = 13 % corresponds to animal #7 of this group 

subplot(2,4,8)
hold on
% plot([0 0],[-1.5 1.5],'--k','linewidth',0.8)

plot(expGroup(:,ii),expGroup(:,ii+1), 'marker', 'o',...
    'markerfacecolor','k',...
    'markeredgecolor','w',...
    'markersize',3)

plot(-1,0, '.r','markersize', 25)
plot(1,0, '.','color',colorGREEN','markersize', 25)

xlim([-1.2 1.2])
ylim([-1.2 1.2])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',3,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);