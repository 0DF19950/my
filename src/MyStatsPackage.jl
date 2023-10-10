module MyStatsPackage
using ProgressMeter
include("src/statistic_functions.jl")

export sum
export mean, tstat

end
