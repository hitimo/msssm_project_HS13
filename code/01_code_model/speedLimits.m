function [ v_lim ] = speedLimits( x, v_min, v_max, L, zoneLength, density )
% SPEEDLIMITS: split road into zones of length 'zoneLength' where each
% zone can have two possible speed limits (specified by 'v_min' or
% 'v_max'). The speed limits are chosen such that if the subsequent zone
% has a density of vehicles above 'density' (typically chosen as the 
% average density), the speed limit is 'v_max' and else it is 'v_min'.
%   SPEEDLIMITS( x, v_min, v_max, L, zoneLength, density) returns the speed limit for 
%   each site of the road for the following input arguments:
%   x: coordinates of cars
%   v_min: low speed limit
%   v_max: high speed limit
%   L: number of sites
%   zoneLength: length of zones
%   density: average density
%   Output:
%   v_lim: calculated speed limits for all sites.

    nZones = floor(L/zoneLength); % number of zones with different speed limits
    l=1:zoneLength; % index referring to sites for a given zone
    k = 1:nZones; % zone index
    n_cars_z = zeros(1,nZones); % number of cars in each zone
    c = zeros(1,nZones); % density of cars in each zone
    k0=mod(k-1-1,nZones)+1; % zone before zone k

    v_zones = zeros(1,nZones); % speed limit for a given zone

    for kk = k;
        s = (kk-1)*zoneLength+l; % coordinates of zone k
        cars_z = find((min(s)<=x)&(x<=max(s))); % coordinates of cars in zone
        n_cars_z(kk) = numel(cars_z); % number of cars in zone kk
        c(kk) = n_cars_z(kk)/zoneLength; % density of cars in zone kk
        if c(kk) > density % assignment of speed limits to zones
        % if rand < 0.5 % Use this line instead of the above to create random speed limits
            v_zones(k0(kk))=v_min;
        else
            v_zones(k0(kk))=v_max;
        end
    end

    v_lim = repmat(v_zones,[zoneLength,1]); % writing speed limits into vector.
    v_lim = v_lim(:);
    v_lim = v_lim';

end