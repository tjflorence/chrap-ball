f1 = figure('position', [50 203 875 498], 'color', 'w');

load('summary_data.mat')

for ii = 1:11


    for jj = 1:4
       
         
        s1 = scatter(ii, summary_data(ii).raw_vsum_mod(jj,2), 500);
        hold on
        
        set(s1, 'MarkerEdgeColor', 'none', 'markerfacecolor', 'k')
        alpha(s1, .2)
        
        
        
    end


end

xlim([.5 11.5])
ylim([0 10000])

summ_vec = nan(1,11);
for ii = 1:11
    ivals = summary_data(ii).raw_vsum_mod(:,2);
    summ_vec(ii) = median(ivals);
    
end

plot(summ_vec, 'linewidth', 2, 'color', 'r')
set(gca, 'YTick', [1000 2000 3000 4000 5000], 'XTick', [1 6 11], ...
    'XTickLabel', {'0%', '50%', '100%'}, 'Fontsize', 25)
ylabel('sum(abs(rot))', 'fontsize', 30)
xlabel('duty cycle', 'fontsize', 30)