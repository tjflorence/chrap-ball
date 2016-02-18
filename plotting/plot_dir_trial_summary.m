function plot_dir_trial_summary(expdir)

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
f1 = figure('Position', [48 -205 763 897], 'color', 'w');

%% vsum
s1 = subplot(4, 1, 1 );
title('\Sigma abs rotation','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on


xvals = 1:3000;
yvals = mean(summary_data.vsum_ctr);
z1 = std(summary_data.vsum_ctr);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 0])

yvals = mean(summary_data.vsum_left);
z1 = std(summary_data.vsum_left);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 1])

yvals = mean(summary_data.vsum_right);
z1 = std(summary_data.vsum_right);
z2 = z1;
confplot(xvals, yvals, z1, z2, [1 0 0])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)


ylim([0 10])
xlim([0 3000])

%% vfwd
s2 = subplot(4, 1, 2 );
title('pitch (fwd)','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on


plot([-10000 10000], [0 0], 'k')

xvals = 1:3000;
yvals = mean(summary_data.vfwd_ctr);
z1 = std(summary_data.vfwd_ctr);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 0])


yvals = mean(summary_data.vfwd_left);
z1 = std(summary_data.vfwd_left);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 1])


yvals = mean(summary_data.vfwd_right);
z1 = std(summary_data.vfwd_right);
z2 = z1;
confplot(xvals, yvals, z1, z2, [1 0 0])


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


plot([-10000 10000], [0 0], 'k')

xvals = 1:3000;
yvals = mean(summary_data.om_ctr);
z1 = std(summary_data.om_ctr);
z2 = z1;

confplot(xvals, yvals, z1, z2, [0 0 0])


yvals = mean(summary_data.om_left);
z1 = std(summary_data.om_left);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 1])

yvals = mean(summary_data.om_right);
z1 = std(summary_data.om_right);
z2 = z1;
confplot(xvals, yvals, z1, z2, [1 0 0])

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



plot([-10000 10000], [0 0], 'k')


xvals = 1:3000;
yvals = mean(summary_data.vss_ctr);
z1 = std(summary_data.vss_ctr);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 0])

yvals = mean(summary_data.vss_left);
z1 = std(summary_data.vss_left);
z2 = z1;
confplot(xvals, yvals, z1, z2, [0 0 1])

yvals = mean(summary_data.vss_right);
z1 = std(summary_data.vss_right);
z2 = z1;
confplot(xvals, yvals, z1, z2, [1 0 0])

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



end