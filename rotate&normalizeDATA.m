%% CODE USED ROTATE AND NORMALIZE POSITION DATA
% Tiago Monteiro 2021


clear
load('ALLdata.mat')
expGroup = data.raw.imprinting.natural.short.easy; % select Experimental Group (see readme.txt)
focalAnimal = 6; % select focal subject (see readme.txt)
exampleAnimal1 = expGroup(:,:,focalAnimal); 
%%
drawFIGURE = 1 ; % would you like a plot with raw and transformed data?

red = exampleAnimal1(:,1:2);  
green = exampleAnimal1(:,3:4);
duck = exampleAnimal1(:,5:6);    

% remove first 10 seconds of test
red = red(600:18000,:);
green = green(600:18000,:);
duck = duck(600:18000,:);

% downsample the data 
factor = 30;
red = downsample(red,factor);
green = downsample(green,factor);
duck = downsample(duck,factor);

red = fillmissing(red,'previous');
green = fillmissing(green,'previous');
duck = fillmissing(duck,'previous');
duck = duck';
meanRED = nanmean(red,1);
meanGREEN = nanmean(green,1);

% ROTATING DATA
% Create rotation matrix
point1 = meanRED';
point2 = meanGREEN';
x1 = point1(2);
y1 = point1(1);
x2 = point2(2);
y2 = point2(1);
slope = (y1 - y2) ./ (x1 - x2);
angle = atand(slope);
mid = (point1(:) + point2(:)).'/2;

X = [x1,x2 ;y1,y2];
d = pdist(X,'euclidean');

if point1(1)>point2(1)
theta = angle+90+180;
R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
theta2 = angle;  %-(90+angle)
R2 = [cosd(theta2) -sind(theta2); sind(theta2) cosd(theta2)];
else
theta = angle+90;
R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
theta2 = -(90+angle);
R2 = [cosd(theta2) -sind(theta2); sind(theta2) cosd(theta2)];

end    

% Rotate your point(s)
dummyRED = point1;
dummyGREEN = point2;
rotRED = R*dummyRED;
rotGREEN = R*dummyGREEN;
dummyDUCK = duck;
rotDUCK = [];

for ii = 1 : length(dummyDUCK)
rotDUCK(:,ii) = R*dummyDUCK(:,ii);
end

line1 = [point1(1) point2(1) ; point1(2) point2(2)];
line2 = [rotRED(1) rotGREEN(1) ; rotRED(2) rotGREEN(2)];

if point1(1)>point2(1)
    line2=line2;
else
line2 = fliplr(line2);
end

rotmid = (rotRED + rotGREEN)./2;

% NORMALIZING THE DATA
%%%% formula   ==>  normalizedDATA = -1 + 2.*(data - min(data))./(max(data) - min(data));

d2 = max(rotDUCK(2,:)) - min(rotDUCK(2,:));
maxDUCK = rotRED(2) + d/2;
minDUCK = rotRED(2) - d/2;
normrotDUCK(1,:) = -1 + 2.*(rotDUCK(1,:) - rotRED(1))./(rotGREEN(1) - rotRED(1));
normrotDUCK(2,:) = -1 + 2.*(rotDUCK(2,:) - minDUCK)./(maxDUCK - minDUCK);

nWarning = 0;
for ii =  1 : length(normrotDUCK)
    
    if normrotDUCK(1,ii)< -.98 | normrotDUCK(1,ii) >.98
        if ii == 1
        normrotDUCK(1,ii) = normrotDUCK(1,ii+1);
        else
        normrotDUCK(1,ii) = normrotDUCK(1,ii-1);
        nWarning = nWarning + 1;
        end
    end
end

if nWarning > 0
fprintf(['WARNING:' num2str(nWarning) ' errors removed out of ' num2str(numel(duck))])
end

% Figure
if drawFIGURE == 1
colorRED = [1 0 0];
colorGREEN = [46 139 87]/255;
colorORANGE = [212 139 63]/255;
colorBLUE = [0 0.4470 0.7410];
blah = fliplr(linspace(0,1 ,size(duck(1,:),2)));

figure
subplot(1,2,1)
title('raw data')

hold on

plot(line1(1,:), line1(2,:),'-', 'color',colorORANGE,'linewidth', 2)
plot([meanGREEN(1) meanGREEN(2)],[meanRED(2) meanRED(1)] ,'-', 'color',colorBLUE,'linewidth', 2)

plot(meanRED(1),meanRED(2), '.r','markersize', 50)
plot(meanGREEN(1),meanGREEN(2), '.','color',colorGREEN','markersize', 50)

scatter(duck(1,:),duck(2,:),25,'filled','MarkerFacecolor',[0 0 0], 'MarkerEdgecolor',[0 0 0])
        
        hold off
        alpha(.1)
        hold on
                for j = 1 : size(duck(1,:),2)
                plot(duck(1,j),duck(2,j),'.','markersize',10,'color',[1 1 1].*blah(j))
                end

xlim([mid(1) - d/1.7 mid(1) + d/1.7])
ylim([mid(2) - d/1.7 mid(2) + d/1.7])
axis square

set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',1,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

grid on
grid minor
ax = gca;
ax.XRuler.Axle.LineWidth = 3;
ax.YRuler.Axle.LineWidth = 3;

subplot(1,2,2)
title('rotated by \alpha and normalized [-1,1]')

hold on
plot(-1,0, '.','color',colorRED,'markersize', 50)
plot(1,0, '.','color',colorGREEN,'markersize', 50)
scatter(normrotDUCK(1,:),normrotDUCK(2,:),25,'filled','MarkerFacecolor',[0 0 0], 'MarkerEdgecolor',[0 0 0])
        
        hold off
        alpha(.1)
        hold on
                for j = 1 : size(rotDUCK(1,:),2)
                plot(normrotDUCK(1,j),normrotDUCK(2,j),'.','markersize',10,'color',[1 1 1].*blah(j))
                end
axis square
set(gca,...
    'tickdir','out',...
    'layer','bottom',...
    'box','on',...
    'linewidth',1,...
    'TickLength',[0 0],...
    'xticklabel',{[]},...
    'yticklabel',{[]},...
    'fontsize',16);

grid on
grid minor
ax = gca;
ax.XRuler.Axle.LineWidth = 3;
ax.YRuler.Axle.LineWidth = 3;

xlim([-1.2 1.2])
ylim([-1.2 1.2])
else
    fprintf('Selected data transformed successfully!')
end 