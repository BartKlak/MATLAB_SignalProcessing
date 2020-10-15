% �f�[�^�ǂݍ���
mix1 = load( 'MIX1.txt' );
mix2 = load( 'MIX2.txt' );

% ���F��
X = [mix1 mix2]';
G = X * X' / size(X,2);
[P,L] = EIG( G );
T = diag( 1./ sqrt( diag(L) ) ) * P';
Z = T * X;

max_kurt = 0;
max_theta = 0;
for theta=0:0.05:pi
  % ��]�s�� R ���쐬��
  R = [cos(theta) -sin(theta); sin(theta) cos(theta)]; 
  %�f�[�^ Z ����]
  Y = R * Z;
  % ��s�ڂ������o��(�Е�ŏ\���Ȃ̂�)
  data = Y(1,:);
  [r,tau] = size(data);
  ave = mean( data );
  sum1 = 0;
  for t = 1:tau
     up = (data(t) - ave)^4;
     sum1 = sum1 + up;
  end
  up1 = sum1/tau;
  sum2 =0; 
  for t = 1:tau
     down = (data(t) - ave)^2;
     sum2 = sum2 + down;
  end
  down1 = (sum2/tau)^2;
  k=abs((up1/down1) - 3);
 % k = abs(kurtosis(data));
  if k>max_kurt
     max_kurt = k;
     max_theta = theta;
  end
  % data �̃J�[�g�V�X�̐�Βl���v�Z���A
  % max_kurt ���傫����΁A
  % max_kurt �� max_theta ���X�V
end

% max_theta ��p������]�s���������
R = [cos(max_theta) -sin(max_theta) ; sin(max_theta) cos(max_theta) ];
Y = R * Z;

% �ȉ��A���𕷂��Ă݂�B(pause �͈ꎟ��~�B�����̃L�[�������ΐi��)
sound( mix1/max(abs(mix1)), 44100 );
pause;
sound( mix2/max(abs(mix2)), 44100 );
pause;
sound( Y(1,:)/max(abs(Y(1,:))), 44100 );
pause;
sound( Y(2,:)/max(abs(Y(2,:))), 44100 );

