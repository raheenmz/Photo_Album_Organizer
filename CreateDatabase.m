function T = CreateDatabase(TrainFiles)
Train_Number = length(TrainFiles) ;
T = [];
for i = 3 : Train_Number
    
    imgName = TrainFiles(i).name;
    imgPath = strcat('.\Images\',imgName);
    disp(imgPath) ;
    img = imread(imgPath);
  
    img = rgb2gray(img);
    
    [irow,icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   
    T = [T temp];                  
end

