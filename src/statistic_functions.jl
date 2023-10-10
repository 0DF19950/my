function res_sum(a)
    return +(a...)
end    
res_sum(1:36) == 666

function res_mean(a)
    return res_sum(a)/length(a)    
end
res_mean(-15:17) == 1

function rse_std(a)
    return sqrt(res_sum((a.-res_mean(a)).^2)/(length(a)-1))
end
rse_std(1:3) == 1

function rse_tstat(a;σ=rse_std(a))
    return (res_mean(a))/(σ/sqrt(length(a)))
end
rse_tstat(2:3) == 5

using ProgressMeter

# @showprogress for 



struct StatResults
    x::Vector
    n::Int32
    std::Float64
    tvalue::Float64
end
Base.length(s::StatResults) = s.n
StatResults(x) = StatResults(x,length(x))

StatResults(x,n) =  StatResults(x,n,rse_std(x))
StatResults(x,n,std) = StatResults(x,n,std,rse_tstat(x;σ=std))


StatResults([10,500.]) # <1>

function tstat(x)
    return StatResult(length(x),rse_tstat(x))
end