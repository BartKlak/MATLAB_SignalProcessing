function [ret,num] = PCA_represent( data, ac )

% 主成分分析
[P,c,a] = PCA( data );
% 平均ベクトル算出
ave = mean( data );
% 後で全データに平均をまとめて足しこむために準備
avemat = ones( size(data,1), 1 ) * ave;

% 本数を取得
num = size( find(a<ac), 1 );

% 累積寄与率 ac となる部分の主成分を取得
basis = P( :, 1:num );
% 射影子を作成
Prj = basis * basis';

% データ再構成

end
