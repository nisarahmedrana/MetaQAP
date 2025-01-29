function [bestLambda1, bestLambda2, bestLoss] = optimizeHyperparameters(Y, T)
            % Grid search for best lambda1 and lambda2
            lambdaValues = [0.25, 0.5, 0.75, 1.0];
            bestLoss = inf;
            bestLambda1 = 0;
            bestLambda2 = 0;
            
            for lambda1 = lambdaValues
                for lambda2 = lambdaValues
                    layer = QualityAwareRegressionLayer('QA Loss Layer', lambda1, lambda2);
                    loss = layer.forwardLoss(Y, T);
                    
                    if loss < bestLoss
                        bestLoss = loss;
                        bestLambda1 = lambda1;
                        bestLambda2 = lambda2;
                    end
                end
            end
end