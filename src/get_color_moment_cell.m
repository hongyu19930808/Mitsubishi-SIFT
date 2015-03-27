% ����һ��cell����ɫ��
% ���룺����cell
% �������cell����ɫ������
function color_moment_cell = get_color_moment_cell(cell)
% ��ȡrgb
r = cell(:, :, 1);
g = cell(:, :, 2);
b = cell(:, :, 3);
% ��ȡ��������
[len1, len2, ~] = size(cell);
N = len1 * len2;
% ����r��һ�׾ء����׾غ����׾�
r1 = sum(sum(r)) / N;
r2 = sqrt(sum(sum(((r - r1).^2))) / N);
r3 = nthroot((sum(sum(((r - r1).^3))) / N), 3);
% ����g��һ�׾ء����׾غ����׾�
g1 = sum(sum(g)) / N;
g2 = sqrt(sum(sum(((g - g1).^2))) / N);
g3 = nthroot((sum(sum(((g - g1).^3))) / N), 3);
% ����b��һ�׾ء����׾غ����׾�
b1 = sum(sum(b)) / N;
b2 = sqrt(sum(sum(((b - b1).^2))) / N);
b3 = nthroot((sum(sum(((b - b1).^3))) / N), 3);
% ����ֵ
color_moment_cell = reshape([r1, r2, r3, g1, g2, g3, b1, b2, b3], [1, 1, 9]);
end
