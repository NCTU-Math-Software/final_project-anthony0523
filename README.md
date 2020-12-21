# final_project-anthony0523
final_project-anthony0523 created by GitHub Classroom

I'll choose project 1(Harmonic series)

輸入一個x∈(1,33.5)，此方程式將輸出一個N∈正整數並滿足S(N+1)>x>sN

小提醒(以下三種情況均會讓使用者重新輸入x):

1.如果33.5>x>27.5，計算時間將超出10分鐘，會讓使用者決定是否要執行

2.如果x<1，不存在N滿足S(N+1)>x>sN

3.如果x>=33.5，1/N會開始小於machine epsilon，程式會判斷為0，無法找到N

特殊情況:

如果S(N+1)=x，不存在N滿足S(N+1)>x>sN，會輸出S(N+1)的答案並告知S(N+1)=x

EXAMPLE:

INPUT:

    x=5
   
OUTPUT:

    S82=
    4.990020079909081

    S83=
    5.002068272680166

    S83 > 5 > S82, so N=82

