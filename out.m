function D = out(facts)

U1 = facts{1};
n = length(facts);
[m1, r] = size(U1);
D = cell(1, r);
for k = 1 : r
    us = cell(1, n);
    for j = 1 : n
        U = facts{j};
        us{j} = U(:, k);
    end
    A = ktensor(us);
    A = tensor(A);
    D{k} = A;
end


end