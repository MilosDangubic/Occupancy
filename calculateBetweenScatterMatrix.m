function [ betweenScatterMatrix ] = calculateBetweenScatterMatrix( dataMean1,dataMean2)


betweenScatterMatrix=((dataMean1-dataMean2)')*(dataMean1-dataMean2);
end

