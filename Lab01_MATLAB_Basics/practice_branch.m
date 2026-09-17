clear all; close all; clc;

% x 데이터의 합, 평균 구함
x = 1:1:10;

out = 0;
out1 = 0;

for k = 1:1:length(x)
    out = out + x(k);
    out1 = out1 + x(k)/length(x);
end
out
out1

% 내장함수 사용
out00 = sum(x)
out11 = mean(x)
out22 = std(x)

% x데이터 중 2의 배수, 3의 배수, 5의 배수의 합
out2 = 0;
out3 = 0;
out5 = 0;

out2_set = [];
out3_set = [];
out5_set = [];

x = 1:1:100;

for k=1:1:length(x)
    if mod(x(k), 2) == 0 % mod(a, b) a를 b로 나눈 나머지를 반환
        out2 = out2 + x(k);
        out2_set = [out2_set x(k)];
    end
    if mod(x(k), 3) == 0
        out3 = out3 + x(k);
        out3_set = [out3_set x(k)];
    end
    if mod(x(k), 5) == 0
        x(k)
        out5 = out5 + x(k);
        out5_set = [out5_set x(k)];
    end
end

out2
out3
out5

x = 1:1:100;

idx2 = find(mod(x,2) == 0);
idx3 = find(mod(x,3) == 0);
idx4 = find(mod(x,5) == 0);

out22 = sum(x(idx2))
out33 = sum(x(idx3))
out55 = sum(x(idx4))