close all;
clear;
clc;

videoName = 'messi.mp4';

videoObject = VideoReader(videoName);

while(hasFrame(videoObject))
    frame = readFrame(videoObject);
    frame = rgb2gray(frame);
    imshow(frame);
end