
format long;

angulos = rand(5000,1)*40;

ax = axes;

senos = rand(5000,1)*40;

for i=1:5000
    senos(i) = sin(angulos(i));
end

rede = newff(angulos, senos, [4 4 4 4 4 4 4 4 4], {'logsig','tansig'}, 'trainrp', '', 'mse', {}, {}, '');

rede.trainParam.epochs = 20;

rede.trainParam.goal = 0.002;

rede = init(rede);

[rede_treinada, stats] = train(rede,angulos,senos);

plot(ax, stats.perf)