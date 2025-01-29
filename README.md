# MetaQAP
##Meta-Learning and Quality-Aware Pre-training for Image Quality Assessment
The attached MATLAB files provide the transfer learning code for InceptionResNet-V2 to be trained on three datasets which can be acquired from the following links. The InceptionResNet-V2 referred here is modified by replacing the classification head with a regression head as described in the paper and is loaded in the MATLAB. The only change in the code for a different pre-trained model is the modified model architecture, input image size and the training hyperparameters which were changed due to computational constrains.
* BIQ2021:    https://www.kaggle.com/datasets/nisarahmedrana/biq2021
* KonIQ-10K:  https://database.mmsp-kn.de/koniq-10k-database.html
* LiveCD:     https://live.ece.utexas.edu/research/ChallengeDB/index.html

The code for quality aware-loss function is provided in the QA_loss which is used in creation of loss layer of the regression head of the CNN.
