% ��ȡ����ͼ���sift�������Ӧ������(BOW)
get_sift_histograms;
% ��ȡ����ͼ�����ɫ����
color_features = zeros(25 * config.division * config.division, size(name_list, 1));
for i = 1:size(name_list, 1)
    im = imread([config.directory, name_list{i}]);
    resize_coeff = min(config.max_image_length / size(im, 1), ...
           config.max_image_length / size(im, 2));
    im = imresize(im, resize_coeff);
    color_features(:, i) = get_color_feature(im);
end
save(['./data/features-color-', num2str(config.division)], 'color_features')
