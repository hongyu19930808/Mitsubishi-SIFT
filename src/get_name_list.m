% ��ȡ�����б�
file_list = dir(config.directory);
name_list = cell(length(file_list), 1);
for i = 1:length(file_list)
   if strcmp(file_list(i).name, '.') == 0 && strcmp(file_list(i).name, '..') == 0
       name_list{i, 1} = file_list(i).name;
   end
end
% ȥ����Ϊ��Ч·������name_list���cell���ֿ�ȱ������
index = 0;
for i = 1:length(file_list)
    if isempty(name_list{i}) == 0
        index = index + 1;
        name_list(index, :) = name_list(i, :);
    end
end
name_list = name_list(1:index, :);
% �洢�����б�
save('./data/name-list', 'name_list');