% Vectorize

T = [1 2 3; 4 5 6; 1 2 3; 4 5 6]

AT = [1 2 3; 4 5 6; 7 8 9]

[q,p] = max(T*AT',[],2)