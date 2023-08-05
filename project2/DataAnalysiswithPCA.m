X = [1.7 3.7 5.6 60.3 22.1 ; 2.2 5.3 6.2 60.2 21.3 ; 2.2 5.9 7.2 60.6 21.4 ; ...
    2.3 4.1 12.6 59.8 22.7 ; 4.2 -1.5 12.1 61.2 22.5 ; 5.5 5.6 7.6 60.9 22.1; ...
    6.3 0.5 7.5 61.9 21.6 ; 6.8 2.7 4.4 61.6 21.7 ; 7.0 2.1 4.5 62.8 20.7 ; ...
    7.4 4.3 3.8 62.9 21.1 ; 9.5 -1.0 4.7 65.2 18.0 ; 11.2 1.5 7.1 65.6 17.3 ; ...
    12.5 0.4 5.6 65.2 16.2 ; 12.5 2.2 5.2 64.9 16.0 ; 11.8 0.8 6.1 65.5 15.6 ; ...
    11.7 1.4 3.9 64.2 15.7 ; 11.3 2.0 2.3 64.5 16.0 ; 10.2 5.0 1.8 63.1 17.7 ; ...
    8.6 3.6 4.6 62.4 19.3 ; 7.6 3.2 3.0 62.4 20.2];

R = corrcoef(X);
Z = zscore(X);
[V,D] = eig(R)
C = diag(D)
I = 0;
for i = 1:5
    I = I + C(i,1);
end
I;
eigenPercentages = zeros(5,1);
for j = 1:5
    eigenPercentages(j,1) = C(j,1) / I;
end
eigenPercentages;

% principal values
lambda1 = C(5,1);
lambda2 = C(4,1);
lambda3 = C(3,1);
eigenVec1 = V(:,5);
eigenVec2 = V(:,4);
eigneVec3 = V(:,3);
f1 = Z * eigenVec1
f2 = Z * eigenVec2
f3 = Z * eigneVec3


%Contributions
contributionsf1 = zeros(20,1);
for i = 1:20
    contributionsf1(i,1) = (f1(i,1)^2) / (20 * lambda1);
end
contributionsf1;
contributionsf2 = zeros(20,1);
for i = 1:20
    contributionsf2(i,1) = (f2(i,1)^2) / (20 * lambda2);
end
contributionsf2;
%Square Cosine
cosinef1 = zeros(20,1);
for i = 1:20
    cosinef1(i,1) = (f1(i,1)^2) / ((norm(Z(i,:)))^2);
end
cosinef1;
cosinef2 = zeros(20,1);
for i = 1:20
    cosinef2(i,1) = (f2(i,1)^2) / ((norm(Z(i,:)))^2);
end
cosinef2;

%Question 11 start
Z = zscore(X);
T = (1/20) * Z * (Z.');
[U,I] = eig(T);
u1 = U(:,1);
u2 = U(:,2);
eigenu1 = I(1,1);
eigenu2 = I(2,2);
aj1 = (1/sqrt(20)) * (Z.') * u1;
aj2 = (1/sqrt(20)) * (Z.') * u2;
cosineaj1 = aj1.^2;
cosineaj2 = aj2.^2;

contributionaj1 = zeros(5,1);
for i = 1:5
    contributionaj1(i,1) = ((aj1(i,1))^2) / eigenu1;
end
contributionaj1;
contributionaj2 = zeros(5,1);
for i = 1:5
    contributionaj2(i,1) = ((aj2(i,1))^2) / eigenu2;
end
contributionaj2;


%Correlation circle

figure(1)
hold on
circle(0,0,1);
M = [aj1 aj2];
plotv(M.', '-');
legend('Circle', 'CHO', 'CRO', 'INF', 'CPR', 'INV')
hold off

%Question 13
yearContribution = zeros(20,1);
for i = 1:20
    yearContribution(i,1) = ((f1(i,1))^2 + (f2(i,1))^2)/(20 * (lambda1 + lambda2));
end
figure(2)
yearsSample = {'1971', '1972', '1973', '1974', '1975', '1976', '1977', ...
    '1978', '1979', '1980', '1981', '1982', '1983', '1984', '1985', ...
    '1986', '1987', '1988', '1989', '1990'};
scatter(f1,f2,1000 * yearContribution,'filled')
text(f1,f2,yearsSample,'VerticalAlignment','bottom','HorizontalAlignment','right')
line([0,0],[0,1.1*min(f2)],'Color','red','LineStyle','-')
line([0,0],[0,1.1*max(f2)],'Color','red','LineStyle','-')
line([1.1*min(f1),0],[0,0],'Color','red','LineStyle','-')
line([1.1*max(f1),0],[0,0],'Color','red','LineStyle','-')
axis(1.1*[min(f1) max(f1) min(f2) max(f2)])



function circle(x,y,r)
drawAngle = 0:0.01:2*pi;
xDraw = r * cos(drawAngle);
yDraw = r * sin(drawAngle);
plot(x+xDraw, y+yDraw);
end


