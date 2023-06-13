
Image=imread('C:\Users\sro-c\Desktop\ketcap.png');
GrayImage=im2gray(Image);
h=imhist(GrayImage);

G=256;
olasilik_g=h/sum(h);
sigma=zeros(G,1);
olasilik_T=0;
entropi_T=0;
indeks = find(olasilik_g);

entropi_L = sum(olasilik_g(indeks).*log(olasilik_g(indeks))*(-1));

for k= 0:G-1
    olasilik_T=olasilik_T + olasilik_g(k+1);
    
    if olasilik_g(k+1) > 0 && olasilik_T < 1
        entropi_T = entropi_T - olasilik_g(k+1) * log(olasilik_g(k+1));
        sigma(k+1) = log(olasilik_T * (1-olasilik_T)) + entropi_T / olasilik_T + ...
            (entropi_L-entropi_T) / (1-olasilik_T);
    elseif (olasilik_g(k+1) == 0 && k > 0) 
        sigma(k+1) = sigma(k);
    end
end

[maxsigma, indeks] = max(sigma);
th = (indeks - 1) / (G -1);
kapur = im2bw(GrayImage, th);


subplot(2,2,1);imshow(GrayImage)
title('\fontsize{20} Gri-ton görüntü')
subplot(2,2,2);imhist(GrayImage)
title('\fontsize{20} Gri-ton görüntünün histogramı')
subplot(2,2,4);imhist(GrayImage)
title({'\fontsize{20} T=148'})
subplot(2,2,3);imshow(kapur)
title('\fontsize{20} Kapur metodu uygulanmış görüntü')






