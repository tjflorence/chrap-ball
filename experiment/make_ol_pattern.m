%% Starfield_minimal motion
clear all
save_directory = '/Users/florencet/Documents/matlab_root/chrap-ball/experiment/exp_patterns/';

% generate patterns
gs_val = 3;
row_compression = 0;

Pats = [zeros(32, 8), 7*ones(32, 8)];
Pats = repmat(Pats, [1 6]);

pattern.Pats        = Pats;
pattern.x_num       = size(Pats, 2);
pattern.y_num       = size(Pats, 1);
pattern.num_panels  = 48;
pattern.gs_val      = gs_val;     
pattern.row_compression = row_compression; 
panel_id_map =                  [ 4 11  7  3 10  6  2  9  5  1 12  8 ; 
                                 16 23 19 15 22 18 14 21 17 13 24 20 ;
                                 28 35 31 27 34 30 26 33 29 25 36 32 ;
                                 40 47 43 39 46 42 38 45 41 37 48 44 ];%for fly treadmill id
pattern.Panel_map = panel_id_map;

pattern.BitMapIndex = process_panel_map(pattern);
pattern.data = Make_pattern_vector(pattern);

pattern_name = ['Pattern_stripes_gsval_' num2str(gs_val)];
save([save_directory pattern_name],'pattern');
