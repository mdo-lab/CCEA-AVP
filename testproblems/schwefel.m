function [f,g,x] = schwefel(x)

s=sum(x.*sin(sqrt(abs(x))));
f=418.9829*length(x)-s;
g = [];

 return
