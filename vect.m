function M = vect(D)

M = [];
r = length(D);
for k = 1 : r
    X = D{k};
    M = [M, X(:)];
end

end