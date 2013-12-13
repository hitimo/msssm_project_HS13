% Plot the simulation results of the Adaptive Cruise Control modification. 
% Requires datafile 'data_acc.mat' generated with script 'main_acc.m'.

clear all; close all;

load('data_acc')

jam_length = jammed_mean./jams_mean;

lSize = 14; % fontSize of legend
xSize = 15;
ySize = 10;

% invert data:

d0=d0(end:-1:1);
flow=flow(end:-1:1,:);
fuel_mean=fuel_mean(end:-1:1,:);
jammed_mean=jammed_mean(end:-1:1,:);
jam_length=jam_length(end:-1:1,:);

% Figure 1: flow

fig1 = figure(1);

plot_simresults( c, d0, flow, 'flow \it{f}', [0,0.55] )


l = legend('d_0 = 2','d_0 = 1','d_0 = 0');
set(l,'fontSize',lSize)

set(gcf,'Position',[0 0 xSize ySize])

print('-depsc', 'plot_flow_acc')


% Figure 2: fuel consumption

fig2 = figure(2);

plot_simresults( c, d0, fuel_mean, 'fuel consumption', [0,1] )

l = legend('d_0 = 2','d_0 = 1','d_0 = 0','Location','SouthEast');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize 0 xSize ySize])
print('-depsc', 'plot_fuel_acc')


% Figure 3: fraction of cars in jam

fig3 = figure(3);


plot_simresults( c, d0, jammed_mean/1000, 'fraction of cars in jam' )


l = legend('d_0 = 2','d_0 = 1','d_0 = 0','Location','NorthWest');
set(l,'fontSize',lSize);


set(gcf,'Position',[0 ySize xSize ySize])
print('-depsc', 'plot_jammed_acc')


% Figure 4: average jam length


fig4 = figure(4);

plot_simresults( c, d0, jam_length, 'average jam length', [2,10] )

l = legend('d_0 = 2','d_0 = 1','d_0 = 0','Location','NorthWest');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize ySize xSize ySize])
print('-depsc', 'plot_jam_acc')


