function ret = img2data( img, bs )

  [r,c] = size( img );

  ret = [];
  for i=1:bs:r
    for j=1:bs:c
      ret = [ret reshape( img(i:i+bs-1,j:j+bs-1), bs*bs, 1 ) ];
    end
  end

  ret = ret';
  
end

