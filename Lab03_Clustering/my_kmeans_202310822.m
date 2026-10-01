function [outputArg1,outputArg2] = my_kmeans_202310822(inputArg1,inputArg2,inputArg3)
%MY_KMEANS_202310822 이 함수의 요약을 여기에 작성
%   자세한 설명을 여기에 작성
arguments (Input)
    inputArg1
    inputArg2
    inputArg3
end

arguments (Output)
    outputArg1
    outputArg2
end
% [0단계: 초기 객체 선정]
% 편의상 1~3번째 데이터를 초기 값으로 하겠음 (거리들을 모두 계산하고 가장 거리가 먼 3점으로 하면 아마도 아래 while문의 동작 횟수가 줄어 들 것)
% (k가 3이니, 3개의 중심좌표가 나와야 하고, sepal length, width 두 정보만 사용하니, 중심좌표는 2차원)
my_CP = inputArg1(1:inputArg2,:); 

% [1단계: 객체 군집 배정]
my_label = [];
for kk=1:1:length(inputArg1)
    tmp_set = inputArg1(kk,:); % kk번째 데이터 가져오기

    % 각 중심좌표와 데이터 간의 유클리디안 거리를 계산
    udist = zeros(inputArg2, 1);
    for jj=1:1:inputArg2
        udist(jj,1) = norm(tmp_set - my_CP(jj, :));
    end

    % 현재 데이터와 중심좌표들의 거리를 오름차순으로 정렬
    [sv, si] = sort(udist, 'ascend');

    % 제일 앞에 있는 것이 거리가 제일 짧은 것. 그것의 그룹 ID로 현재 데이터를 할당하라 
    my_label(kk,1) = inputArg3(si(1));
end

Final_label = [];
chk = 1;
loop = 0;
% [2, 3단계, 1단계 반복: 군집 중심좌표 산출 & 수렴 조건 점검 / 객체 군집 배정
% 군집 중심좌표 산출 /객체 군집 배정 를 반복해야 함. 언제까지? 수렴 조건에 수렴할 때까지. 
% 수렴조건의 만족은 for문으로 확인이 어려우므로 while문으로
while(chk)
    loop = loop + 1;
    loop
    for kk=1:1:inputArg2
        idx = find(my_label == inputArg3(kk)); % kk 그룹에 할당된 데이터 가져오기
        tmp_data = inputArg1(idx,:);

        % kk 그룹에 할당된 데이터를 이용하여 중심 좌표를 계산
        my_CP(kk,:) = mean(tmp_data);       
    end

    % 새로운 중심좌표를 이용하여, 데이터를 재할당
    my_label_new = [];
    for kk=1:1:length(inputArg1)
        tmp_set = inputArg1(kk,:);

        udist = zeros(inputArg2, 1);
        for jj=1:1:inputArg2
            udist(jj,1) = norm(tmp_set - my_CP(jj, :));
        end

        [sv, si] = sort(udist, 'ascend');

        my_label_new(kk,1) = inputArg3(si(1));
    end

    % 1단계의 결과와 2단계의 결과가 같은지 평가
    idx = find(my_label_new ~= my_label);

    % 이전 할당 결과와 지금 할당 결과가 같으면 while문 종료
    % 그렇지 않으면, 위 과정을 반복
    if length(idx) == 0
        chk = 0;
        Final_label = my_label_new;
        break;
    else
        my_label = my_label_new;
    end
end

outputArg1 = Final_label;
outputArg2 = my_CP;
end