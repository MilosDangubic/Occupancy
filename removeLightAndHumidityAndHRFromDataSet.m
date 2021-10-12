function [ dataWithoutLightHumdityHR ] = removeLightAndHumidityAndHRFromDataSet( data )
temp=data(:,1);
temp2=data(:,4);
dataWithoutLightHumdityHR=[temp temp2];

end

