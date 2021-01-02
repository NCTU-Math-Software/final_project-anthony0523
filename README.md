# Harmonic Series

## 執行方式

輸入一個x∈(1,710)，此方程式將輸出一個正整數N並滿足級數和1/n，n從1到N，S(N+1)>x>SN

## EXAMPLE

#### EXAMPLE 1(正常情況):

INPUT:

    x=5
   
OUTPUT:

    S82=
        4.990020079909081

    S83=
        5.002068272680166

    S83 > 5 > S82, so N=82

#### EXAMPLE 2(級數和等於x):

INPUT:

    x=2.45

OUTPUT:

    無法顯示答案，因為級數和等於x，不存在N使得S(N+1)>x>sN
    S6= 
       2.450000000000000

    S6 = x = 2.45
    
#### EXAMPLE 3(x>=33.8之情況):

INPUT:

    x=40
    
OUTPUT:

    x >= 33.8，因為1/N已開始小於machine epsilon，將被判斷為0
    用Euler-Maclaurin sum, 我們可以得到估計值:
    N=
        1.321592903575671e+17

### 小提醒(以下三種情況均會讓使用者重新輸入x):

1.如果x<1，不存在N滿足S(N+1)>x>SN

2.如果x>710，數字過於龐大，程式無法計算 (備註2)

3.如果33.8>x>27.5，計算時間將超出10分鐘，會讓使用者決定是否要執行

### 特殊情況:

1.如果x>=33.8，1/N會開始小於machine epsilon，程式會判斷為0，此時會用Euler-Maclaurin sum計算估計值 (備註1、3)

2.如果S(N+1)=x，不存在N滿足S(N+1)>x>SN，會輸出S(N+1)的答案並告知S(N+1)=x

### 做法:

1.判斷x範圍是否合理，如果x不屬於(1,710)，則讓使用者重新輸入

2.用while迴圈計算級數和，當總和小於x時繼續做，可算出S(N+1)和SN；如果x>=33.8，用Euler-Maclaurin sum計算估計值

3.判斷x是否剛好等於級數和，如果是，輸出S(N+1)的答案並告知S(N+1)=x；否則正常輸出答案

## 備註

### 備註1:

用Euler-Maclaurin sum，我們可以得知 x ≈ ln(N) + γ + 1/2N − (k=1到∞，(B2k/N^k)x(1/N^2k)之總和) (參考2)

where γ = 0.577215664901533 . . . 

where B2k為白努利數 (參考3)

由於此程式設定為x>33.8時使用Euler-Maclaurin sum，此時的1/N已小於machine epsilon，故忽略不計γ之後的項數

故得到 x ≈ ln(N) + γ.

也就是說，N ≈ exp(x - γ).

### 備註2:

#### Table 1: x and ln(N)+γ comparison, for n = 1, 2, . . . , 10.

| N        | x                  | ln(N)+γ            | x - (ln(N)+γ)      |
| -------- |:------------------:|:------------------:|:------------------:|
| 1       | 1.0000000000000000 | 0.5772156649015329 | 0.4227843350984671 |
| 2       | 1.5000000000000000 | 1.2703628454614782 | 0.2296371545385218 |
| 3       | 1.8333333333333333 | 1.6758279535696428 | 0.1575053797636905 |
| 4       | 2.0833333333333330 | 1.9635100260214235 | 0.1198233073119095 |
| 5       | 2.2833333333333332 | 2.1866535773356333 | 0.0966797559977000 |
| 6       | 2.4499999999999997 | 2.3689751341295877 | 0.0810248658704120 |
| 7       | 2.5928571428571425 | 2.5231258139568462 | 0.0697313289002963 |
| 8       | 2.7178571428571425 | 2.6566572065813685 | 0.0611999362757740 |
| 9       | 2.8289682539682537 | 2.7744402422377523 | 0.0545280117305014 |
| 10      | 2.9289682539682538 | 2.8798007578955787 | 0.0491674960726751 |

#### Table 2: x and ln(N)+γ comparison, for n = 10^2, . . . , 10^8.

| N        | x                  | ln(N)+γ            | x - (ln(N)+γ)      |
| -------- |:------------------:|:------------------:|:------------------:|
| 10^2    | 5.18737751763962 | 5.18238585088962 | 4.99166674999607 × 10^(−3) |
| 10^3    | 7.48547086055034 | 7.48497094388367 | 4.99916666673705 × 10^(−4) |
| 10^4    | 9.78760603604435 | 9.78755603687772 | 4.99991666309541 × 10^(−5) |
| 10^5    | 12.09014612986334 | 12.09014112987176 | 4.99999157277387 × 10^(−6) |
| 10^6    | 14.39272672286499 | 14.39272622286581 | 4.99999181613475 × 10^(−7) |
| 10^7    | 16.69531136585727 | 16.69531131585985 | 4.99974177614604 × 10^(−8) |
| 10^8    | 18.99789641385255 | 18.99789640885390 | 4.99865393521759 × 10^(−9) |

由Table1可知，當正整數N很小的時候，Euler-Maclaurin sum與真實值的誤差極大，但有慢慢縮短的趨勢

由Table2可知，當N以指數函數的速度增加，誤差縮短的速度極快，N=10^8時，x約等於19，誤差已小於10^(-8)

所以在程式中設定當x>33.8時使用Euler-Maclaurin sum，誤差即可忽略。

### 備註3:

N ≈ exp(x - γ).

對於N = 10^308，將γ之後的所有項都估計為零。 (參考1)

級數和1/n，n從1到10^308，其總和大約為710。

## 參考資料:

[參考1(Diego Miramontes)](https://www.researchgate.net/publication/344293598_An_alternative_strategy_for_harmonic_numbers_calculation_and_a_numerical_growth_rate)

[參考2(Irish Math. Soc. Bulletin)](https://core.ac.uk/download/pdf/297018835.pdf)

[參考3(Bernoulli numbers)](https://zh.wikipedia.org/wiki/%E4%BC%AF%E5%8A%AA%E5%88%A9%E6%95%B0)
