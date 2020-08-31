function c = code(facts, X)

D = out(facts);
D = vect(D);
c = lsqnonneg(D, X(:));

end