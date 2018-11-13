% This code is used to convert the yuv images derived from camera to bmp
% format for all the views
% It calls other functions to do the actual processing
clear all;

imageDistorted = ReadYUV422(['LEFT_0', '.YUV'], 1280, 720);
imwrite(imageDistorted, 'left_parking.bmp')

imageDistorted = ReadYUV422(['FRONT_0', '.YUV'], 1280, 720);
imwrite(imageDistorted, 'front_parking.bmp');

imageDistorted = ReadYUV422(['RIGHT_0', '.YUV'], 1280, 720);
imwrite(imageDistorted, 'right_parking.bmp');

imageDistorted = ReadYUV422(['BACK_0', '.YUV'], 1280, 720);
imwrite(imageDistorted, 'rear_parking.bmp');