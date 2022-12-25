%% P1 Q1,2
X = rand(5000,1);
p = 0.8;
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
%histogram(X)
% As the number of n increases, the probabilites trend closer
% to p and 1-p
T = S(50000)
%theoretical mean is 0.6, as n goes up, it gets significantly closer
%to the theoretical mean. This is called the Central Limit Theorem
m = 1000;
A = zeros(m,1);
for i = 1:m
    A(i,1) = S(5000);
end
%histogram(A);
histogram(normalize(A),30,Normalization="pdf");
% as m goes up, the distribution resembles the normal distribution
% more and more
function simulate = S(n)
    A = rand(n,1);
    p = 0.8;
[rows,cols] = size(A);
for col = 1:cols
    for row = 1:rows
        if A(row,col) > p
            A(row,col) = -1;
        else
            A(row,col) = 1;
        end
    end
end
    simulate = (1/n) * sum(A,"all");
end

%theoretical mean is -0.6, as n goes up, it gets significantly closer
%to the theoretical mean. This is called the Central Limit Theorem
