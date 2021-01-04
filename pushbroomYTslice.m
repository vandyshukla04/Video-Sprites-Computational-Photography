videomat = load_sequence_color('CupFrames','frame',1,240,3,'jpg');

[M,N,~,numframe]=size(videomat);
%count = 2*numframe;
pushbroom = 255 * ones(M, numframe, 3, 'uint8');
%count = 2*numframe;
for i=1:numframe
    
    %if(i>numframe)
    %    x=mod(i,numframe)+1;
    %else
    %    x=i;
    %end
    pushbroom(:,i,:)=255*videomat(:,N,:,i);
end

figure;
imshow(pushbroom);
    