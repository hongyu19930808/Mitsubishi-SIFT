% 给定一张图片，进行检索
function [result_list, distances_original, directory] = retrival(srcImage)
tic;
% 准备工作
set_config;
setup;
name_list = [];
features = [];
load('./data/name-list.mat', 'name_list');
load(['./data/features-sift-', num2str(config.cluster_num), '.mat'], 'features');
if config.use_color_feature == true
	color_features = [];
	load(['./data/features-color-', num2str(config.division), '.mat'], 'color_features');
	features = [features; color_features * config.color_coeff];
end
image_count = size(features, 2);
distances_original = zeros(1, image_count);
% 获取图片feature
src_feature = get_feature(srcImage);
% 计算距离并检索
for i = 1:image_count
    distances_original(1, i) = norm(features(:, i)-src_feature);
end
[~, indices] = sort(distances_original);
result_list = cell(image_count, 1);
for i = 1:image_count
    result_list{i} = name_list{indices(i)};
end
directory = config.directory;
toc;
end
