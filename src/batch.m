% ������������
set_config;
setup;
% Ҫ����ͼƬ���
test_list = { ...
    '01961', '03813', '04081', '03435', '03961'; ...
    '03438', '01227', '01405', '00062', '01439'; ...
    '04223', '02695', '02765', '03978', '00359'; ...
    '00559', '01489', '01203', '04053', '02630'; ...
    '00668', '01666', '04290', '01996', '00089'};
% Ҫ����ͼƬ�������
contents = {'hertford'; 'keble'; 'magdalen'; 'pitt_rivers'; 'radcliffe_camera'};
% ����Լ�������
for i = 1:size(test_list, 1)
    sum_distances = [];
    % ��������ͼ����һ���ÿ��ͼ�ľ���
    for j = 1:size(test_list, 2)
        test_list{i, j} = [test_list{i, j}, '.jpg'];
        im = imread([config.directory, test_list{i, j}]);
        [~, sum_distances(j, :), ~] = retrival(im);
    end
    % ͳ��ƽ�����벢����ƽ����������
    load('./data/name-list.mat', 'name_list');
    sum_distances = sum(sum_distances, 1);
    [~, indices] = sort(sum_distances);
    result_list = cell(length(sum_distances), 1);
    for j = 1:length(sum_distances)
        result_list{j} = name_list{indices(j)};
    end
    for j = 1:size(test_list, 2)
        fid = fopen(['../res/', contents{i}, '_', num2str(j), '_result.txt'], 'w');
        for k = 1:min(1000, size(result_list, 1))
            file_name = result_list{k};
            len = length(file_name);
            if strcmp(file_name(len-3:len), '.jpg') == 1
                fprintf(fid, '%s\n', file_name(1:len-4));
            else
                fprintf(fid, '%s\n', file_name);
            end
        end
        fclose(fid);
    end
end
clearvars;
