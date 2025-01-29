classdef QualityAwareRegressionLayer < nnet.layer.RegressionLayer
    properties
        Lambda1  % Weight for MSE component
        Lambda2  % Weight for SROCC component
    end
    
    methods
        function layer = QualityAwareRegressionLayer(name, lambda1, lambda2)
            layer.Name = name;
            layer.Description = 'Quality-Aware Loss Function';
            layer.Lambda1 = lambda1;
            layer.Lambda2 = lambda2;
        end
        
        function loss = forwardLoss(layer, Y, T)
            % Mean Squared Error (MSE) component
            mseLoss = 0.5 * mean((T - Y).^2, 'all');
            
            % Differentiable Spearman Rank Order Correlation Coefficient (SROCC) Approximation
            softmax_Y = exp(Y) ./ sum(exp(Y), 'all');
            softmax_T = exp(T) ./ sum(exp(T), 'all');
            
            % Compute SROCC using Pearson correlation on rank indices
            mean_Y = mean(softmax_Y, 'all');
            mean_T = mean(softmax_T, 'all');
            
            num = sum((softmax_Y - mean_Y) .* (softmax_T - mean_T), 'all');
            den = sqrt(sum((softmax_Y - mean_Y).^2, 'all') * sum((softmax_T - mean_T).^2, 'all'));
            
            sroccLoss = 1 - (num / (den + eps)); % Convert to loss
            
            % Compute Quality-Aware Loss
            loss = layer.Lambda1 * mseLoss + layer.Lambda2 * sroccLoss;
        end
    end
end