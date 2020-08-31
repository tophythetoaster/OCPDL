function facts = init_facts(sizes, r)

n = length(sizes);
facts = cell(1, n);
for j = 1 : n
    m = sizes(j);
    U = rand(m, r);
    facts{j} = U;
end

end