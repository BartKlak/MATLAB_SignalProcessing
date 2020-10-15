function [L,U] = LU_simple( A )

  [r,c] = size( A );
  L = eye( r, r );
  U = A;

  for i=1:r-1

    % elimination
    pivot = U(i,i);
    if( abs( pivot ) < 0.0000000000000001 )
      return;
    end

    for j=i+1:r
      L(j,i) = U(j,i) / pivot;
      U(j,:) = U(j,:) - L(j,i) * U(i,:);
    end

  end
  
end
