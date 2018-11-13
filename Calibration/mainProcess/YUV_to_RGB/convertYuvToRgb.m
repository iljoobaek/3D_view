function rgb = convertYuvToRgb(yuv)
% convert row vector YUV [0, 255] in row vector RGB [0, 255]

yuvToRgb = [1.0	0.0	1.4022;
            1.0	-0.3456	-0.7145;
            1.0	1.771	0.0];

yuv = double(yuv);

yuv(:, 2 : 3) = yuv(:, 2 : 3) - 127;


rgb = (yuvToRgb *yuv.').';

rgb = uint8(clipValue(rgb, 0, 255));