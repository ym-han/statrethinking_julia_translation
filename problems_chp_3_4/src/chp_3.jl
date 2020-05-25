module problems_chp_3_4


using Plots, Distributions
using ElectronDisplay

p_grid = LinRange(0,1, 1000)
ℙ_p = [1 for _ in 1:1000]

bin_grid = [Binomial(9, p) for p in p_grid]
ℙ_data = [pdf(bin, 6) for bin in bin_grid] # pdf(bin, 6) is ℙ(6;p):=n_choose_6*p^6*(1-p)^{1-6}
#histogram(ℙ_data)

posterior = ℙ_data .* ℙ_p
posterior = posterior / sum(posterior)
histogram(posterior)

end # module
