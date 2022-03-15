clc; clear;
% read in image & display
A = imread('weave.bmp');
subplot(3, 3, 1)
imshow(A)
title('Original')

%convert image into grayscale
X_pre = im2gray(A);
X = im2double(X_pre);

if width(X) >= 220
    range = [1 2 4 16 32 64 128 rank(X)];
else
    range = [1 2 4 16 32 64 100 rank(X)];
end

%find S V D
[U, S, V] = svd(X);

% Plotting singular values
% x_range = 1:width(S);
% plot(x_range, sum(S))
% title("weave.bmp")
% xlabel("Column Number (in S Matrix)")
% ylabel("Singular value")

%initialize vector to store percentage energy error w/ Frobenius norm
residual_error = zeros(8,1);
compression_rate = zeros(8, 1);

plotind = 2;
i = 1;
for r=range
    Xapprox = U(:, 1:r)*S(1:r, 1:r)*V(:, 1:r)';
    subplot(3, 3, plotind), plotind = plotind+1;
    imshow(Xapprox), axis off
    original_norm = norm(X, 'fro');
    residual_error(i) = norm((X-Xapprox), 'fro')/norm(X, 'fro');
    residual_error;
    compression_rate(i) = (r + (r*width(X))+ (r*height(X)))/(height(X)*width(X));
    compression_rate;
    i = i+1;
end































% A = imread('lily.jpg');
% X = mat2gray(A);
% % X = double(rgb2gray(A));
% 
% size(X)
% 
% subplot(3, 3, 1)
% imagesc(X), axis off
% title('Original')