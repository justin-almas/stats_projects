CHO = [1.7 2.2 2.2 2.3 4.2 5.5 6.3 6.8 7.0 7.4 9.5 11.2 12.5 ...
    12.5 11.8 11.7 11.3 10.2 8.6 7.6];
CRO = [3.7 5.3 5.9 4.1 -1.5 5.6 0.5 2.7 2.1 4.3 -1.0 1.5 0.4 ...
    2.2 0.8 1.4 2.0 5.0 3.6 3.2];
INF = [5.6 6.2 7.2 12.6 12.1 7.6 7.5 4.4 4.5 3.8 4.7 7.1 5.6 ...
    5.2 6.1 3.9 2.3 1.8 4.6 3.0];
CPR = [60.3 60.2 60.6 59.8 61.2 60.9 61.9 61.6 62.8 62.9 65.2 ...
    65.6 65.2 64.9 65.5 64.2 64.5 63.1 62.4 62.4];
INV = [22.1 21.3 21.4 22.7 22.5 22.1 21.6 21.7 20.7 21.1 18.0 ...
    17.3 16.2 16.0 15.6 15.7 16.0 17.7 19.3 20.2];
yearsSample = [1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 ...
    1981 1982 1983 1984 1985 1986 1987 1988 1989 1990];
% CHO
sampleMeanCHO = mean(CHO)
sampleVarianceCHO = var(CHO)
standardDeviationCHO = std(CHO)
quartilesCHO = quantile(CHO,[0.25,0.5,0.75])
minimumCHO = min(CHO)
maximumCHO = max(CHO)
coefficientOfVariationCHO = standardDeviationCHO / sampleMeanCHO
skewnessCHO = skewness(CHO)
kurtosisCHO = kurtosis(CHO)
%CRO
sampleMeanCRO = mean(CRO)
sampleVarianceCRO = var(CRO)
standardDeviationCRO = std(CRO)
quartilesCRO = quantile(CRO,[0.25,0.5,0.75])
minimumCRO = min(CRO)
maximumCRO = max(CRO)
coefficientOfVariationCRO = standardDeviationCRO / sampleMeanCRO
skewnessCRO = skewness(CRO)
kurtosisCRO = kurtosis(CRO)
%INF
sampleMeanINF = mean(INF)
sampleVarianceINF = var(INF)
standardDeviationINF = std(INF)
quartilesINF = quantile(INF,[0.25,0.5,0.75])
minimumINF = min(INF)
maximumINF = max(INF)
coefficientOfVariationINF = standardDeviationINF / sampleMeanINF
skewnessINF = skewness(INF)
kurtosisINF = kurtosis(INF)
%CPR
sampleMeanCPR = mean(CPR)
sampleVarianceCPR = var(CPR)
standardDeviationCPR = std(CPR)
quartilesCPR = quantile(CPR,[0.25,0.5,0.75])
minimumCPR = min(CPR)
maximumCPR = max(CPR)
coefficientOfVariationCPR = standardDeviationCPR / sampleMeanCPR
skewnessCPR = skewness(CPR)
kurtosisCPR = kurtosis(CPR)
%INV
sampleMeanINV = mean(INV)
sampleVarianceINV = var(INV)
standardDeviationINV = std(INV)
quartilesINV = quantile(INV,[0.25,0.5,0.75])
minimumINV = min(INV)
maximumINV = max(INV)
coefficientOfVariationINV = standardDeviationINV / sampleMeanINV
skewnessINV = skewness(INV)
kurtosisINV = kurtosis(INV)
%Evolution of Variables Over Time

figure(1)
plot(yearsSample, [CHO(:), CRO(:), INF(:), CPR(:), INV(:)]);
title('Variables Evolution Over Time')
figure(2)
plot(yearsSample,CHO)
title('CHO Evolution')
figure(3)
plot(yearsSample,CRO)
title('CRO Evolution')
figure(4)
plot(yearsSample,INF)
title('INF Evolution')
figure(5)
plot(yearsSample,CPR)
title('CPR Evolution')
figure(6)
plot(yearsSample,INV)
title('INV Evolution')



