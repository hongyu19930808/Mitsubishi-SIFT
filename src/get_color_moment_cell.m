% 计算一个cell的颜色矩
% 输入：单个cell
% 输出：该cell的颜色矩特征
function color_moment_cell = get_color_moment_cell(cell)
% 获取rgb
r = cell(:, :, 1);
g = cell(:, :, 2);
b = cell(:, :, 3);
% 获取像素总数
[len1, len2, ~] = size(cell);
N = len1 * len2;
% 计算r的一阶矩、二阶矩和三阶矩
r1 = sum(sum(r)) / N;
r2 = sqrt(sum(sum(((r - r1).^2))) / N);
r3 = nthroot((sum(sum(((r - r1).^3))) / N), 3);
% 计算g的一阶矩、二阶矩和三阶矩
g1 = sum(sum(g)) / N;
g2 = sqrt(sum(sum(((g - g1).^2))) / N);
g3 = nthroot((sum(sum(((g - g1).^3))) / N), 3);
% 计算b的一阶矩、二阶矩和三阶矩
b1 = sum(sum(b)) / N;
b2 = sqrt(sum(sum(((b - b1).^2))) / N);
b3 = nthroot((sum(sum(((b - b1).^3))) / N), 3);
% 返回值
color_moment_cell = reshape([r1, r2, r3, g1, g2, g3, b1, b2, b3], [1, 1, 9]);
end
