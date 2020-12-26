%��J�@��x�ݩ�(1,710)�A����{���N��X�@��N�ݩ󥿾�ƨú���S(N+1)>x>sN (�p�Gx>33.8�A1/N�|�}�l�p��machine epsilon�A�{���|�P�_��0�A�G�}�l��Euler��s estimate method����p��)
function harmonic_series(x)                     
    format long                                 %�]�w���15����
    sum_all = 0;                                %�]�w��l���`�M��0
    N = 1;                                      %���Ʊq1�}�l
    gamma = 0.577215664901533;
    
    while x < 1 || x > 710                      %�p�Gx<1�AN���s�b;�p�Gx>710�A�L�k���N
        if x < 1
            disp('x < 1�A�G�L�k��ܵ��סA���s�bN�ϱoS(N+1)>x>sN');
        else
            disp('x > 710�A�Ʀr�L�j�A�L�k���N');
        end
        x = input('�Э��s��Jx�A�d��(1,710):');
    end
    if x > 27.5 && x < 33.8                     %�p�Gx>27.5�A�p��ɶ��N�W�X10����
        disp('33.8 > x > 27.5�A�Ʀr�L�j�A�{���N����W�L10����')
        choose = input('�O�_�T�w�n����A�O�Ы�1�A�_�h��0:');
        if choose == 0
            x = input('�Э��s��Jx�A�d��(1,33.8):');
        end
    end
    while sum_all < x                           %�]�w�����`�M�p��x���~��
        if x>= 33.8
            N = exp(x - gamma);
            break
        end
        sum_all = sum_all + (1/N);              %�p���`�M
        N = N+1;                                %�p��
    end
    SN = sum_all - 1/(N-1);                     %��^�@���A�p��SN
     
    if abs(sum_all - x) < 10^(-10) || abs(SN - x) < 10^(-10)       %�p�GS(N+1)=x�AN���s�b
        disp('�L�k��ܵ��סA�]���żƩM����x�A���s�bN�ϱoS(N+1)>x>sN');
        if abs(sum_all - x) < 10^(-10)
            disp(['S' num2str(N-1) ' = ']);     %��XS(N+1)  
            disp(sum_all);
            disp(['S' num2str(N-1) ' = x = ' num2str(x)]);
        elseif abs(SN - x) < 10^(-10)
            disp(['S' num2str(N-2) ' = ']);     %��XSN  
            disp(SN);
            disp(['S' num2str(N-2) ' = x = ' num2str(x)]);
        end
    elseif x >= 33.8                            %�p�Gx>=33.8�A��X���p��
        disp('x >= 33.8�A�]��1/N�w�}�l�p��machine epsilon�A�N�Q�P�_��0');
        disp('��Euler��s estimate method, �ڭ̥i�H�o����p��:');
        disp('N=');
        disp(N);
    else  
        disp(['S' num2str(N-2) ' =']);         %��XSN
        disp(SN);                               
        disp(['S' num2str(N-1) ' =']);         %��XS(N+1)  
        disp(sum_all);                          
        disp(['S' num2str(N-1) ' > ' num2str(x) ' > S' num2str(N-2) ', so N=' num2str(N-2)]); %��XN
    end 
end