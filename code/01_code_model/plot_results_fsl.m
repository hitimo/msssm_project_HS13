% Plot the simulation results of Flexible Speed Limits modification.
% Requires datafile 'data_fsl.mat' generated with script 'main_fsl.m'.

clear all; close all;

load('data_fsl')

jam_length = jammed_mean./jams_mean;

lSize = 14; % fontSize of legend
xSize = 15;
ySize = 10;


% Figure 1: flow

fig1 = figure(1);

plot_simresults( c, v_min, flow, 'flow \it{f}', [0,0.55] )


l = legend('v_{min} = 1','v_{min} = 2','v_{min} = 3','v_{min} = 4','v_{min} = 5');
set(l,'fontSize',lSize)

set(gcf,'Position',[0 0 xSize ySize])

print('-depsc', 'plot_flow_fsl')


% Figure 2: fuel consumption

fig2 = figure(2);

plot_simresults( c, v_min, fuel_mean, 'fuel consumption', [0,1] )

l = legend('v_{min} = 1','v_{min} = 2','v_{min} = 3','v_{min} = 4','v_{min} = 5','Location','Southeast');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize 0 xSize ySize])
print('-depsc', 'plot_fuel_fsl')


% Figure 3: fraction of cars in jam

fig3 = figure(3);


plot_simresults( c, v_min, jammed_mean/1000, 'fraction of cars in jam' )


l = legend('v_{min} = 1','v_{min} = 2','v_{min} = 3','v_{min} = 4','v_{min} = 5','Location','NorthWest');
set(l,'fontSize',lSize);


set(gcf,'Position',[0 ySize xSize ySize])
print('-depsc', 'plot_jammed_fsl')


% Figure 4: average jam length


fig4 = figure(4);

plot_simresults( c, v_min, jam_length, 'average jam length', [2,10] )



l = legend('v_{min} = 1','v_{min} = 2','v_{min} = 3','v_{min} = 4','v_{min} = 5','Location','NorthWest');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize ySize xSize ySize])
print('-depsc', 'plot_jam_fsl')


