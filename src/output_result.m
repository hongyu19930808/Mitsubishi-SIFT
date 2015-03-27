function output_result(result_list)
[fileName, pathName, ~] = uiputfile({'*.txt', '文本文件'}, '输出结果');
fid = fopen([pathName, fileName], 'w');
for i = 1:min(1000, size(result_list, 1))
    file_name = result_list{i};
    len = length(file_name);
    if strcmp(file_name(len-3:len), '.jpg') == 1
        fprintf(fid, '%s\n', file_name(1:len-4));
    else
        fprintf(fid, '%s\n', file_name);
    end
end
fclose(fid);
end

