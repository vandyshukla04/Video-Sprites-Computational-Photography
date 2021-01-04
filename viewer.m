%CODE FOR PUSHBROOM PANORAMIC MOVIE

%Loads the video matrix from Load Sequence
%Load Sequence function was provided in the last coursework, it was altered
%to load big sized videos without extra memory occupancy

%folder = name of the folder containing the frames of the video
%prefix = filename
%first = first frame
%last = last frame
%digits = number of digits in frame
%suffix = image format

%set these values to load the required video

folder = 'CupFrames';
prefix = 'frame';
first = 1;
last = 476;
digits = 3;
suffix = 'jpg';

videomat = load_sequence_color(folder,prefix,first,last,digits,suffix);
[M,N,~,numframe] = size(videomat);

pushbroom = 255 * ones(M, numframe, 3, 'uint8');

%

for k = 1:N
    for i=1:numframe
    
        %if(i>numframe)
        %    x=mod(i,numframe)+1;
        %else
        %    x=i;
        %end
        pushbroom(:,i,:)=255*videomat(:,k,:,i);
        
    end
    %imshow(pushbroom);
    
    %add the name of the Folder you wish to save the pushbroom panorama movie frames in before '/' in
    %the filename
    
    if(k<10)
        filename=strcat('PushbroomCup/frame00',num2str(k),'.jpg');
    elseif(k<100)
        filename=strcat('PushbroomCup/frame0',num2str(k),'.jpg');
    else
        filename=strcat('PushbroomCup/frame',num2str(k),'.jpg');
    end
    J = imresize(pushbroom,[250 300]);
    imwrite(J,filename);
    
end 

%Creates final pushbroom movie from the pushbroom frames
%add the name of the PFolder and change the name of the movie in the
%outputvideo command

PFolder = 'PushbroomCup';

imageNames = dir(fullfile(PFolder,'*.jpg'));
imageNames = {imageNames.name}';

outputVideo = VideoWriter(fullfile('cup_movie.avi'));
open(outputVideo)

for ii = 1:length(imageNames)
   img = imread(fullfile(PFolder,imageNames{ii}));
   writeVideo(outputVideo,img)
end

close(outputVideo)
