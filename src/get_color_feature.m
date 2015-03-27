function feature = get_color_feature(im)
    set_config;
    feature = zeros(25 * config.division * config.division, 1);
    count1 = config.division;
    count2 = config.division;
    cell_size1 = floor(size(im, 1) / count1);
    cell_size2 = floor(size(im, 2) / count2);
    % 获得颜色直方图
    color_hist = zeros(count1, count2, 16);
    for i1 = 1:count1
        for i2 = 1:count2
            cell = im(i1*cell_size1-cell_size1+1:i1*cell_size1, i2*cell_size2-cell_size2+1:i2*cell_size2, :);
            r_hist_cell = imhist(cell(:, :, 1), 4)';
            r_hist_cell = r_hist_cell / sum(r_hist_cell);
            g_hist_cell = imhist(cell(:, :, 2), 4)';
            g_hist_cell = g_hist_cell / sum(g_hist_cell);
            b_hist_cell = imhist(cell(:, :, 3), 4)';
            b_hist_cell = b_hist_cell / sum(b_hist_cell);
            hist_cell = imhist(rgb2gray(cell), 4)';
            hist_cell = hist_cell / sum(hist_cell);
            color_hist(i1, i2, :) = [r_hist_cell, g_hist_cell, b_hist_cell, hist_cell];
        end
    end
    % 获得颜色矩
    color_moment = zeros(count1, count2, 9);
    for i1 = 1:count1
        for i2 = 1:count2
            cell = im(i1*cell_size1-cell_size1+1:i1*cell_size1, i2*cell_size2-cell_size2+1:i2*cell_size2, :);
            color_moment(i1, i2, :) = get_color_moment_cell(cell);
        end
    end
    % 合成向量，归一化
    hist = reshape(color_hist, 16 * count1 * count2, 1);
    feature(1:16*count1*count2, 1) = hist / norm(hist);
    moment = reshape(color_moment, 9 * count1 * count2, 1);
    feature(16*count1*count2+1:25*count1*count2, 1) = moment / norm(moment);
    feature = feature / norm(feature);
end
