scores=[];
for i=10:25
    for j=1:24
        for k=1:5
            if(i<10)
                imR=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\reference_images\\i%d%d.bmp',0,i));
                if(j<10)
                    imD=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\distorted_images\\i%d%d_%d%d_%d.bmp',0,i,0,j,k));
                else
                    imD=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\distorted_images\\i%d%d_%d_%d.bmp',0,i,j,k));
                end
            else                
            imR=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\reference_images\\i%d.bmp',i));
                 if(j<10)
                        imD=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\distorted_images\\i%d_%d%d_%d.bmp',i,0,j,k));
                 else
                        imD=imread(sprintf('C:\\Users\\Nisar\\Documents\\MATLAB\\IQA\\IQA\\tid2013\\distorted_images\\i%d_%d_%d.bmp',i,j,k));
                 end
            end
            s=[];
            s=[s ssim(imR, imD)];
            s=[s multissim(rgb2gray(imR), rgb2gray(imD))];
            s=[s msssim(rgb2gray(imD),rgb2gray(imR))];
%             temp=MAD_index(imR, imD);
%             s=[s temp.MAD];
            s=[s FeatureSIM(imR, imD)];
            s=[s AD_DWT(imR, imD)];
            s=[s ADM(imR, imD)];
            s=[s CID(imR, imD)];
            s=[s dss_index(rgb2gray(imD),rgb2gray(imR))];
            s=[s dvicom_fast(rgb2gray(imR), rgb2gray(imD), 1.0)];
%             s=[s DWT_VIF(imR,imD)];
            s=[s ESSIM(imR, imD)];
            s=[s FeatureSIM(imR, imD)];
            s=[s GMSD(rgb2gray(imD),rgb2gray(imR))];
            s=[s GSM(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s ifcvec(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            %func_igm_iqa_metric(img_ref,img_dst)
            %iwpsnr(rgb2gray(imD),rgb2gray(imR));
            %iwssim(rgb2gray(imD),rgb2gray(imR));
            s=[s mcsd(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            viewing_angle = 1/3.5 * 180 / pi;
            dim = sqrt(prod(size(imR)));
            s=[s nqm_modified(double(rgb2gray(imR)),double(rgb2gray(imD)),viewing_angle,dim)];
            s=[s psnr_calc(rgb2gray(imR),rgb2gray(imD), 255)];
            s=[s PSNR_DWT(imR,imD)];
            [psnr_hma_c, psnr_ha_c] = color_psnrhma(imR, imD);
            s=[s psnr_hma_c psnr_ha_c];
            [p_hvs_m, p_hvs] = psnrhvsm(imR, imD);
            s=[s p_hvs_m p_hvs];
            load('dictionary_example.mat')
            patchSize = 8;
            sparsity = 2;
            s=[s QASD(imR, imD, Dictionary, patchSize, sparsity)];
            s=[s RFSIM(rgb2gray(imR),rgb2gray(imD))];
            load('W.mat');
            s=[s SFF(imR, imD, W)];
%             s=[s metrix_snr(imR, imD)];
            s=[s SR_SIM(rgb2gray(imR),rgb2gray(imD))];
            s=[s SSIM_DWT(imR,imD)];
            s=[s img_qi(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s vifvec(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s VIF_DWT(imR,imD)];
            s=[s vifp_mscale(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s VSI(imR, imD)];
            s=[s vsnr_modified(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s wsnr_new_modified(double(rgb2gray(imR)),double(rgb2gray(imD)))];
            s=[s WSSI(imR,imD)];
            scores=[scores s'];
            [i j k]
        end
    end
end
save all