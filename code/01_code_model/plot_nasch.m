function [] = plot_nasch(L, time, c, p, v_max)
%PLOT_NASCH Plot all states time vs. position of Nagel-Schreckenberg algorithm
%(see function 'traffic_project'). The output is saved under file name
%'plot_nasch'.
%   PLOT_NASCH(sites, time, p_car, p_rand, v_max)
%   Input arguments: 
%   sites: the number of sites (length of highway)
%   time: the number of iterations until the algorithm stops
%   p_car: probability that a site is occupied by a car at time 0
%   p_rand: probability that a car randomly brakes
%   v_max: maximum velocity (integer number)

    fSze1 = 20;
    fSze2 = 14;
    image_data = sim_nasch(L, time, c, p, v_max);

    scrsz = get(0,'ScreenSize');
    figure('Position',[1 scrsz(4)/1.5 scrsz(3)/1.5 scrsz(4)/1.5]);
    colmap = jet(v_max+3);
    colmap = [[1 1 1]; [1 0 0]; colmap((end-2):(-1):3,:); [0 0 1]]; % bad solution to fix first and last color to blue and red!
    colormap(colmap);
    data_plot = image_data+1;
    image(data_plot);
    set(gca,'FontSize',fSze2);
    axis xy;
    ylabel('time','fontSize',fSze1)
    xlabel('position','fontSize',fSze1)
    % Create labels for colorbar:
    labels = cell(1,v_max+2);
    for k=1:(v_max+1)
        labels{k}=['v = ',num2str(k-1)];
    end
    
    h = colorbar('YTickLabel',labels);
    set(h,'Ylim',[1.5 v_max+2.5]);
    set(h,'YTick',2:(v_max+2));
    set(h,'fontSize',fSze2)
    
    set(gca,'XTick',0:10:100)

    set(gcf,'PaperUnits','centimeters')
    set(gcf,'Units','centimeters')

    xSize = 20;
    ySize = 15;
    xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
    set(gcf,'PaperPosition',[xLeft yTop xSize ySize])
    set(gcf,'Position',[0 0 xSize ySize])
    print('-dbmp', 'plot_nasch')

end