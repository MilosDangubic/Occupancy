function [ dataWithoutLight ] = removeLightFromDataSet( data )
temp=data(:,1:2);
temp2=data(:,4:size(data,2));
dataWithoutLight=[temp temp2];


end

