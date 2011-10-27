function [y,x0] = difsaz(x,n)
%Fun��o que extrai a sazonalidade de periodo n
%x: s�rie 
%n: per�odo da sazonalidade

for k=n+1:length(x),
    y(k-n)=x(k)-x(k-n);
end
x0=x(1:n);%amostras iniciais para recuperar a s�rie sem sazonalidade