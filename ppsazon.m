function [saida, model] = ppsazon(serie)
%Permite a avalia��o da presen�a de sazonalidades (visual) e o pre-processamento(diferencia��o sazonal) da s�rie
%Sazonalidades%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n1,n2]=size(serie);
for i=1:n1
    [serie_sem_NaN nans]=removeNaN(serie(i,:));%Remove os NaNs da s�rie analisada e armazena o numero de nans encontrados
    testsaz(serie_sem_NaN,n2-2,3 );
    ps(i)=input('Entre com o per�odo da sazonalidade: ');%Teste visual
    residuoNaN=[];%aloca espa�o a mem�ria para a vari�vel
    if ps(i)>0
    residuoNaN(1:ps(i))=NaN;%criar um vetor com NaN para ser concatenado e manter o tamanho original do vetor
    [residuo{i},seriesazon0] = difsaz(serie_sem_NaN,ps(i));%Faz a difereciacao sazonal, resultando um vetor com um numero reduzido de amostras
    else
    residuo{i}=serie_sem_NaN;  %Se n�o for detectada sazonalidade, n�o se faz nada
    end
    if nans==0
    serie(i,:)=[residuoNaN residuo{i}];%Se nao foram encontrado nans pela funcao removeNaN, n�o h� que se desfazer esta operacao. Apenas os NaNs para equilibrar a diferencia��o sazonal
    else %Se foram removidos nans por removeNaN, ent�o estes dever�o ser readicionados para voltar ao tamanho origial do vetor
    [serie_com_nans] = adicionaNaN(residuo{i},nans);%Adiciona os nans extra�dos por removeNaN
    serie(i,:)=[residuoNaN serie_com_nans];%Adiciona os nans que surgiram pela diferenciacao sazonal
    end
    clear residuoNaN;%apaga a vari�vel para evitar incompatibilidade no loop
end
saida=serie;
model=ps;%Modelo pp sazonalidades

end

