# final_project-anthony0523
final_project-anthony0523 created by GitHub Classroom

I'll choose project 1(Harmonic series)

輸入一個x∈(1,33.5]，此方程式將輸出一個N∈正整數並滿足S(N+1)>x>sN

小提醒:

如果x>27.5，計算時間將超出10分鐘，會讓使用者決定是否要執行，如果決定否，會讓使用者重新輸入x

如果x<=1，不存在N滿足S(N+1)>x>sN，會讓使用者重新輸入x

無法輸出答案之情況:

如果S(N+1)=x，不存在N滿足S(N+1)>x>sN

如果x>33.5，1/N會開始小於machine epsilon，程式會判斷為0，無法找到N

For example:

INPUT:

    x=5
   
OUTPUT:

    S82=
    4.990020079909081

    S83=
    5.002068272680166

    S83 > 5 > S82, so N=82

