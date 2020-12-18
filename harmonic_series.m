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
function harmonic_series(x)                     %輸入一個x?(1,27.5]，此方程式將輸出一個N?正整數並滿足S(N+1)>x>sN (如果x>27.5，計算時間將超出10分鐘)
    format long                                 %設定顯示15位精度
    sum_all = 0;                                %設定初始的總和為0
    N = 1;                                      %次數從1開始
    if x <= 1                                   %如果x<=1，N不存在
        disp('無法顯示答案，不存在N使得S(N+1)>x>sN');
        x = input('請重新輸入x，範圍為(1,27.5]:');
    elseif x > 27.5                             %如果x>27.5，計算時間將超出10分鐘
        disp('數字過大，程式將執行超過10分鐘')
        choose = input('是否確定要執行，是請按1，否則按0:');
        if choose == 0
            x = input('請重新輸入x，範圍為(1,27.5]:');
        end
    end
    
    while sum_all < x                           %設定條件為總和小於x時繼續做
        sum_all = sum_all + 1/N;                %計算總和
        if sum_all == sum_all + 1/N             %當1/N小於machine epsilon，程式會判斷為0，屆時則跳出
            break
        end
        N = N+1;                                %計次
    end
    SN = sum_all - 1/(N-1);                     %減回一項，計算SN
    
    if sum_all == x                             %如果S(N+1)=x，N不存在
        disp('無法顯示答案，因為S(N+1)=x，不存在N使得S(N+1)>x>sN');
    elseif sum_all == sum_all + 1/N             %當1/N小於machine epsilon，程式會判斷為0，無法找到N
        disp('無法顯示答案，因為1/N已開始小於machine epsilon，將被判斷為0，即無法找到N');
    else  
        disp(['S' num2str(N-2) '(SN)=']);
        disp(SN);                               %輸出SN
        disp(['S' num2str(N-1) '(S(N+1))=']);
        disp(sum_all);                          %輸出S(N+1)
        disp(['S' num2str(N-1) ' > ' num2str(x) ' > S' num2str(N-2) ', so N=' num2str(N-2)]); %輸出N
    end 
end