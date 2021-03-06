% Run simulations and measure flow, fuel consumption and jams for NaSch
% model, for different maximum velocities. Results are saved in file 
% 'data_nasch.mat'. Requires the parameters saved in file 'par.mat' 
% generated with script 'par.m'.

calculation of data needed to plot fundamental diagram and plot of fuel
% consumption for standard Nagel-Schreckenberg model.

clear all;
close all;

load('par','nSim','L','time','p','c','v_max_nasch','t0');
v_max=v_max_nasch;


v=zeros(1,nSim); % averages of velocity over positions and time for each simulation
flow=zeros(numel(v_max),numel(c)); % flow averaged over all simulations
[fuel0, jams, jammed] = deal(zeros(1,nSim)); % fuel consumption, number of jams, 
                                        % number of jammed cars for each simulation
[fuel_mean,jams_mean,jammed_mean]=deal(zeros(numel(v_max),numel(c)));
% averages over all simulations of fuel consumption, number of jams, and
% number of jammed cars.


for l = 1:numel(v_max) % loop over maximum velocity
    for k=1:numel(c) % loop over densities
        for n=1:nSim % loop over number of simulations
            [~,x,v0] = sim_nasch(L, time, c(k), p,v_max(l)); % run simulation, output coordinates and velocities
            v0 = v0(t0:end,:); x = x(t0:end,:); % start measurements at t0
            fuel0(n) = fuel( x,v0,L); % calculate average fuel consumption per distance
            v(n)=mean(mean(v0)); % average of velocity over time and positions
            [jams0,jammed0] = jamDetect(x, 2, L); % find number of jams and number of jammed cars
            jams(n) = mean(jams0); jammed(n)  = mean(jammed0); % average of jam-related quantities over time

        end
        % average over simulations:
        flow(l,k)=c(k)*mean(v); % calculation of flow
        fuel_mean(l,k)=mean(fuel0);
        jams_mean(l,k)=mean(jams);
        jammed_mean(l,k)=mean(jammed);
    end
end


save('data_nasch','c','v_max','fuel_mean','jams_mean','jammed_mean','flow');

