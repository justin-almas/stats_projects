n = 10;
numZero = 3000;
simStartPop = 50000;
simLambda = 0.5;
simTimeStep = 0.01;
sumVector = zeros(numZero,1);
numVector = zeros(numZero,1);
functionTheoretical = @(t) simStartPop * exp((-1) * simLambda * (t*simTimeStep));

%for i = 1:n
%    tempVector = D(simStartPop,simLambda,simTimeStep);
%    sumVector = sumVector + tempVector;
%end
for i = 1:numZero
    numVector(i,1) = i;
end

%figure()
%yyaxis left
%bar(numVector,sumVector);
%yyaxis right
%fplot(functionTheoretical,[0,numZero],Color = [1 0 1]);


%XY decays
sumVectorX = zeros(numZero,1);
sumVectorY = zeros(numZero,1);

for i = 1:n
    [tempVectorX,tempVectorY] = D2(simTimeStep);
    sumVectorX = sumVectorX + tempVectorX;
    sumVectorY = sumVectorY + tempVectorY;
end
functionTheoreticalY = @(t) simStartPop * (0.5/(0.5-0.6)) * ((exp((-1) ...
    * 0.6 * t * simTimeStep)) - (exp((-1) * 0.5 * t * simTimeStep))); 
figure()
yyaxis left
bar(numVector,sumVectorX);
yyaxis right
fplot(functionTheoretical,[0,numZero],Color = [1 0 1]);

figure()
yyaxis left
bar(numVector,sumVectorY);
yyaxis right
fplot(functionTheoreticalY,[0,numZero],Color = [1 0 1]);


function time_step = T(n, p)
    time_step = 0;
    for i = 1:n
        time_step = time_step + P(p);
    end
end
    
function N = P(p)
    if rand <= p
        N = -1;
    else
        N = 0;
    end
end

function d = D(size,lamda,dt)
    i = 1;
    stepVector = zeros(50000,1);
    while size ~= 0
        stepVector(i,1) = size;
        size = size + T(size,lamda * dt);
        i = i+1;
    end
    d = stepVector;
end
function [vecX,vecY] = D2(dt)
    time_step = 1;
    sizeX = 10000;
    sizeY = 0;
    stepVectorX = zeros(3000,1);  % this num changes
    stepVectorY = zeros(3000,1);  % so does this one
    while (sizeX > 0 || sizeY > 0)
        stepVectorX(time_step,1) = sizeX;
        stepVectorY(time_step,1) = sizeY;
        dx = T(sizeX, 0.5 * dt);
        sizeY = sizeY - dx + T(sizeY, 0.6 * dt);
        sizeX = sizeX + dx;
        time_step = time_step + 1;
    end
    vecX = stepVectorX;
    vecY = stepVectorY;
end
    
