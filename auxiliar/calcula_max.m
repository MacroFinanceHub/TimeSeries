function [m] = calcula_max(modelo)
%Calcula o tamanho da janela inicial para ajustar as s�ries

n=size(modelo{6}{1}{2},2);
for i=1:n
maior(i)=nanmax(nanmax(modelo{6}{i}{2}));
if sum(maior)==0%Se nenhum lag foi significativo, ent�o utiliza-se a amostra anterior (ou a m�dia das anteriores) para fazer a estimativa. Assim, deve-se acresentar maior deve ser igual a 1
    maior=1;
end
end
%ATEN��O: Gambiarra
gambiarra=0;%Aten��o: esta gambiarra � para ser feita quando se inverte a ordem do pr�-processamento ou h� um erro na estimacao do valor maximo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
m=max([max(modelo{3})+ max(modelo{5})])+nanmax(maior)-gambiarra;%ajuste para equilibrar as amostras retiradas.

end

