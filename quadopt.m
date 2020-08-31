function U = quadopt(A, B, U0)
   
U = U0;
numits = 10;
for it = 1 : numits
    U = U .* (B ./ (U * A));
end

end




