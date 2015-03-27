function image = open_file()
% select an image
% if no image is selected, then return 0, else return the image variable
image = 0;
[fileName, pathName, ~] = uigetfile({'*.jpg;*.bmp;*.png','All Image Files';});
if ~isequal(pathName, 0)
    image = imread([pathName, fileName]);
end
end
