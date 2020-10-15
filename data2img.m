function img = data2img( data, r, c )

  data = data';
  [d,n] = size( data );
  bs = sqrt( d );
  if( r*c ~= d*n )
    disp( 'Size mismatch' );
    return;
  end
  
  img = zeros( r, c );
  count = 1;
  for i=1:bs:r
    for j=1:bs:c
      img(i:i+bs-1,j:j+bs-1) = reshape( data(:,count), bs,bs );
      count = count + 1;
    end
  end

end

