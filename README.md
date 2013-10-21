# MATLAB HS13 – Research Plan (Template)
(text between brackets to be removed)

> * Group Name: (be creative!)
> * Group participants names: Claudia Deuber, Jacqueline Mock, Timo Hinzmann, Patrick Seewald
> * Project Title: (can be changed)

## General Introduction

Self Organizing Criticality (SOC) is a theory originally from physics that can be applied to a great variety of problems 

ranging from forest fires, to sandpiles, neuronal networks and also traffic situations. The idea is that there is a 

critical point defining limits to a system of independent agents. For instance, this can be the critical density of a 

forest allowing a forestfire to spread or the maximal slope a pile of sand can reach before it collapses.

There have been several investigations on critical densities for traffic in order to reach maximal efficiency in terms of 

traffic flow without jamming the system.The goal of this project is to measure different parameters and disturbances which 

have an impact on the critical point of a traffic system. In order to model the traffic situation we are going to apply a 

1D cellular automata based model the Nagel-Schreckenberg Cellular automata model.

The advantage of this model is that it is a highly practical application for traffic jams which is an everyday problem and 

it is interesting to investigate on obstacles to it. The goal of our project is therefore to first establish a simple model 

and to modify it gradually with respect to different parameters in order to find out about the impact on the critical 

point.

The cellular automata model is appropriate because it allows single agents to act depending on the neighbours' actions, 

which is the case in a traffic system. For instance the number of cars driving at a given period of time at a given 

velocity can possibly be disturbed by just one driver driving too slow or the whole group of cars can be slowed down by a 

global obstacle such as a steep curve forcing the first car to slow down massively.

There have been different investigations on similar models and on this very model in the past. One interesting conclusion 

was that the optimum for traffic flow in terms of maximal use of streets without blocking or jamming the sistem lies close 

to the critical point (Self-organized Criticality and 1/f noise in traffic by Maya Paczuski and Kai Nagel, Feb 1996).


## The Model

The traffic simulation should be based on the behaviour of single cars, dependent on the distance (and eventually the 

velocity) of the leading vehicle, in a cellular-automaton model. The cellular-automaton model is chosen because it is 

simple, allowing for an investigation of a large number of cars. The Nagel-Schreckenberg model is taken as a basis, whose 

most important parameters are:
- the initial configuration of vehicles
- the maximum velocity (speed limit)
- the probability for a random change of velocity
By local changes of velocity and by adding or removing cars most common traffic situations (e.g. curves, gateways, 

individual behaviour of drivers) can be considered in the model.


## Fundamental Questions

 - To what extent do modifications of parameters in the model influence the attainment of the critical point?
 - By changing the input parameters or adding an incident is the model still acting like a self-organized-Crtical System?	
	- How fast or in how many time steps does the model reaches the critical point?
	- Which possibilities exist to avoid traffic jams ?
      		- Can speed limits speed up traffic / avoid traffic jams?
    	- What influence does the behaviour of the drivers have on the traffic flux?


## Expected Results

Everything is possible ;) 

## References 

Statistical physics of vehicular traffic and some related systems, Debashish Chowdhury, Ludger Santen and Andreas 

Schadschneider
o Self-organized criticality and 1/f noise in traffic, 1996, Maya Paczuski and Kai Nagel
o Traffic and related self-driven many-particle systems, Oct. 2001, Reviews of modern physics, vol. 73, Dirk Helbing


We modify the parameters of the 'Nagel-Schreckenberg cellular automata model' in order to investigate on how the critical 

point (SOC) is influenced by this.

## Other
(optional) Statistik Schweiz
