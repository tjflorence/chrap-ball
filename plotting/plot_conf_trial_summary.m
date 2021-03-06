function plot_conf_trial_summary(expdir)

homedir = pwd;
cd(expdir)

load('summary_data.mat')


cmap = [255, 240, 60;...
        255, 87, 114;...
        91, 113, 204;...
        59, 178, 101]/255;
close all


for jj = 1:11

close all
f1 = figure('Position', [48 -205 763 897], 'color', 'w', 'visible', 'off');

%% vsum
s1 = subplot(4, 1, 1 );
title('\Sigma abs rotation','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on

xvals = 1:3000;
yvals = summary_data(jj).mean_vsum;
z1 = std(summary_data(jj).raw_vsum);
z2 = z1;

zh = fill([1500 3000 3000 1500], [-100 -100 100 100], 'r');
set(zh, 'EdgeColor', 'none');
alpha(zh, .1)


confplot(xvals, yvals, z1, z2, [0 0 0])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)

text(2200, 11, [num2str((summary_data(jj).cpower+5)/10*100) '% duty cycle'], 'fontsize', 25)

ylim([0 10])
xlim([0 3000])

%% vfwd
s2 = subplot(4, 1, 2 );
title('pitch (fwd)','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on

xvals = 1:3000;
yvals = summary_data(jj).mean_vfwd;
z1 = std(summary_data(jj).raw_vfwd);
z2 = z1;

zh = fill([1500 3000 3000 1500], [-100 -100 100 100], 'r');
set(zh, 'EdgeColor', 'none');
alpha(zh, .1)

plot([-10000 10000], [0 0], 'k')

confplot(xvals, yvals, z1, z2, [0 0 0])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)

%plot(summary_data(jj).mean_vfwd, 'k')

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)

xlim([0 3000])
ylim([-5 5])


%% vss
s3 = subplot(4, 1, 3 );
title('yaw (az)','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')

hold on

xvals = 1:3000;
yvals = summary_data(jj).mean_om;
z1 = std(summary_data(jj).raw_om);
z2 = z1;

zh = fill([1500 3000 3000 1500], [-100 -100 100 100], 'r');
set(zh, 'EdgeColor', 'none');
alpha(zh, .1)

plot([-10000 10000], [0 0], 'k')

confplot(xvals, yvals, z1, z2, [0 0 0])

%plot(summary_data(jj).mean_vss, 'k')
ylim([-5 5])
xlim([0 3000])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)



%% vss
s4 = subplot(4, 1, 4 );
title('roll (ss)','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
xvals = 1:3000;
yvals = summary_data(jj).mean_vss;
z1 = std(summary_data(jj).raw_vss);
z2 = z1;

zh = fill([1500 3000 3000 1500], [-100 -100 100 100], 'r');
set(zh, 'EdgeColor', 'none');
alpha(zh, .1)

plot([-10000 10000], [0 0], 'k')

confplot(xvals, yvals, z1, z2, [0 0 0])

%plot(summary_data(jj).mean_vss, 'k')
ylim([-5 5])
xlim([0 3000])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {'0', '15', '30', '45', '60'}, 'Fontsize', 22)

xlabel('time (sec)', 'fontsize', 25)
ylabel('ticks (au)', 'fontsize', 25)


set(f1, 'Units', 'Inches')
pos = get(f1, 'position');
set(f1, 'PaperPositionMode','Auto',...
    'PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

mkdir('plots')
cd('plots')

print(f1, ['conf_summary_duty_' num2str(((jj-1)/10)*100)  '_pct.pdf'], '-dpdf', '-r0', '-opengl');
cd('..')

end

cd(homedir)
close all

end
