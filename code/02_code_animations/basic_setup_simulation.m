% Script generates a movie of the basic simulation setup
% Car color corresponds to car velocity

figure1 = figure('Color',[1 1 1]);
hold on;

% Parameters
noSites=70;
N=noSites;
timeLength=50;
L=100;
c= 0.4;
p=0.2;
v_max=10;


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


hold on;
h1=plot((0:N), 0*(0:N), 'Color', [.75 .75 .75], 'LineWidth', 5);
xlim([0 N/3])
ylim([-N/10 N/10]);
set(gca,'Visible','off')

%AVI
aviobj=avifile('basic_setup_simulation.avi','compression','None');
aviobj.Quality=100;
aviobj.fps=15;

for t=1:size(Coordinates_1,1)
    clf();
    hold on;
    subplot(3,4,1:12);hold on;
    plot((0:N), 0*(0:N), 'Color', [.75 .75 .75], 'LineWidth', 5);
    xlim([0 N/3])
    ylim([-N/10 N/10]);
    set(gca,'Visible','off')
    
      
    for s=1:size(Coordinates_1,2)
        draw_car(Coordinates_1(t,s), 0, 0.8, 0.2,Velocity_1(t,s),v_max,h1);
    end

    for frame_rep=1:10
        frame=getframe(gcf);
        newName = sprintf('image%05d.jpg',t);
        aviobj = addframe(aviobj,frame);
    end
    
    pause(0.1);
end
