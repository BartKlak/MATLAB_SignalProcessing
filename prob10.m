img = im2double(imread('LENA256.pgm'));
A = mk_deg_mat(256,15);
G = A * img;
imwrite(G, 'P10_DEG.pgm');

A2 = inv(A);
F = A2 * G;
imwrite(F, 'P10_REST.pgm');

subplot(1,2,1);
imshow(G);
subplot(1,2,2);
imshow(F);
