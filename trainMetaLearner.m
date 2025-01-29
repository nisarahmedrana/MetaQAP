function selectedPredictors = trainMetaLearner(predictions, target, threshold)
            % Stepwise Linear Regression for Meta-Learning
            numPredictors = size(predictions, 2);
            selectedPredictors = [];
            fullModel = fitlm(predictions, target);         
            while true
                bestPredictor = [];
                bestScore = -inf;
                for i = 1:numPredictors
                    if ismember(i, selectedPredictors)
                        continue;
                    end
                    tempPredictors = [selectedPredictors, i];
                    tempModel = fitlm(predictions(:, tempPredictors), target);
                    if abs(tempModel.Coefficients.Estimate(2)) >= threshold && tempModel.Rsquared.Ordinary > bestScore
                        bestPredictor = i;
                        bestScore = tempModel.Rsquared.Ordinary;
                    end
                end
                
                if isempty(bestPredictor)
                    break;
                end
                selectedPredictors = [selectedPredictors, bestPredictor];
                fullModel = fitlm(predictions(:, selectedPredictors), target);
            end
end