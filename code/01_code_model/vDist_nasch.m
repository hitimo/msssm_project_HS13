% calculation of velocity distributions for NaSch model.  Requires the 
% parameters saved in file 'par.mat' generated with script 'par.m'.

clear all;
close all;

load('par','nSim','L','time','p','c','v_max','d0','t0');

n_v = zeros(nSim,v_max+1);
v_dist = zeros(numel(c),v_max+1);

time_length=(time-t0+1);

for k=1:numel(c)
    for n=1:nSim
        [~,x,v0] = sim_nasch(L, time, c(k), p,v_max);
        v0 = v0(t0:end,:);
        for l=1:(v_max+1)
            n_v(n,l) = numel(find(v0==l-1))/(time_length);
        end
    end
    v_dist(k,:) = mean(n_v);
end


save('data_nasch_vdist','c','v_dist');

