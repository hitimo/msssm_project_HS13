% Plot simulation results of NaSch model, measurements for different maximum 
% velocities. Requires datafile 'data_nach.mat' generated with script 
% 'main_nasch.m'.


clear all; close all;

load('data_nasch')

jam_length = jammed_mean./jams_mean;

lSize = 14; % fontSize of legend
xSize = 15;
ySize = 10;


% Figure 1: flow

fig1 = figure(1);

plot_simresults( c, v_max, flow, 'flow \it{f}', [0,0.55] )


l = legend('v_{max} = 1','v_{max} = 2','v_{max} = 3','v_{max} = 4','v_{max} = 5','Location','NorthEast');
set(l,'fontSize',lSize)

set(gcf,'Position',[0 0 xSize ySize])

print('-depsc', 'plot_flow_nasch')


% Figure 2: fuel consumption

fig2 = figure(2);

plot_simresults( c, v_max, fuel_mean, 'fuel consumption', [0,1] )

l = legend('v_{max} = 1','v_{max} = 2','v_{max} = 3','v_{max} = 4','v_{max} = 5','Location','SouthEast');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize 0 xSize ySize])
print('-depsc', 'plot_fuel_nasch')


% Figure 3: fraction of cars in jam

fig3 = figure(3);


plot_simresults( c, v_max, jammed_mean/1000, 'fraction of cars in jam' )


l = legend('v_{max} = 1','v_{max} = 2','v_{max} = 3','v_{max} = 4','v_{max} = 5','Location','NorthWest');
set(l,'fontSize',lSize);


set(gcf,'Position',[0 ySize xSize ySize])
print('-depsc', 'plot_jammed_nasch')


% Figure 4: average jam length


fig4 = figure(4);

plot_simresults( c, v_max, jam_length, 'average jam length', [2,10] )



l = legend('v_{max} = 1','v_{max} = 2','v_{max} = 3','v_{max} = 4','v_{max} = 5','Location','NorthWest');
set(l,'fontSize',lSize);

set(gcf,'Position',[xSize ySize xSize ySize])
print('-depsc', 'plot_jam_nasch')


