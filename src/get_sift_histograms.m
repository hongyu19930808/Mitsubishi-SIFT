% ����֮�󣬻�ȡ���ݼ���ÿ��ͼƬ��sift�������Ӧ��feature��BOW��
index = 0;
features = zeros(size(center, 2), size(sifts, 1));
for i = 1:size(sifts, 1)
	for j = 1:size(sifts{i, 1}, 2)
		index = index + 1;
		features(label(1, index), i) = features(label(1, index), i) + 1;
	end
	features(:, i) = features(:, i) / norm(features(:, i));
end
save(['./data/features-sift-', num2str(config.cluster_num)], 'features');
