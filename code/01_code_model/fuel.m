function [ fuel ] = fuel( x, v, L )
%FUEL Calculate fuel consumption per distance in a simple model only 
%considering only acceleration energy E=v^2.
%   FUEL(x,v,L) calculates the mean fuel consumption per distance of a
%   single car where x, v are the coordinates & velocities of the cars for 
%   all times and positions and L is the length of the road.

    sz=size(x);
    time = sz(1);

    k=2:time;
    
    d=mod(x(k,:)-x(k-1,:),L); % distance covered by each car in each iteration
    
    deltaE = v(k,:).^2-v(k-1,:).^2; % kinetic energy differences due to acceleration
    deltaE(deltaE<0)=0; % only positive energy differences (acceleration)
    
    fuel=sum(sum(deltaE)); % total fuel consumption
    dist = sum(sum(d)); % total distance
    fuel = fuel/dist; % average fuel per distance 

end