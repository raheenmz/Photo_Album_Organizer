function OutputName = Recognition(TestImage, m, A, Eigenfaces)

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); 
    ProjectedImages = [ProjectedImages temp]; 
end

InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow,icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference; 

Euc_dist = [];

for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

disp('Distance vector');
disp(Euc_dist);

[Euc_dist_min , ~] = min(Euc_dist);

disp(Euc_dist_min) ;

if ( Euc_dist_min > (Euc_dist_max - Euc_dist_min)*0.40) 
   OutputName = 'None' ; 
else
    ImgDir = dir('.\Images') ;
    OutputName = ImgDir(i+2).name; 
end

disp(OutputName) ; 