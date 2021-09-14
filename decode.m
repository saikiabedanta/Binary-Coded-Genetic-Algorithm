function [DV] = decode(r)

DV=0;
for i=1:5
    DV=DV+(r(i)*(2^(5-i)));
end

end

