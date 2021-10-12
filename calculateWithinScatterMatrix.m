function [ scatterMatrix ] = calculateWithinScatterMatrix( dataSet1,dataSetMean1,dataSet2,dataSetMean2 )

%for ii=1:size(dataSet1,1)
 %   scatterMatrix=scatterMatrix + ((dataSet1(ii,:)-dataSetMean1)')*(dataSet1(ii,:)-dataSetMean1);
%end
%for ii=1:size(dataSet2,1)
%    scatterMatrix1=scatterMatrix1 + ((dataSet2(ii,:)-dataSetMean2)')*(dataSet2(ii,:)-dataSetMean2);
%end

dataSetMean1=repmat(dataSetMean1,size(dataSet1,1),1);
scatterMatrix=((dataSet1-dataSetMean1)')*(dataSet1-dataSetMean1);

dataSetMean2=repmat(dataSetMean2,size(dataSet2,1),1);

scatterMatrix1=((dataSet2-dataSetMean2)')*(dataSet2-dataSetMean2);




scatterMatrix=scatterMatrix/size(dataSet1,1);
scatterMatrix1=scatterMatrix1/size(dataSet2,1);
scatterMatrix=scatterMatrix+scatterMatrix1;


end

