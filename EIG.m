function [P,L] = EIG( A )

% ����s�񂩂ǂ����`�F�b�N
[r,c] = size( A );
if( r ~= c )
  disp( 'Not a square matrix.');
  return;
end

% �Ώ̍s�񂩂ǂ����`�F�b�N
diff = A - A';
if( trace(diff'*diff) / trace(A'*A) > 0.0000000000001 )
  disp( 'Not a symmetric matrix.');
  return;
end

% �O�̂��ߌ����ɑΏ̍s��ɂ��Ă����B
L = (A + A')/2;
P = eye( r );

while( 1 )
  % search max element
  max_val = 0;
  max_i = 1;
  max_j = 1;
  for i=1:r-1
    for j=i+1:r
       if abs(L(i,j)) > max_val
          max_val = abs(L(i,j));
          max_i = i;
          max_j = j;
       end
      % ��Βl���ő�ƂȂ�ʒu��T���B
      % ���ꂼ��Amax_i �� max_j �Ɋi�[
    end
  end
  % ��Βl�̍ő傪�\����������� return
  if( max_val < 0.000000000000001 )
    [B,I] = sort(diag(L), 'descend');
    L = diag(B);
    P = P(:, I);
    return;
  end
  
  % �p�x �� �Ɖ�]�s�� S ���Z�o
  theta = (1/2)*atan(2*L(max_i,max_j)/(L(max_i,max_i)-L(max_j,max_j)));
  S = eye(r);
  S(max_i, max_i) = cos(theta);
  S(max_i, max_j) = -sin(theta);
  S(max_j, max_i) = sin(theta);
  S(max_j, max_j) = cos(theta);

  % L �� P ���X�V�B
  L = S' * L * S;
  P = P * S;
  
end

end
