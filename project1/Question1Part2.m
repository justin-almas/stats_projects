U = rand(1000,1);
Y = -1/3 * log(1-U);
%histogram(normalize(Y),10,Normalization="pdf");

%theoretical mean is 1/3 or 1/lambda
%as n increases, S trends towards 1/3 which corresponds to the
%central limit theorem
m = 1000;
A = zeros(m,1);
for i = 1:m
    A(i,1) = S(2500);
end
%histogram(A);
%at m = 1000, as n increases, the values become more and more centered
%around the theoretical mean


histogram(normalize(A),10,Normalization="pdf")

S(5000)
function simulate = S(n)
    A = rand(n,1);
    T = -1/3 * log(1-A);
    simulate = (1/n) * sum(T,"all");
end