function sol = LIN_SOL_U( A, b )

  x = NaN;

  [r,c] = size( A );
  if( r ~= c || r ~= size(b,1) )
    disp( 'Size mismatch.');
    return;
  end

  x = zeros( r, 1 );

  for i=r:-1:1
    x(i,1) = ( b(i) - A(i,r:-1:i+1) * x(r:-1:i+1) )/ A(i,i);
    % 解を計算する(こちらは、上三角なので下から計算する)
  end    

  sol = x;

end
