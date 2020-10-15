function [L,U,P,sg] = LU( A )

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
      % i列において、i行以降で絶対値が最大の場所を探し、
      % そのインデックスを maxpos に格納

    end

    % row exchange
    if( maxpos ~= i )
      % U, P, L のそれぞれで、所定の行交換
      % sg の符号を反転
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
  % 行交換のときに邪魔になるので、L の対角要素(1)は
  % 最後に付加する。(Pの行交換を工夫すれば、最初から
  % 対角要素に1を入れておくことも可能)
  L = L + eye(r,r);
  
end
