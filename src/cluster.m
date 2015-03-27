% 对所有图像的sift特征点进行聚类
num_of_sifts = 0;
for i = 1:size(sifts, 1)
    num_of_sifts = num_of_sifts + size(sifts{i, 1}, 2);
end
if num_of_sifts ~= 0
    combined = zeros(size(sifts{i, 1}, 1), num_of_sifts);
    index = 0;
    for i = 1:size(sifts, 1)
        combined(:, index+1:index+size(sifts{i, 1}, 2)) = sifts{i, 1};
        index = index + size(sifts{i, 1}, 2);
    end
    [center, label] = vl_kmeans(combined, config.cluster_num);
    kd_center = vl_kdtreebuild(center);
    save(['./data/label-', num2str(config.cluster_num)], 'label');
    save(['./data/center-', num2str(config.cluster_num)], 'center');
    save(['./data/kd-center-', num2str(config.cluster_num)], 'kd_center');
end
