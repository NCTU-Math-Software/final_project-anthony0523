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

%��J�@��x�ݩ�(1,33.5]�A����{���N��X�@��N�ݩ󥿾�ƨú���S(N+1)>x>sN (�p�Gx>33.5�A1/N�|�}�l�p��machine epsilon�A�{���|�P�_��0�A�L�k���N)
function harmonic_series(x)                     
    format long                                 %�]�w���15����
    sum_all = 0;                                %�]�w��l���`�M��0
    N = 1;                                      %���Ʊq1�}�l
    if x <= 1                                   %�p�Gx<=1�AN���s�b
        disp('x<=1�A�G�L�k��ܵ��סA���s�bN�ϱoS(N+1)>x>sN');
        x = input('�Э��s��Jx�A�d��(1,33.5]:');
    elseif x > 27.5 && x < 33.5                 %�p�Gx>27.5�A�p��ɶ��N�W�X10����
        disp('33.5>x>27.5�A�Ʀr�L�j�A�{���N����W�L10����')
        choose = input('�O�_�T�w�n����A�O�Ы�1�A�_�h��0:');
        if choose == 0
            x = input('�Э��s��Jx�A�d��(1,33.5]:');
        end
    elseif x >= 33.5
        disp('x >= 33.5�A�L�k��ܵ��סA�]��1/N�w�}�l�p��machine epsilon�A�N�Q�P�_��0�A�Y�L�k���N');
        x = input('�Э��s��Jx�A�d��(1,33.5]:');
    end

    while sum_all < x                           %�]�w�����`�M�p��x���~��
        sum_all = sum_all + 1/N;                %�p���`�M
        N = N+1;                                %�p��
    end
    SN = sum_all - 1/(N-1);                     %��^�@���A�p��SN
    
    if sum_all == x                             %�p�GS(N+1)=x�AN���s�b
        disp('�L�k��ܵ��סA�]��S(N+1)=x�A���s�bN�ϱoS(N+1)>x>sN');
    else  
        disp(['S' num2str(N-2) '(SN)=']);       %��XSN
        disp(SN);                               
        disp(['S' num2str(N-1) '(S(N+1))=']);   %��XS(N+1)  
        disp(sum_all);                          
        disp(['S' num2str(N-1) ' > ' num2str(x) ' > S' num2str(N-2) ', so N=' num2str(N-2)]); %��XN
    end 
end