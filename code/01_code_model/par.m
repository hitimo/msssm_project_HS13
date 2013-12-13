% Parameters for running simulations
% default choices in brackets (fast simulation, long simulation)

clear all;

% global parameters (for all models):

nSim=10; % (10,100) number of simulations for averaging
t0= 10; % (10,10) time after which measurements are taken

L = 1000; % (1000,1000) length of road
time = 1000; % (100,1000) number of time steps
p = 0.25; % (0.25) random brake parameter

c = 0:0.05:1; % (0:0.05:1,0:0.01:1) density of cars

v_max = 5; % (5)

% parameters for specific models:

% NaSch
v_max_nasch=[1,2,3,4,5]; % ([1,2,3,4,5]) different maximum velocities
p_nasch = [0,0.25,0.5,0.75]; % different random brake parameters

% ACC
d0 = [0,1,2]; % ([0,1,2]) length of additional distance between cars
d0_default = 1; % d0 for plot of velocity distribution

% FSL
v_min = [1,2,3,4,5]; % ([1,2,3,4,5]) low speed limit
v_min_default = 3;
dt = 50; % (50) time for which imposed speed limits are valid
nZones = 10; % (10) number of zones with different speed limits


save('par');