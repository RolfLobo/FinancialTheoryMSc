"""
    BondPrice(Y,cf,m;ContRateQ=false)

Calculate bond price as sum of discounted cash flows.

# Input:
- `Y`:  scalar or K vector of interest rates
- `cf`: K vector of cash flows
- `m`:  K vector of years to the cash flows
- `ContRateQ`: if true: `Y` is interpreted as a continously compounded rate
"""
function BondPrice(Y,cf,m;ContRateQ=false)              #cf is a vector of all cash flows at times m
    if length(cf) != length(m)
        error("BondPrice: cf and m must have the same lengths")
    end
    if ContRateQ
        cdisc = cf./exp.(m.*Y)
    else
        cdisc = cf./((1.0.+Y).^m)        #c/(1+y[1])^t1 + c/(1+y[2])^t2 + ...+ c/(1+y[m])^tm
    end
    P = sum(cdisc)                       #price
    return P
end

