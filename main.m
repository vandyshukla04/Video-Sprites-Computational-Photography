%CODE FOR CREATING A Multiperspective image along the any slice

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

folder = 'Field';
prefix = 'frame';
first = 1;
last = 72;
digits = 2;
suffix = 'jpg';

videomat = load_sequence_color(folder,prefix,first,last,digits,suffix);

[Y,X,~,T]=size(videomat);

%Set the axis you wish to slice the stack along for example for Y-T, set M=Y and N=T
M = Y;
N = X;
FinalMultiPerspectiveImage = 255 * ones(M, N, 3, 'uint8');

for i=1:M
    
    x=mod(i,T)+1;
    r = 255*videomat(i,:,:,x);
    FinalMultiPerspectiveImage(i,:,:)=r;
    
end

figure;
imshow(FinalMultiPerspectiveImage);