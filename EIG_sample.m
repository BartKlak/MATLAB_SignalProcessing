function [P,L] = EIG( A )

% 正方行列かどうかチェック
[r,c] = size( A );
if( r ~= c )
  disp( 'Not a square matrix.');
  return;
end

% 対称行列かどうかチェック
diff = A - A';
if( trace(diff'*diff) / trace(A'*A) > 0.0000000000001 )
  disp( 'Not a symmetric matrix.');
  return;
end

% 念のため厳密に対称行列にしておく。
L = (A + A')/2;
P = eye( r );

while( 1 )
  % search max element
  max_val = 0;
  max_i = 1;
  max_j = 1;
  for i=1:r-1
    for j=i+1:r
      % 絶対値が最大となる位置を探す。
      % それぞれ、max_i と max_j に格納
    end
  end
  % 絶対値の最大が十分小さければ return
  if( max_val < 0.000000000000001 )
    return;
  end
  
  % 角度 θ と回転行列 S を算出

  % L と P を更新。
  L = S' * L * S;
  P = P * S;
  
end

end
