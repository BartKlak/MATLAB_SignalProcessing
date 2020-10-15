function [P,c,a] = PCA( data )
  
% データサイズ取得
[n,d] = size( data );
% 分散共分散行列算出
cov_mat = cov( data );

% スペクトル分解
[P,L] = EIG( cov_mat );
% 寄与率算出

% 累積寄与率算出

end
