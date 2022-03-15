X = randi(100, 220, 220);
subplot(3, 3, 1)
imshow(X)
title('Original')
%find S V D
[U, S, V] = svd(X);


%initialize vector to store percentage energy error w/ Frobenius norm
residual_error = zeros(8,1);
compression_rate = zeros(8, 1);

plotind = 2;
i = 1;
for r=[1 2 4 16 32 64 128 220]
    Xapprox = U(:, 1:r)*S(1:r, 1:r)*V(:, 1:r)';
    subplot(3, 3, plotind), plotind = plotind+1;
    imshow(Xapprox), axis off
    original_norm = norm(X, 'fro');
    residual_error(i) = norm((X-Xapprox), 'fro')/norm(X, 'fro');
    residual_error
    compression_rate(i) = (r + (r*width(X))+ (r*height(X)))/(height(X)*width(X));
    compression_rate
    i = i+1;
end