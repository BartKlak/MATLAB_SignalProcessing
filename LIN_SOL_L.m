function x = LIN_SOL_L( A, b )

  x = NaN;

  [r,c] = size( A );
  if( r ~= c || r ~= size(b,1) )
    disp( 'Size mismatch.');
    return;
  end

  x = zeros( r, 1 );

  for i=1:r
    x(i,1) = ( b(i) - A(i,1:i-1) * x(1:i-1) ) / A(i,i);
  end    

end
