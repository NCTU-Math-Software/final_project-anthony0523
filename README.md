# Harmonic Series

## 執行方式

輸入一個x∈(1,33.8)，此方程式將輸出一個正整數N並滿足級數和1/n，n從1到N，S(N+1)>x>SN

### 小提醒(以下三種情況均會讓使用者重新輸入x):

1.如果x<1，不存在N滿足S(N+1)>x>SN

2.如果33.8>x>27.5，計算時間將超出10分鐘，會讓使用者決定是否要執行

3.如果x>=33.8，1/N會開始小於machine epsilon，程式會判斷為0，無法找到N

### 特殊情況:

如果S(N+1)=x，不存在N滿足S(N+1)>x>SN，會輸出S(N+1)的答案並告知S(N+1)=x

### 做法:

1.判斷x範圍是否合理，如果x不屬於(1,33.8)，則讓使用者重新輸入

2.用while迴圈計算級數和，當總和小於x時繼續做，可算出S(N+1)和SN

3.判斷x是否剛好等於級數和，如果是，輸出S(N+1)的答案並告知S(N+1)=x；否則正常輸出答案

### EXAMPLE:

INPUT:

    x=5
   
OUTPUT:

    S82=
    4.990020079909081

    S83=
    5.002068272680166

    S83 > 5 > S82, so N=82

### 參考資料:

[x上限為33.8(Irish Math. Soc. Bulletin)](https://core.ac.uk/download/pdf/297018835.pdf)
