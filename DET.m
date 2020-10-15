function ret = DET(A)

  [r,c] = size( A );
  P = eye(r,r);
  L = zeros(r,r);
  U = A;
  sg = 1;

  for i=1:r-1

    % search max pivot
    maxval = abs( U(i,i) );
    maxpos = i;
    for j=i+1:r
        if abs(U(j,i)) > maxval
            maxval = abs(U(j,i));
            maxpos = j;
        end
    end

    % row exchange
    if( maxpos ~= i )
	temp=U(i,:);
	U(i,:) = U(maxpos,:);
	U(maxpos,:) = temp;
	temp=L(i,:);
	L(i,:) = L(maxpos,:);
	L(maxpos,:) = temp;
	temp=P(i,:);
	P(i,:) = P(maxpos,:);
	P(maxpos,:) = temp;
	sg = sg*(-1);
    end

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
  L = L + eye(r,r);

  Z = U(1,1);
  for i=2:r
	Z=Z*U(i,i);
  end
  ret = sg*Z;
end
