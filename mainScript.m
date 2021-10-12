 
load('LTdataSetFalseScalars');
histogram(LTdataSetTrueScalars,'FaceColor','g');
hold on
histogram (LTdataSetFalseScalars,'FaceColor','r');
legend('occupied','non occupied');
hold off

%scatter(dataSetTrueScalars,zeros(size(dataSetTrueScalars,1),1),'g');

histogram(dataSetTrueScalars,'FaceColor','g');
hold on
histogram (dataSetFalseScalars,'FaceColor','r');
legend('occupied','non occupied');
hold off




%%%%%%%% TEST SET %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% 
%%%%%% PROJECTING TEST DATA TO NEW DIMENSION %%%%%%%%
validationDataSetScalars=validationDataSet*W;

KNN=fitcknn(trainingDataSetScalars,trainingDataSetLabel);
%%%TODO KNN KLASIFIKATOR PA BIRAJ BOLJI
KNN.NumNeighbors=1;
oLabel=KNN.predict(validationDataSetScalars);

cM=confusionmat(validationDataSetLabel,oLabel);
acc=trace(cM)/sum(sum(cM));
[outputLabel,error,posterior]=linearClassify(validationDataSetScalars,trainingDataSetScalars,trainingDataSetLabel);

confusionMatrix=confusionmat(validationDataSetLabel,outputLabel);
[ Accuracy,MisclassificationRate ,TruePositiveRate,FalsePositiveRate,Specificity,Precision] = classificationModelPreformance( confusionMatrix );
 disp('Model preformance for validation data using linear clasificator in %:');
 pause;
 Accuracy
 pause;
 MisclassificationRate
 pause;
 TruePositiveRate
 pause;
 FalsePositiveRate
 pause;
 Specificity
 pause;
 Precision
 pause;
 disp('Model preformance for validation data using KNN clasificator in %:');
 
 [ kAccuracy,kMisclassificationRate ,kTruePositiveRate,kFalsePositiveRate,kSpecificity,kPrecision] = classificationModelPreformance( cM );
 
  pause;
 kAccuracy
 pause;
 kMisclassificationRate
 pause;
 kTruePositiveRate
 pause;
 kFalsePositiveRate
 pause;
 kSpecificity;
 pause;
 kPrecision
 pause;
 
 posteriorTrue=posterior(:,2);
 posteriorFalse=posterior(:,1);
[posteriorTrue,order]=sort(posteriorTrue,'descend');


validationDataSetScalarsSorted=validationDataSetScalars(order,:);
validationDataSetLabel=validationDataSetLabel(order,:);   




%%%%%%% PLOTING ROC CURVE %%%%%%%%%%%


[X,Y] = perfcurve(validationDataSetLabel,posteriorTrue,1);
plot(X,Y);
ylabel('sensibility');
xlabel('1-specificity');
pause;
close all;
pause;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STOP %%%%%%

testDataSetScalars=testDataSet*W;


[tOutputLabel,tError,tPosterior]=linearClassify(testDataSetScalars,trainingDataSetScalars,trainingDataSetLabel);

confusionMatrix=confusionmat(testDataSetLabel,tOutputLabel);
[ tAccuracy,tMisclassificationRate ,tTruePositiveRate,tFalsePositiveRate,tSpecificity,tPrecision] = classificationModelPreformance( confusionMatrix );
 disp('Model preformance for test data in %:');
 pause;
 tAccuracy
 pause;
 tMisclassificationRate
 pause;
 tTruePositiveRate
 pause;
 tFalsePositiveRate
 pause;
 tSpecificity
 pause;
 tPrecision
 pause;
 
 posteriorTrue=tPosterior(:,2);
posteriorFalse=tPosterior(:,1);
[posteriorTrue,order]=sort(posteriorTrue,'descend');


testDataSetScalarsSorted=testDataSetScalars(order,:);
testDataSetLabel=testDataSetLabel(order,:);   




%%%%%%% PLOTING ROC CURVE %%%%%%%%%%%


[X,Y] = perfcurve(testDataSetLabel,posteriorTrue,1);
plot(X,Y);
ylabel('sensibility');
xlabel('1-specificity');
pause;
close all;
pause;




