% iris_normal.m
% 품종별 sepal length 히스토그램 + 정규분포 곡선 그리기
% iris.csv 를 이 파일과 같은 폴더에 두고 실행

T = readtable('iris.csv');
x    = T{:,1};          % 1열: sepal length
kind = T{:,5};          % 5열: 품종 이름

names  = {'Setosa', 'Versicolor', 'Virginica'};
colors = {'b', 'r', 'g'};

xs = linspace(4, 8.5, 300);   % 곡선을 그릴 x 좌표 300개 (4cm ~ 8.5cm)

figure; hold on;
for k = 1:3
    v = x(strcmp(kind, names{k}));   % 이 품종의 50개만 골라냄

    mu    = mean(v);                 % 평균
    sigma = std(v);                  % 표본 표준편차 (n-1로 나눔)

    % 히스토그램: 'pdf'로 정규화해야 곡선과 같은 높이 단위가 됨
    histogram(v, 'Normalization', 'pdf', 'BinWidth', 0.2, ...
        'FaceColor', colors{k}, 'FaceAlpha', 0.2, 'HandleVisibility', 'off');

    % 정규분포 pdf 공식을 직접 계산 (normpdf 대신, 툴박스 없어도 됨)
    y = 1 ./ (sigma * sqrt(2*pi)) .* exp(-(xs - mu).^2 ./ (2 * sigma^2));

    plot(xs, y, colors{k}, 'LineWidth', 2, ...
        'DisplayName', sprintf('%s (mean %.3f, SD %.3f)', names{k}, mu, sigma));
end
hold off;

xlabel('Sepal length (cm)');
ylabel('Probability density');
title('Sepal length by variety');
legend('Location', 'northeast');
grid on;