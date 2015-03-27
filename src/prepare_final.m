% 所有预处理过程
set_config;
setup;
get_sift_points;
get_name_list;
clearvars -except sifts name_list config;
cluster;
clearvars -except sifts center label name_list config
get_features;
clearvars
