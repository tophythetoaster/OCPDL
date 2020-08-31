function Y = rep(facts, X)

c = code(facts, X);
Y = ktensor(c, facts);

end