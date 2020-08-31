function facts = ocpdl(data, r)

%preliminary stuff
T = length(data);
X1 = data{1};
sizes = size(X1);
mm = prod(sizes);
n = length(sizes);
A = zeros(r);
B = zeros(mm, r);
facts = init_facts(sizes, r);

%main loop
for t = 1 : T
    disp(t);
    
    %coding step
    X = data{t};
    c = code(facts, X);
    
    %aggregation step
    A = ((t - 1) * A + c * c') / t;
    B = ((t - 1) * B + X(:) * c') / t;
    
    %dictionary update step 
    for j = 1 : n
        U = facts{j};
        Aj = get_Aj(A, j, facts);
        Bj = get_Bj(B, j, facts, sizes);
        U = quadopt(Aj, Bj, U);
        facts{j} = U;
    end
    
end

end


function Aj = get_Aj(A, j, facts)

Aj = A;
n = length(facts);
for l = 1 : n
    if l ~= j
        U = facts{l};
        Aj = Aj .* (U' * U);
    end
end

end


function Bj = get_Bj(B, j, facts, sizes)

r = length(B(1, :));
m = sizes(j);
n = length(sizes);
Bj = zeros(m, r);

for k = 1 : r
    
    us = {};
    for l = 1 : n
        if l ~= j
            U = facts{l};
            u = U(:, k);
            us{end + 1} = u;
        end
    end
    
    b = B(:, k);
    b = reshape(b, sizes);
    b = tensor(b);
    b = ttv(b, us, -j);             
    Bj(:, k) = b;
    
end
    
end






