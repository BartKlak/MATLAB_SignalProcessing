img = im2double(imread('LENA256DEG.pgm'));
img2 = im2double(imread('P10_DEG.pgm'));
img3 = im2double(imread('P10_REST.pgm'));
A = mk_deg_mat(256,15);
A2 = inv(A);
F = A2 * img;
imwrite(F, 'P11_REST.pgm');

subplot(2,2,1);
imshow(img2);
subplot(2,2,2);
imshow(img);

subplot(2,2,3);
imshow(img3);
subplot(2,2,4);
imshow(F);