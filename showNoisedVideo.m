close all;
clear;
clc;

threshold = 0.005;

videoName = 'messi.mp4';

videoObject = VideoReader(videoName);

while(hasFrame(videoObject))
    frame = readFrame(videoObject);
    frame = rgb2gray(frame);
    
    [m, n] = size(frame);
    for i=1:m
        for j=1:n
            x = rand;
            if x < threshold
                frame(i,j) = 0;
            end
            if x > 1-threshold
                frame(i,j) = 255;
            end
        end
    end
    
    imshow(frame);
end