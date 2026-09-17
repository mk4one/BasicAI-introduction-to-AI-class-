data = [1 2 3; 4 5 6; 7 8 9];

% 2행 3열 데이터
data(2,3)
% 3행 1열 데이터
data(3,1)
% 2행 모든 데이터
data(2,:)
% 3열 모든 데이터
data(:,3)
% 2행의 1, 2열 데이터
data(2,1:2)

% 1~10까지 1씩 증가 변수
a = 1:1:10;
% 데이터 개수 확인
a
length(a)

% 0이 10개인 변수
a = zeros(1,10) % 1행 10열
a = zeros(10, 1) % 10행 1열
% 1이 10개인 변수
a = ones(1, 10) % 1행 10열
a = ones(10, 1) % 10행 1열
% 1의 개수가 a의 길이와 같은 변수
a = 1:3.5:100 % 1~100까지 3.5씩 증가 변수 즉 29개
b = ones(1, length(a))


% 그림을 그리고 싶을 땐?
x = 1:1:10;
y = 2*x - 1;

figure;
plot(x, y);

figure;
stem(x, y);

figure;
bar(x, y);


% 한 화면에 그리고 싶을 땐?
figure;
subplot(3, 1, 1); plot(x, y);
subplot(3, 1, 2); stem(x, y);
subplot(3, 1, 3); bar(x, y);

figure;
subplot(1, 3, 1); plot(x, y);
subplot(1, 3, 2); stem(x, y);
subplot(1, 3, 3); bar(x, y);
% (1, 3, 2)에서 1, 3은 공간 분할, 2는 그릴 위치

% 특정 조건에 맞는 데이터 가져오기
x = 1:2:10;
i = find(x > 5) % x들 중 5보다 큰 값의 위치를 가져와라
y = x(i)