global r_l r_g s
genomes = 100;
genepooolsize = 1000;
s = exprnd(1,genepooolsize,1) - 2; %Exponential distribution with rate 1, 
                                   % mean shifted to -1.
r_g = 0.01; %rate of gain of gene, s^-1
r_l = 0.01; %rate of loss  of gene, s^-1
frequency = zeros(1,genepooolsize);
x = ones(length(s),1);

for i = 1:genomes
    x = ones(length(s),1);
    [t, solution] = ode45(@tderivs_t,0:100,x);
    frequency = frequency + (rand(1,genepooolsize) < solution(end,:));
end

figure(1)
subplot(1,3,[1,2])
% plotting the theoretical relationship between gene fitness and frequency
plot(sortrows(s),genomes*sortrows(solution(end,:)'),'red')
hold on
% plotting the simulated gene frequencies against their fitness
scatter(s,frequency,10,'blue','filled')
xlabel('s')
ylabel('Gene frequency')
title('Gene frequency vs fitness')
hold off

% Plotting density plot of the distribution of fitness effects
subplot(1,3,3)
histogram(frequency,100,'Orientation','horizontal')
xlim([0 300])
ylim([0 100])
xticks([0 100 200])
xlabel('Gene count')
title('Gene frequency distribution')

% Plotting the distribution of the genepool
figure(2)
histogram(s,100,'Orientation','horizontal')
title('Distribution of fitness within the genepool')
xlabel('Gene count')
ylabel('Fitness, s')

% using scatterhistogram (no analytical plot overlay possible)
% figure(2)
% scatterhistogram(s,frequency,'ScatterPlotLocation','NorthEast','NumBins',100,'XLabel','s','YLabel','Gene frequency','YHistogramDirection','left','HistogramDisplayStyle','bar','MarkerStyle','.')


