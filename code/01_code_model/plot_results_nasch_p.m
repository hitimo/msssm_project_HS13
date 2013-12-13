% Plot simulation results of NaSch model, measurements for different brake
% parameters p. Requires datafile 'data_nach_p.mat' generated with script 
% 'main_nasch_p.m'.

clear all; close all;

load('data_nasch_p')

jam_length = jammed_mean./jams_mean;

lSize = 14; % fontSize of legend
xSize = 15;
ySize = 10;


% Figure 1: flow

fig1 = figure(1);

plot_simresults( c, p, flow, 'flow \it{f}', [0,0.9] )


l = legend('p = 0','p = 0.25','p = 0.5','p = 0.75','Location','NorthEast');
set(l,'fontSize',lSize)

set(gcf,'Position',[0 0 xSize ySize])

print('-depsc', 'plot_flow_nasch_p')


% Figure 2: fuel consumption

fig2 = figure(2);

plot_simresults( c, p, fuel_mean, 'fuel consumption', [0,1] )

l = legend('p = 0','p = 0.25','p = 0.5','p = 0.75','Location','SouthEast');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize 0 xSize ySize])
print('-depsc', 'plot_fuel_nasch_p')


% Figure 3: fraction of cars in jam

fig3 = figure(3);


plot_simresults( c, p, jammed_mean/1000, 'fraction of cars in jam' )


l = legend('p = 0','p = 0.25','p = 0.5','p = 0.75','Location','NorthWest');
set(l,'fontSize',lSize);


set(gcf,'Position',[0 ySize xSize ySize])
print('-depsc', 'plot_jammed_nasch_p')


% Figure 4: average jam length


fig4 = figure(4);

plot_simresults( c, p, jam_length, 'average jam length', [2,10] )



l = legend('p = 0','p = 0.25','p = 0.5','p = 0.75','Location','NorthWest');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize ySize xSize ySize])
print('-depsc', 'plot_jam_nasch_p')


