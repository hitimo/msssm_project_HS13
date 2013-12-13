% calculation of velocity distributions for FSL model.  Requires the 
% parameters saved in file 'par.mat' generated with script 'par.m'.


clear all;
close all;

load('par','nSim','L','time','p','c','v_max','v_min_default','t0','dt','nZones');
v_min = v_min_default;

n_v = zeros(nSim,v_max+1);
v_dist = zeros(numel(c),v_max+1);

time_length=(time-t0+1);

for k=1:numel(c)
    for n=1:nSim
        [~,x,v0] = sim_fsl(L, time, c(k), p,v_min,v_max,dt,nZones);
        v0 = v0(t0:end,:);
        for l=1:(v_max+1)
            n_v(n,l) = numel(find(v0==l-1))/(time_length);
        end
    end
    v_dist(k,:) = mean(n_v);
end


save('data_fsl_vdist','c','v_dist');