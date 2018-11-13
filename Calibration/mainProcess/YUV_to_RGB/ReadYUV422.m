function imgRgb = ReadYUV422(fileName, width, height);

% read the yuv file
fileId = fopen(fileName, 'rb');
bufYUV = fread(fileId, width*height*2, 'uchar');
fclose(fileId);

% 422 YUV to RGB (imported from TI)
subSampleMat = [1, 1];
bufY = zeros((width*height),1);
bufU = zeros((width*height)/2,1);
bufV = zeros((width*height)/2,1);
cnt = 0;
for a=1:2:width*height*2-1
    cnt = cnt + 1;
    bufY(cnt,1) = bufYUV(a,1);
end
cnt = 0;
for a=1:4:width*height*2-3
    cnt = cnt + 1;
    bufU(cnt,1) = bufYUV(a+1,1);
    bufV(cnt,1) = bufYUV(a+3,1);
end

imgYuv(:, :, 1) = reshape(bufY, width, height).'; % reshape
imgYuv(:, :, 2) = kron(reshape(bufU, floor(width / 2), height).', subSampleMat); % reshape and upsample
imgYuv(:, :, 3) = kron(reshape(bufV, floor(width / 2), height).', subSampleMat); % reshape and upsample



% convert YUV to RGB
imgRgb = reshape(convertYuvToRgb(reshape(imgYuv, height * width, 3)), height, width, 3);

