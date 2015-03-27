% 获取一幅图像的feature，是检索子过程
function feature = get_feature(im)
set_config;
resize_coeff = min(config.max_image_length / size(im, 1), ...
    config.max_image_length / size(im, 2));
% 获取sift特征点对应的feature
[~, sift] = vl_sift(im2single(rgb2gray(imresize(im, resize_coeff))));
sift = double(sift);
center = [];
load(['./data/center-', num2str(config.cluster_num), '.mat'], 'center');
load(['./data/kd-center-', num2str(config.cluster_num), '.mat'], 'kd_center');
feature = zeros(size(center, 2), 1);
for i = 1:size(sift, 2)
    [min_distance_index, ~] = vl_kdtreequery(kd_center, center, sift(:, i));
    feature(min_distance_index, 1) = feature(min_distance_index, 1) + 1;
end
% 归一化
feature = feature / norm(feature);
% 获取颜色直方图和颜色矩对应的feature
if config.use_color_feature == true
	color_feature = get_color_feature(imresize(im, resize_coeff));
	feature = [feature; color_feature * config.color_coeff];
end
% 返回
end
