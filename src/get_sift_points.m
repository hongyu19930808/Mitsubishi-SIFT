% ��ȡ����ͼƬ��sift����
file_list = dir(config.directory);
sifts = cell(length(file_list), 1);
% ��ȡsift����
for i = 1:length(file_list)
   if strcmp(file_list(i).name, '.') == 0 && strcmp(file_list(i).name, '..') == 0
       im = imread([config.directory, file_list(i).name]);
       resize_coeff = min(config.max_image_length / size(im, 1), ...
           config.max_image_length / size(im, 2));
       im = im2single(rgb2gray(imresize(im, resize_coeff)));
       [~, sifts{i, 1}] = vl_sift(im);
   end
end
% ȥ����Ϊ��Ч·������sifts���cell���ֿ�ȱ������
index = 0;
for i = 1:length(file_list)
    if isempty(sifts{i}) == 0
        index = index + 1;
        sifts(index, :) = sifts(i, :);
    end
end
sifts = sifts(1:index, :);
save(['./data/sifts-', num2str(config.max_image_length)], 'sifts');