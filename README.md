# Harmonic Series

## 執行方式

輸入一個x∈(1,710)，此方程式將輸出一個正整數N並滿足級數和1/n，n從1到N，S(N+1)>x>SN

### 小提醒(以下三種情況均會讓使用者重新輸入x):

1.如果x<1，不存在N滿足S(N+1)>x>SN

2.如果x>710，數字過於龐大，程式無法計算

3.如果33.8>x>27.5，計算時間將超出10分鐘，會讓使用者決定是否要執行

### 特殊情況:

如果x>=33.8，1/N會開始小於machine epsilon，程式會判斷為0，此時會用Euler’s estimate method計算估計值(備註1)

如果S(N+1)=x，不存在N滿足S(N+1)>x>SN，會輸出S(N+1)的答案並告知S(N+1)=x

### 做法:

1.判斷x範圍是否合理，如果x不屬於(1,710)，則讓使用者重新輸入

2.用while迴圈計算級數和，當總和小於x時繼續做，可算出S(N+1)和SN；如果x>=33.8，用Euler’s estimate method計算估計值

3.判斷x是否剛好等於級數和，如果是，輸出S(N+1)的答案並告知S(N+1)=x；否則正常輸出答案

#### EXAMPLE 1:

INPUT:

    x=5
   
OUTPUT:

    S82=
        4.990020079909081

    S83=
        5.002068272680166

    S83 > 5 > S82, so N=82

#### EXAMPLE 2:

INPUT:

    x=2.45

OUTPUT:

    無法顯示答案，因為級數和等於x，不存在N使得S(N+1)>x>sN
    S6= 
       2.450000000000000

    S6 = x = 2.45
    
#### EXAMPLE 3:

INPUT:

    x=40
    
OUTPUT:

    x >= 33.8，因為1/N已開始小於machine epsilon，將被判斷為0
    用Euler’s estimate method, 我們可以得到估計值:
    N=
        1.321592903575671e+17

## 備註1

用Euler’s estimate for the harmonic sum，我們可以得知 x ≈ SN ≈ ln(N) + γ  where  γ =  0.577215664901533 . . . (參考1)

也就是說，N ≈ exp(x - γ).

## 參考資料:

[參考1(Irish Math. Soc. Bulletin)](https://core.ac.uk/download/pdf/297018835.pdf)

[參考2(Diego Miramontes)](https://www.researchgate.net/publication/344293598_An_alternative_strategy_for_harmonic_numbers_calculation_and_a_numerical_growth_rate)
