function [] = plot_fsl(L, time, c, p, v_min, v_max,dt,nZones,nTraj)
%PLOT_FSL Plot all states time vs. position of FSL modification of 
%Nagel-Schreckenberg model. In addition, the trajectories of cars are
%plotted. The plots are saved as 'plot_fsl_traj' and 'plot_fsl'.
%   PLOT_FSL(L, time, c, p, v_min, v_max,dt,nZones,nTraj)
%   Input arguments:
%   L: the number of sites (length of road)
%   time: the number of iterations until the algorithm stops
%   c: probability that a site is occupied by a car at time 0
%   p: probability that a car randomly brakes
%   v_max: maximum velocity (integer number)
%   dt: time to let pass with current speed limits before speed limits are
%   recalculated.
%   nZones: number of zones
%   nTraj: number of cars whose trajectories are plotted.

fSze1 = 20;
fSze2 = 14;
[image_data,x,v,spdlmt] = sim_fsl(L, time, c, p, v_min, v_max,dt,nZones);

scrsz = get(0,'ScreenSize');
figure('Position',[1 scrsz(4)/1.5 scrsz(3)/1.5 scrsz(4)/1.5]);
colmap = jet(v_max+3);
colmap = [[1 1 1]; [1 0 0]; colmap((end-2):(-1):3,:); [0 0 1]];
colormap(colmap);
data_plot = image_data+1;
image(data_plot);
axis xy;
set(gca,'FontSize',fSze2);
ylabel('time','fontSize',fSze1)
xlabel('position','fontSize',fSze1)

% Create labels for colorbar:
labels = cell(1,v_max+2);
for k=1:(v_max+1)
    labels{k}=['v = ',num2str(k-1)];
end
h = colorbar('YTickLabel',labels);
% h = colorbar;
set(h,'Ylim',[1.5 v_max+2.5]);
set(h,'YTick',2:(v_max+2));
set(h,'fontSize',fSze2)


set(gca,'XTick',0:100:1000)

set(gcf,'PaperUnits','centimeters')
set(gcf,'Units','centimeters')

xSize = 20;
ySize = 15;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize])
set(gcf,'Position',[0 0 xSize ySize])
print('-dbmp', 'plot_fsl')


figure('Position',[1 scrsz(4)/1.5 scrsz(3)/1.5 scrsz(4)/1.5]);
set(gcf,'PaperUnits','centimeters')
set(gcf,'Units','centimeters')


if v_min<v_max
    colmap = [[1 0.8 0.8]; [0.8 0.8 1]];
else
    colmap = [0.8 0.8 1];
end

colormap(colmap);
image(spdlmt-v_min+1);
axis xy;
ylabel('time','fontSize',fSze2)
xlabel('position','fontSize',fSze2)
hold on;

sz = size(v);
nCars = sz(2);

for n = 1:nTraj
    car = floor(n*nCars/nTraj);
    x_car = x(:,car);
    l=1:(numel(x_car)-1);
    excl = ((x_car(l)-x_car(l+1))>v_max);
    x_car(excl)=NaN;
    plot(x_car,1:time,'Color','black','LineWidth',1.5);

    hold on;
end

hold off;
set(gca,'FontSize',fSze2);
set(gca,'XTick',0:100:1000)


ylabel('time','fontSize',fSze1);
xlabel('position','fontSize',fSze1);


xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize])
set(gcf,'Position',[24 0 xSize-2 ySize])


print('-dbmp', 'plot_fsl_traj');

end
