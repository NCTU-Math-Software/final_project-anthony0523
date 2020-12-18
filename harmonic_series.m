%{
EXAMPLE
INPUT:
    x=5
OUTPUT:
    S82=
    4.990020079909081
    S83=
    5.002068272680166
    S83 > 5 > S82, so N=82 
%}

%輸入一個x屬於(1,33.5]，此方程式將輸出一個N屬於正整數並滿足S(N+1)>x>sN (如果x>33.5，1/N會開始小於machine epsilon，程式會判斷為0，無法找到N)
function harmonic_series(x)                     
    format long                                 %設定顯示15位精度
    sum_all = 0;                                %設定初始的總和為0
    N = 1;                                      %次數從1開始
    if x <= 1                                   %如果x<=1，N不存在
        disp('x<=1，故無法顯示答案，不存在N使得S(N+1)>x>sN');
        x = input('請重新輸入x，範圍為(1,33.5]:');
    elseif x > 27.5 && x < 33.5                 %如果x>27.5，計算時間將超出10分鐘
        disp('33.5>x>27.5，數字過大，程式將執行超過10分鐘')
        choose = input('是否確定要執行，是請按1，否則按0:');
        if choose == 0
            x = input('請重新輸入x，範圍為(1,33.5]:');
        end
    elseif x >= 33.5
        disp('x >= 33.5，無法顯示答案，因為1/N已開始小於machine epsilon，將被判斷為0，即無法找到N');
        x = input('請重新輸入x，範圍為(1,33.5]:');
    end

    while sum_all < x                           %設定條件為總和小於x時繼續做
        sum_all = sum_all + 1/N;                %計算總和
        N = N+1;                                %計次
    end
    SN = sum_all - 1/(N-1);                     %減回一項，計算SN
    
    if sum_all == x                             %如果S(N+1)=x，N不存在
        disp('無法顯示答案，因為S(N+1)=x，不存在N使得S(N+1)>x>sN');
    else  
        disp(['S' num2str(N-2) '(SN)=']);       %輸出SN
        disp(SN);                               
        disp(['S' num2str(N-1) '(S(N+1))=']);   %輸出S(N+1)  
        disp(sum_all);                          
        disp(['S' num2str(N-1) ' > ' num2str(x) ' > S' num2str(N-2) ', so N=' num2str(N-2)]); %輸出N
    end 
end