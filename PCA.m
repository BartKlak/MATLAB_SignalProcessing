function [P,c,a] = PCA( data )
  
% �f�[�^�T�C�Y�擾
[n,d] = size( data );
% ���U�����U�s��Z�o
cov_mat = cov( data );

% �X�y�N�g������
[P,L] = EIG( cov_mat );
% ��^���Z�o
c = zeros(d,1);
for i=1:d
	c(i,1) = L(i,i)/trace(L);
end
% �ݐϊ�^���Z�o
a = zeros(d,1);
a(1,1) = c(1,1);
for i=2:d
	a(i,1) = a(i-1,1) + c(i,1);
end
end
