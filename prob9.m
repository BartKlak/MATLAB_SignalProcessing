img = im2double(imread('LENA256.pgm'));
data = img2data(img, 8);
datareconst = PCA_represent(data,0.98);
imgreconst = data2img(datareconst, 256, 256);

img2 = im2double(imread('ROOM256.pgm'));
data2 = img2data(img2, 8);
datareconst2 = PCA_represent(data2,0.98);
imgreconst2 = data2img(datareconst2, 256, 256);

subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(imgreconst);

subplot(2,2,3);
imshow(img2);
subplot(2,2,4);
imshow(imgreconst2);