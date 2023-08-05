S1W = 0;

S1T = 0;

%for i = 1:1000
%   [T,R] = S(19/37,100,20);
%    S1T = S1T + T;
%    if R == 1
%        S1W = S1W + 1;
%    end
%end
%S1W = S1W / 1000;
%S1T = S1T / 1000
%figure(1)
%temp = [S1W 0.9970306483];
%temp2 = {'experimental'; 'theoretical'};
%bar(temp)
%title('Winning Probability')
%set(gca,'xticklabel',temp2);
%figure(2)
%temp3 = [1-S1W 1-(0.9970306483)];
%bar(temp3)
%title('Ruined Probability')
%set(gca,'xticklabel',temp2)




BW = 0;
BT = 0;
for i = 1:10000
    [T,R] = S(18/37,100,10);
    BT = BT + T;
    if R == 1
        BW = BW + 1;
    end
end
BW = BW / 10000
BT = BT / 10000

function RV = X(p)
    X = rand(100000,1);
    [rows,cols] = size(X);
    for col = 1:cols
        for row = 1:rows
            if X(row,col) > p
                X(row,col) = -1;
            else
                X(row,col) = 1;
            end
        end
    end
   RV = X;
end
function [T,R] = S(p,a,b)
    S = a;
    T = 0;
    i = 1;
    F = X(p);
    while ((S > 0) && (S <= (a+b)) && (i < 100000))
        S = S + F(i,1);
        T = T + 1;
        i = i + 1;
    end
    if S <= 0
        R = 0;
    else
        R = 1;
    end
end


