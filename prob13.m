function ret = prob13(imgfilename, gamma)
img = im2double(imread(imgfilename));
A = mk_deg_mat(256,15);
A2 = inv(A);
F = inv((A' * A) + (gamma * eye(256)))*A'*img;
imwrite(F, 'P13_REST.pgm');
ret = F;
end

%P13_REST -> gamma = 0.01