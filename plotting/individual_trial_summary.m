cd('/Users/florencet/Documents/matlab_root/chrap-ball/meeting_and_analysis/data/2016-02-10/20160210111452_HC-Gal4xUAS-20x-Chr_calib_chr_intensity')
load('summary_data.mat')

jj = 11;

cmap = [255, 240, 60;...
        255, 87, 114;...
        91, 113, 204;...
        59, 178, 101]/255;
close all

f1 = figure('Position', [48 -205 763 897], 'color', 'w');

%% vsum
s1 = subplot(4, 1, 1 );
title('\Sigma|rotation|','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
for ii = 1:4
    
    plot(summary_data(jj).raw_vsum(ii,:),...
        'color', cmap(ii, :), ...
        'linewidth', .5)

end

%plot(summary_data(jj).mean_vsum, 'k')
ylim([0 10])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)


text(2200, 11, [num2str((summary_data(jj).cpower+5)/10*100) '% duty cycle'], 'fontsize', 25)

    
%% vfwd
s2 = subplot(4, 1, 2 );
title('Vfwd','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
for ii = 1:4
    
    plot(summary_data(jj).raw_vfwd(ii,:),...
        'color', cmap(ii, :), ...
        'linewidth', .5)

end

%plot(summary_data(jj).mean_vfwd, 'k')
ylim([-2 5])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)
%% vss
s3 = subplot(4, 1, 3 );
title('Vss','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
for ii = 1:4
    
    plot(summary_data(jj).raw_vss(ii,:),...
        'color', cmap(ii, :), ...
        'linewidth', .5)

end

%plot(summary_data(jj).mean_vss, 'k')
ylim([-3 3])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)

%% vom
s3 = subplot(4, 1, 3 );
title('Vom','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
for ii = 1:4
    
    plot(summary_data(jj).raw_om(ii,:),...
        'color', cmap(ii, :), ...
        'linewidth', .5)

end

%plot(summary_data(jj).mean_om, 'k')
ylim([-5 5])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {}, 'Fontsize', 22)

%% vss
s3 = subplot(4, 1, 4 );
title('Vss','fontsize', 20,'Units', 'normalized', ...
'Position', [0 1], 'HorizontalAlignment', 'left')
hold on
for ii = 1:4
    
    plot(summary_data(jj).raw_vss(ii,:),...
        'color', cmap(ii, :), ...
        'linewidth', .5)

end

%plot(summary_data(jj).mean_vss, 'k')
ylim([-3 3])

set(gca, 'XTick', [0 750 1500 2250 3000], ...
    'XTicklabel', {'0', '15', '30', '45', '60'}, ...
    'FontSize', 22)

xlabel('time (sec)', 'fontsize', 25)
ylabel('ticks (au)', 'fontsize', 25)