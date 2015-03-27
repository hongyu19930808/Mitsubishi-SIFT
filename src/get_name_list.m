% 获取名字列表
file_list = dir(config.directory);
name_list = cell(length(file_list), 1);
for i = 1:length(file_list)
   if strcmp(file_list(i).name, '.') == 0 && strcmp(file_list(i).name, '..') == 0
       name_list{i, 1} = file_list(i).name;
   end
end
% 去掉因为无效路径导致name_list这个cell部分空缺的问题
index = 0;
for i = 1:length(file_list)
    if isempty(name_list{i}) == 0
        index = index + 1;
        name_list(index, :) = name_list(i, :);
    end
end
name_list = name_list(1:index, :);
% 存储名字列表
save('./data/name-list', 'name_list');