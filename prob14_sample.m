% データ読み込み
mix1 = load( 'MIX1.txt' );
mix2 = load( 'MIX2.txt' );

% 白色化
X = [mix1 mix2]';
G = X * X' / size(X,2);
[P,L] = EIG( G );
T = diag( 1./ sqrt( diag(L) ) ) * P';
Z = T * X;

max_kurt = 0;
max_theta = 0;
for theta=0:0.05:pi
  % 回転行列 R を作成し
  
  %データ Z を回転
  Y = R * Z;
  % 一行目だけ取り出し(片方で十分なので)
  data = Y(1,:);
  % data のカートシスの絶対値を計算し、
  % max_kurt より大きければ、
  % max_kurt と max_theta を更新
end

% max_theta を用いた回転行列をかける
R = [cos(max_theta) -sin(max_theta) ; sin(max_theta) cos(max_theta) ];
Y = R * Z;

% 以下、音を聞いてみる。(pause は一次停止。何かのキーを押せば進む)
sound( mix1/max(abs(mix1)), 44100 );
pause;
sound( mix2/max(abs(mix2)), 44100 );
pause;
sound( Y(1,:)/max(abs(Y(1,:))), 44100 );
pause;
sound( Y(2,:)/max(abs(Y(2,:))), 44100 );

