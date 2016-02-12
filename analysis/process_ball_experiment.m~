daydir = '/Users/florencet/Documents/matlab_root/chrap-ball/meeting_and_analysis/data/2016-02-10';

cd(daydir)

expfiles = dir('2016*');

pvec = [-5:1:5];

for aa = 1:length(expfiles)
    cd(expfiles(aa).name)
    %clear all

    % process ball experiment

    %cd(expdir)

    %fix names
    messy_names = dir('*0e+0*');

    for ii = 1:length(messy_names)
        split_name = strsplit(messy_names(ii).name, '-4.99');
        new_name = [split_name{1} '-5.mat'];

        movefile(messy_names(ii).name, new_name)
    end

    % load a file and get the settings
    tfiles = dir('env_*');
    load(tfiles(1).name)

    creps = expr.settings.num_reps;
    cpower = expr.settings.light_power;
    cpower(1) = -5;

    on_frame = 1500;
    end_frame = expr.c_trial.data.count;

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
    
    for bb = 1:length(pvec)
            
       summary_data(bb).cpower = pvec(bb);
            
       if pvec(bb) < 0 
            ctext = num2str(pvec(bb));
       else
             ctext = ['0' num2str(pvec(bbgfh))];
       end           
            
        cfiles = dir(['*power_' ctext '.mat']);
            
        summary_data(bb).raw_vfwd = nan(4, end_frame);
        summary_data(bb).raw_vss = nan(4, end_frame);
        summary_data(bb).raw_om = nan(4, end_frame);
        summary_data(bb).raw_vsum = nan(4, end_frame);
        
        summary_data(bb).raw_vsum_mod = nan(4,2);
        summary_data(bb).raw_vss_mod = nan(4,2);
        summary_data(bb).raw_om_mod = nan(4,2);
        summary_data(bb).raw_vfwd_mod = nan(4,2);
        
        for cc = 1:length(cfiles)
                
            load(cfiles(cc).name)
            summary_data(bb).raw_vfwd(cc,:) = expr.c_trial.data.vfwd';
            summary_data(bb).raw_vss(cc,:) = expr.c_trial.data.vss';
            summary_data(bb).raw_om(cc,:) = expr.c_trial.data.om';
            summary_data(bb).raw_vsum(cc,:) = expr.c_trial.data.vSum';
            
            summary_data(bb).raw_vsum_mod(cc,:) = expr.c_trial.data.vsum_mod;
            summary_data(bb).raw_vss_mod(cc,:) = expr.c_trial.data.vss_mod;
            summary_data(bb).raw_om_mod(cc, :) = expr.c_trial.data.om_mod;
            summary_data(bb).raw_vfwd_mod(cc,:) = expr.c_trial.data.vfwd_mod;
            
        end            
 
        summary_data(bb).mean_vfwd = mean(summary_data(bb).raw_vfwd);
        summary_data(bb).mean_vss = mean(summary_data(bb).raw_vss);
        summary_data(bb).mean_om = mean(summary_data(bb).raw_om);
        summary_data(bb).mean_vsum = mean(summary_data(bb).raw_vsum);
            
        summary_data(bb).mean_vsum_mod = mean(summary_data(bb).raw_vsum_mod);
        summary_data(bb).mean_vss_mod = mean(summary_data(bb).raw_vss_mod);
        summary_data(bb).mean_om_mod = mean(summary_data(bb).raw_om_mod);
        summary_data(bb).mean_vfwd_mod = mean(summary_data(bb).raw_vfwd_mod);
            
     end
    save('summary_data.mat', 'summary_data')
  
    cd(daydir)

end