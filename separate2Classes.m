function [ dataSetTrue , dataSetFalse] = separate2Classes( dataSet )
dataSetTrue=[];
dataSetFalse=[];
for ii=1:size(dataSet,1)
    if(dataSet(ii,size(dataSet,2))==1)
        dataSetTrue=[dataSetTrue;dataSet(ii,:)];
    else
        dataSetFalse=[dataSetFalse;dataSet(ii,:)];
    end
    
end


end

