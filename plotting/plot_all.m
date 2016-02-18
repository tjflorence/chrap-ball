cd('/Users/florencet/Documents/matlab_root/chrap-ball/meeting_and_analysis/data')

dayfiles = dir('2016*');
for bb = 1:length(dayfiles)
    
    cd(dayfiles(bb).name)
    expfiles = dir('2016*');

    for aa = 1:length(expfiles)

        cd(expfiles(aa).name)
        plot_conf_trial_summary(pwd)
        plot_tuning_summary(pwd)
        
        cd('..')
    end
    
    cd('..')

end