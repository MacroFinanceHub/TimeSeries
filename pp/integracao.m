function [ serie_integrada,x0 ] = integracao(x,nru)
%Integra a s�rie nru vezes
serie_integrada=x;
x0=[];
if nru>0
serie_integrada=diff(serie_integrada,nru);%pre-processa
x0=x(1:nru);
end

