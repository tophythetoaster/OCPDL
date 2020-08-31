function err = recerr(facts, data)

err = 0;
T = length(data);
for t = 1 : T
    X = data{t};
    Y = rep(facts, X);
    err = err + (norm(X - Y)^2) / (norm(X)^2);
end
err = err / T;

end