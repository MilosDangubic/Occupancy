function [ outputLabel,error,posterior ] = linearClassify(validationDataSetScalars,trainingDataSetScalars,trainingDataSetLabel )
[outputLabel,error,posterior]=classify( validationDataSetScalars,trainingDataSetScalars,trainingDataSetLabel,'linear');

end