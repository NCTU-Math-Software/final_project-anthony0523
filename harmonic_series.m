%輸入一個x屬於(1,710)，此方程式將輸出一個N屬於正整數並滿足S(N+1)>x>sN (如果x>33.8，1/N會開始小於machine epsilon，程式會判斷為0，故開始用Euler’s estimate method找估計值)
function harmonic_series(x)                     
    format long                                 %設定顯示15位精度
    sum_all = 0;                                %設定初始的總和為0
    N = 1;                                      %次數從1開始
    gamma = 0.577215664901533;
    
    while x < 1 || x > 710                      %如果x<1，N不存在;如果x>710，無法找到N
        if x < 1
            disp('x < 1，故無法顯示答案，不存在N使得S(N+1)>x>sN');
        else
            disp('x > 710，數字過大，無法找到N');
        end
        x = input('請重新輸入x，範圍為(1,710):');
    end
    if x > 27.5 && x < 33.8                     %如果x>27.5，計算時間將超出10分鐘
        disp('33.8 > x > 27.5，數字過大，程式將執行超過10分鐘')
        choose = input('是否確定要執行，是請按1，否則按0:');
        if choose == 0
            x = input('請重新輸入x，範圍為(1,33.8):');
        end
    end
    while sum_all < x                           %設定條件為總和小於x時繼續做
        if x>= 33.8                             %x >= 33.8，因為1/N已開始小於machine epsilon，將被判斷為0
            N = exp(x - gamma);                 %用Euler’s estimate method來估計N
            break
        end
        sum_all = sum_all + (1/N);              %計算總和
        N = N+1;                                %計次
    end
    SN = sum_all - 1/(N-1);                     %減回一項，計算SN
     
    if abs(sum_all - x) < 10^(-10) || abs(SN - x) < 10^(-10)       %如果S(N+1)=x，N不存在
        disp('無法顯示答案，因為級數和等於x，不存在N使得S(N+1)>x>sN');
        if abs(sum_all - x) < 10^(-10)
            disp(['S' num2str(N-1) ' = ']);     %輸出S(N+1)  
            disp(sum_all);
            disp(['S' num2str(N-1) ' = x = ' num2str(x)]);
        elseif abs(SN - x) < 10^(-10)
            disp(['S' num2str(N-2) ' = ']);     %輸出SN  
            disp(SN);
            disp(['S' num2str(N-2) ' = x = ' num2str(x)]);
        end
    elseif x >= 33.8                            %如果x>=33.8，輸出估計值
        disp('x >= 33.8，因為1/N已開始小於machine epsilon，將被判斷為0');
        disp('用Euler’s estimate method, 我們可以得到估計值:');
        disp('N=');
        disp(N);
    else  
        disp(['S' num2str(N-2) ' =']);          %輸出SN
        disp(SN);                               
        disp(['S' num2str(N-1) ' =']);          %輸出S(N+1)  
        disp(sum_all);                          
        disp(['S' num2str(N-1) ' > ' num2str(x) ' > S' num2str(N-2) ', so N=' num2str(N-2)]); %輸出N
    end 
end
