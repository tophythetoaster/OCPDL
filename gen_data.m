function data = gen_data(facts, T)

U1 = facts{1};
r = length(U1(1, :));
data = cell(1, T);
for t = 1 : T
    c = rand(r, 1);
    X = ktensor(c, facts);
    X = tensor(X);
    data{t} = X;
end

end