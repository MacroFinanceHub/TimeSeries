function [serie_rec ] = integracaoinv(residuo,x0)
%Recomp�e a s�rie diferenciada (integrada) de ordem 1
%y: res�duo da s�rie diferenciada
%x0:amostra inicial
serie_rec=[x0 cumsum(residuo)+x0];


