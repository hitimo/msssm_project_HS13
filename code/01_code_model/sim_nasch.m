function [image,position,velocity] = sim_nasch(L, time, c, p, v_max)
%SIM_NASCH Implementation of Nagel-Schreckenberg cellular automaton model of
%vehicular traffic on a ring.
%   SIM_NASCH(L, time, c, p, v_max)
%   Input arguments: 
%   L: the number of sites (length of road)
%   time: the number of iterations until the algorithm stops
%   c: probability that a site is occupied by a car at time 0
%   p: probability that a car randomly brakes
%   v_max: maximum velocity (integer number)
%   Output:
%   image: Matrix with row index representing time and column index 
%   representing position with values:
%       0: unoccupied site
%       1,2,.., v_max+1: velocity 0,1,...,v_max
%   position / velocity: coordinates and velocities of all cars.

    road = zeros(1,L); % variable representing road with values 1: site occupied, 0: site unoccupied
    image = zeros(time,L); % road for all times

    for k=1:L
        if rand < c
            road(k)=1; % definition of initial configuration
        end
    end

    x = find(road==1); % positions of cars
    N = numel(x); % number of cars, does not change due to circular road
    v = zeros(1,N); % velocity (initial velocity set to 0)

    position = zeros(time,N); % positions for all times
    velocity = zeros(time,N); % velocities for all times

    % main Nagel-Schreckenberg algorithm:
    for t=1:(time) % Loop iterating over time
        x0=x; % store old coordinates for parallel update
        for n=1:N % Loop iterating over cars
            v(n) = min(v(n)+1,v_max); % increase velocity if velocity smaller than maximum velocity
            d = mod(x0(mod(n,N)+1) - x0(n),L); % distance to next car, mod function to account for periodic boundary conditions
            v(n) = min(v(n),d-1); % if v >= d, speed is reduced to d-1
            if rand < p % decrease velocity with prob. p
                v(n) = max(v(n)-1,0); % decrease velocity by 1 except when v=0
            end
            x(n) = mod(x0(n)+v(n)-1,L)+1; % move car according to velocity
        end
        road(:)=0;
        for k=0:(v_max)
            road(x0(v==k)) = k+1; % road for current time
        end
        image(t,:)=road; % write values of road into matrix for all times
        position(t,:) = x0; % store positions
        velocity(t,:) = v; % store velocities
    end
end