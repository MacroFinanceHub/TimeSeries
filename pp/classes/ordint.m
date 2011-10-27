function numdif = ordint(serie)
% Fun��o que detecta o n�mero de ra�zes unit�rias (ordem de integra��o)
% de uma s�rie, e portanto o n�mero de diferen�as a serem tomadas

% Para os testes eu uso a f� "unitroot.m", que chama outras

tem_raiz=1; % come�o supondo que h� ao menos uma raiz unit�ria
DWbound=0.05; 
serie_teste=serie;
numdif=0;

while tem_raiz==1,
    
    [ADF, ADFRESID, DF, DFRESID] = unitroot (serie_teste);

% Segundo o explicado dentro de unitroot, vou adotar os criterios pra
% detectar raiz unit�ria:

% So, reject a unit root,
%   - if t_1 in the ADF regression is statistically significant, e.g. tsig_1 <= 0.1 (REGRA 1),
%     AND the residuals are not correlated (otherwise the test statistic is inefficient) (REGRA 2),
%   - or if tpp (in any regression) is statistically significant (- or both) (REGRA 3).

% Verificando: (REGRA 1 AND REGRA 2) OR REGRA 3

if (ADF(3,4)<=0.1) & (abs(ADF(1,2)-2)<DWbound)
    tem_raiz=0;
elseif ADF(3,1)<=0.1
    tem_raiz=0;
else
    numdif=numdif+1;
    serie_teste=diff(serie_teste);
end

end % END do WHILE