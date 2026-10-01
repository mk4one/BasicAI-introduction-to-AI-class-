clear all; close all; clc;

load fisheriris.mat;

% sepal length, width  이용
setdata = [];
setdata = meas(:,1:2);

% petal length, width 이용
setdata_petal = [];
setdata_petal = meas(:,3:4);

% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_Cnt: 각 그룹의 중심 좌표
[mat_label, mat_CP] = kmeans(setdata_petal, 3, 'Start', setdata_petal(1:3,:));

%%
grp = 3; % k = 3;
class = [1 2 3];

% 함수 내에 사용된 편의 상 초기 3개 설정 
% my_CP = setdata_petal(1:grp,:);
% petal의 경우 1번과 2번 데이터가 1.4 0.2, 1.4 0.2로 값이 같아서
% 실제 실행시에는 NaN이 나타나는 문제가 있음.
% 따라서 실제론 편의상 앞에 3개 사용은 좋은 초기화가 아님.

%%
% [출력 변수] = my_kmeans_학번(입력변수);
[Final_label, my_CP] = my_kmeans_202310822(setdata_petal, grp, class);

%%
figure;
subplot(311); bar(mat_label); axis tight;
subplot(312); bar(Final_label); axis tight;
subplot(313); bar(mat_label-Final_label); axis tight;

my_CP
mat_CP
    
