function [saida] = ppciclosop(serie,model)
%Permite o pre-processamento(fourier) da s�rie, dado o modelo
%Ciclos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n1=size(serie,1);
retirada=cell(n1,1);
residuo=cell(n1,1);
for i=1:n1
[serie_sem_NaN nans]=removeNaN(serie(i,:));%Remove os NaNs
tendciclos(serie_sem_NaN',0,0);%Teste visual
grau(i)=model{1}(i);
nc(i)=model{2}(i);
[residuo_coluna,retirada{i}]=tendciclos(serie_sem_NaN',grau(i),nc(i));%extrai os ciclos determinados na an�lise visual.
residuo{i}=residuo_coluna';%Obs.: como tendciclos opera com vetor coluna, � preciso fazer a transposta para ajustar
if nans==0%se n�o h� NaN, o res�duo � o mesmo
serie(i,:)=residuo{i};
else%Se h� NaN, adicionas-se no inicio da s�rie para manter a matriz quadrada
[serie_com_nans] = adicionaNaN(residuo{i},nans);
serie(i,:)=serie_com_nans;
end
clear residuoNaN;%apaga a vari�vel para evitar incompatibilidade no loop
end
saida=serie;
end

