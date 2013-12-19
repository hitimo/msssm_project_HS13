% Script generates a movie of the traffic jams and velocity distribution
% Car color corresponds to car velocity

figure1 = figure('Color',[1 1 1]);
hold on;

% Parameters
noSites=70;
timeLength=100;
L=100;
c= 0.4;
p=0.2;
v_max=10;
N=noSites;

% Set random values
rng('default');
road = zeros(1,L); % variable representing road with values 1: site occupied, 0: site unoccupied
image = zeros(timeLength,L); % road for all times


for k=1:L
    if rand < c
        road(k)=1; % definition of initial configuration
    end
end


%% Nagel-Schreckenberg
[~,Coordinates_1,Velocity_1]=sim_nasch(noSites, timeLength, c, p, v_max,road);

%% Flexible Speed Limits
v_min=3; dt=10; nZones=10;
[~,Coordinates_2,Velocity_2,speed_limits] = sim_fsl(L, timeLength, c, p, v_min, v_max, dt, nZones,road);

%% Adaptive Cruise control
d0=1;
[~,Coordinates_3,Velocity_3] = sim_acc(L, timeLength, c, p,v_max,d0,road);

% Calculate cars driving
for t=1:size(Coordinates_1,1)
    for s=1:size(Coordinates_1,2)
        frac1(t)=sum(Velocity_1(t,:)~=0)/size(Coordinates_1,2);
        frac2(t)=sum(Velocity_2(t,:)~=0)/size(Coordinates_1,2);
        frac3(t)=sum(Velocity_3(t,:)~=0)/size(Coordinates_1,2);
    end
end

% Lower left plot
subplot(4,4,13:15);hold on;
plot([1:timeLength],frac1,'Color', [0.0, 0.48, 0.65],'LineWidth',2);
plot([1:timeLength],frac2,'Color', [1.0, 0.27, 0.0],'LineWidth',2);
h2=plot([1:timeLength],frac3,'Color', [0.33, 0.42, 0.18],'LineWidth',2);

% Bar plot
subplot(4,4,16);
h3=bar([frac1(1),frac2(1),frac3(1)]);


% Plot lanes
subplot(4,4,1:12);hold on;
h1=plot((0:N), 0*(0:N)+4,...
    (0:N), 0*(0:N)-4,...
    (0:N), 0*(0:N), 'Color', [.75 .75 .75], 'LineWidth', 5);
xlim([0 N/3])
ylim([-N/10 N/10]);
set(gca,'Visible','off')

time=1:size(Coordinates_1,1);
subplot(4,4,13:15);
hold on;
h5=plot([time(1),time(1)],[0,1],'k','LineWidth',2);
xlim([0,90]);

%AVI
aviobj=avifile('jam_final_1217_real.avi','compression','None');
aviobj.Quality=100;

%Start simulation
for t=1:size(Coordinates_1,1)-10
    if t>1
        cla(h1);
    end
    hold on;
    subplot(4,4,1:12);hold on;
    plot((0:N), 0*(0:N)+4,...
        (0:N), 0*(0:N)-4,...
        (0:N), 0*(0:N), 'Color', [.75 .75 .75], 'LineWidth', 5);
    xlim([0 N/2])
    ylim([-N/10 N/10])
    
    
    subplot(4,4,13:15)
    set(h5,'Xdata',[time(t),time(t)],'Ydata',[0,1]);
    xlabel('time t [s]');
    ylabel('Cars driving (t)')
    xlim([0,90]);
    
    subplot(4,4,16)
    colorbars(frac1,frac2,frac3,t,1);
    
    subplot(4,4,1:12);hold on;
    for s=1:size(Coordinates_1,2)
        draw_car(Coordinates_1(t,s), 0, 0.8, 0.2,Velocity_1(t,s),v_max,h1);
        draw_car(Coordinates_2(t,s), 4, 0.8, 0.2,Velocity_2(t,s),v_max,h1);
        draw_car(Coordinates_3(t,s), -4, 0.8, 0.2,Velocity_3(t,s),v_max,h1);
    end
    
    % Generate movie frames
    for frame_rep=1:10
        frame=getframe(gcf);
        newName = sprintf('image%05d.jpg',t);
        aviobj = addframe(aviobj,frame);
    end
end
