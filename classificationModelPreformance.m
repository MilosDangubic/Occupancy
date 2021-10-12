function [ Accuracy,MisclassificationRate ,TruePositiveRate,FalsePositiveRate,Specificity,Precision] = classificationModelPreformance( confusionMatrix )

TN=confusionMatrix(1,1);
FP=confusionMatrix(1,2);
FN=confusionMatrix(2,1);
TP=confusionMatrix(2,2);

Accuracy=((TP+TN)/sum(sum(confusionMatrix)))*100;
MisclassificationRate=((FP+FN)/sum(sum(confusionMatrix)))*100;
TruePositiveRate=(TP/(TP+FN))*100;
FalsePositiveRate=(FP/(FP+TN))*100;
Specificity=(TN/(FP +TN))*100;
Precision=(TP/(TP+FP))*100;
end

