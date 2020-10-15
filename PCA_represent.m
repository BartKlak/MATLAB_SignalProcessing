function [ret,num] = PCA_represent( data, ac )

% �听������
[P,c,a] = PCA( data );
% ���σx�N�g���Z�o
ave = mean( data );
% ��őS�f�[�^�ɕ��ς��܂Ƃ߂đ������ނ��߂ɏ���
avemat = ones( size(data,1), 1 ) * ave;

% �{�����擾
num = size( find(a<ac), 1 );

% �ݐϊ�^�� ac �ƂȂ镔���̎听�����擾
basis = P( :, 1:num );
% �ˉe�q���쐬
Prj = basis * basis';

% �f�[�^�č\��
[n,d] = size( data );
ret = ((data - avemat)*Prj) + avemat;

end
