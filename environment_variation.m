global r_l r_g s
genomes = 100;
genepoolsize = 1000;
tau = 3;
fitness = zeros(genepoolsize,2);
fitness(:,1) = exprnd(1,genepoolsize,1) - 2;
fitness(:,2) = exprnd(1,genepoolsize,1) - 2;
timesteps = 10;
r_g = 0.01; %rate of gain of gene, s^-1
r_l = 0.01; %rate of loss  of gene, s^-1
frequency = zeros(1,genepoolsize);
for j =1:genomes
    for i = 1:timesteps
        s = fitness(:,mod(i,2)+1);
        x = ones(length(s),1);
        [t, solution] = ode45(@tderivs_t,0:tau,x);
        x = solution;
    end
    frequency = frequency + (rand(1,genepoolsize) < solution(end,:));
end

% ENVIRONMENT A
subplot(2,1,1)
scatterhistogram(fitness(:,1),frequency,'ScatterPlotLocation', ...
'NorthEast','NumBins',100, 'YHistogramDirection','left', ...
'HistogramDisplayStyle','bar','MarkerStyle','.')
xlabel('s_A')
ylabel('Gene frequency')
title('Gene frequency vs fitness in environment A')

% ENVIRONMENT B
subplot(2,1,2)
scatterhistogram(fitness(:,2),frequency,'ScatterPlotLocation', ...
'NorthEast','NumBins',100, 'YHistogramDirection','left', ...
'HistogramDisplayStyle','bar','MarkerStyle','.')
xlabel('s_B')
ylabel('Gene frequency')
title('Gene frequency vs fitness in environment B')