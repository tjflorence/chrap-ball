clear all

daydir = '/Users/florencet/Documents/matlab_root/chrap-ball/meeting_and_analysis/data/dir';

cd(daydir)

expfiles = dir('2016*');


for aa = 1:length(expfiles)

    cd(expfiles(aa).name)

    % load a file and get the settings
    tfiles = dir('env_*');
    load(tfiles(1).name)

    creps = expr.settings.num_reps;
    cpower = expr.settings.light_power;

    on_frame = 1500;
    end_frame = expr.c_trial.data.count;

    summary_data.vsum_ctr = nan(creps, 3000);
    summary_data.vsum_left = nan(creps, 3000);
    summary_data.vsum_right = nan(creps, 3000);
    
    summary_data.vfwd_left = nan(creps, 3000);
    summary_data.vfwd_ctr = nan(creps, 3000);
    summary_data.vfwd_right = nan(creps, 3000);
    
    summary_dat.om_left = nan(creps, 3000);
    summary_data.om_ctr = nan(creps, 3000);
    summary_data.om_right = nan(creps, 3000);
    
    summary_data.vss_left = nan(creps, 3000);
    summary_data.vss_ctr = nan(creps, 3000);
    summary_data.vss_right = nan(creps, 3000);
    
    
    for ii = 1:length(tfiles)
   
        load(tfiles(ii).name)
        expr.c_trial.data.vSum = nan(1, end_frame);
    
        expr.c_trial.data.vfwd = expr.c_trial.data.vfwd(1:end_frame);
        expr.c_trial.data.vss = expr.c_trial.data.vss(1:end_frame);
        expr.c_trial.data.om = expr.c_trial.data.om(1:end_frame);
    
        for jj = 1:end_frame
    
            expr.c_trial.data.vSum(jj) = abs(expr.c_trial.data.vfwd(jj)) + ...
                                        abs(expr.c_trial.data.vss(jj)) + ...
                                        abs(expr.c_trial.data.om(jj));
                                    

        end
    
    
    
        expr.c_trial.data.vfwd_mod = [sum(abs(expr.c_trial.data.vfwd(1:on_frame))) sum(abs(expr.c_trial.data.vfwd(on_frame:end_frame)))];
        expr.c_trial.data.vss_mod = [sum(abs(expr.c_trial.data.vss(1:on_frame))) sum(abs(expr.c_trial.data.vss(on_frame:end_frame)))];
        expr.c_trial.data.om_mod = [sum(abs(expr.c_trial.data.om(1:on_frame))) sum(abs(expr.c_trial.data.om(on_frame:end_frame)))];
        expr.c_trial.data.vsum_mod = [sum(abs(expr.c_trial.data.vSum(1:on_frame))) sum(abs(expr.c_trial.data.vSum(on_frame:end_frame)))];
   
        expr.c_trial.data.d_vfwd = [0; expr.c_trial.data.vfwd(2:end)-expr.c_trial.data.vfwd(1:end-1)];
        expr.c_trial.data.d_vss = [0; expr.c_trial.data.vss(2:end)-expr.c_trial.data.vss(1:end-1)];
        expr.c_trial.data.d_om = [0; expr.c_trial.data.om(2:end)-expr.c_trial.data.om(1:end-1)];
        
        save(tfiles(ii).name, 'expr')
        
    end
    
    cfiles = dir('*_CENTER*');
    lfiles = dir('*_LEFT*');
    rfiles = dir('*_RIGHT*');
    
    for bb = 1:length(cfiles)
        
        load(cfiles(bb).name)
        
        summary_data.vfwd_ctr(bb, :) = expr.c_trial.data.vfwd;
        summary_data.vsum_ctr(bb, :) = expr.c_trial.data.vSum;
        summary_data.om_ctr(bb,:) = expr.c_trial.data.om;
        summary_data.vss_ctr(bb,:) = expr.c_trial.data.vss;

    end
    
    for bb = 1:length(lfiles)
        
        load(lfiles(bb).name)
        
        summary_data.vfwd_left(bb, :) = expr.c_trial.data.vfwd;
        summary_data.vsum_left(bb, :) = expr.c_trial.data.vSum;
        summary_data.om_left(bb,:) = expr.c_trial.data.om;
        summary_data.vss_left(bb,:) = expr.c_trial.data.vss;

    end

    for bb = 1:length(rfiles)
        
        load(rfiles(bb).name)
        
        summary_data.vfwd_right(bb, :) = expr.c_trial.data.vfwd;
        summary_data.vsum_right(bb, :) = expr.c_trial.data.vSum;
        summary_data.om_right(bb,:) = expr.c_trial.data.om;
        summary_data.vss_right(bb,:) = expr.c_trial.data.vss;

    end
        
    save('summary_data.mat', 'summary_data')
  
    cd(daydir)

end