% 设置相关配置
config = struct();
% 图片路径
config.directory = '../ex1/dataset/';
% 聚类个数
config.cluster_num = 10000;
% 图片压缩后最大边长
config.max_image_length = 512;
% 是否使用颜色特征
config.use_color_feature = true;
% 提取颜色特征时图片分块儿数量
config.division = 15;
% 颜色特征相对sift特征的权重
config.color_coeff = 0.4;
