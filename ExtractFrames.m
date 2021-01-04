%To extract frames from a video

Test = VideoReader('Cup.mp4');

for numFrame = 1:Test.NumberOfFrames
    if(numFrame<10)
        filename=strcat('CupFrames/frame00',num2str(numFrame),'.jpg');
    elseif(numFrame<100)
        filename=strcat('CupFrames/frame0',num2str(numFrame),'.jpg');
    else
        filename=strcat('CupFrames/frame',num2str(numFrame),'.jpg');
    end
    b = read(Test,numFrame);
    imwrite(b,filename);
end
