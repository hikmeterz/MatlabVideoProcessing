close all;
clear;
clc;

stop_frame = 250;

denoiseThreshold = 600;

noiseThreshold = 0.005;

videoName = 'messi.mp4';

videoObject = VideoReader(videoName);

cnt = 0;
mse_sum = 0;
while(hasFrame(videoObject))
    frame = readFrame(videoObject);
    frame = rgb2gray(frame);
    
    cnt = cnt + 1;
    rng(cnt)
    [m, n] = size(frame);
    for i=1:m
        for j=1:n
            x = rand;
            if x < noiseThreshold
                frame(i,j) = 0;
            end
            if x > 1-noiseThreshold
                frame(i,j) = 255;
            end
        end
    end
    
    [denoisedFrame, mse] = denoiseFrame(frame, denoiseThreshold);
    mse_sum = mse_sum + mse;
    
    imshow([frame denoisedFrame]);
    
    if cnt==stop_frame
        break
    end
end
disp(mse_sum/cnt)