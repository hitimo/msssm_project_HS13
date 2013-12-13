function [ ] = plot_simresults( c, var1, var2, ylab, ylims )
%PLOT_SIMRESULTS: function to plot results of simulations

set(gcf,'PaperUnits','centimeters')
set(gcf,'Units','centimeters')
fSze1 = 20;
fSze2 = 14;

colmap=lines(numel(var1));
colmap = colmap(end:-1:1,:);

for l = 1:numel(var1)
    plot(c,var2(l,:),'LineWidth',1.5,'color',colmap(l,:));
    hold all
end
hold off;

if exist('ylims')
    ylim(ylims);
end


set(gca,'FontSize',fSze2);

xSize = 15;
ySize = 10;
xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
set(gcf,'PaperPosition',[xLeft yTop xSize ySize])
set(gca,'XTick',0:0.1:1)



xlabel('density \it{c}','fontSize',fSze1);
ylabel(ylab,'fontSize',fSze1);


end

