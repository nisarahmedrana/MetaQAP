# MetaQAP
Meta-Learning and Quality-Aware Pre-training for Image Quality Assessment
The attached MATLAB files provide the transfer learning code for InceptionResNet-V2 to be trained on KonIQ-10K dataset. The InceptionResNet-V2 referred here is modified by replacing the classification head with a regression head as described in the paper and is loaded in the MATLAB. The only change in the code for a different pre-trained model is the modified model architecture, input image size and the training hyperparameters which were changed due to computational constrains.
