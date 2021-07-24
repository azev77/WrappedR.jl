"""
    fitsprintr(X, y)

Input: data X, outcome y
Return m, model fit by Sprint.r 
typeof(m): OrderedCollections.OrderedDict{Symbol, Any}
"""
function fitsprintr(X, y; 
    #nfold = 5, square = FALSE, nlam = 100, lam_min_ratio = 0.01
    )
    @rput y X # put data from Julia to R.
    R"""
    library(sprintr);
    m <- cv.sprinter(x = X, y = y, 
        nfold = 5, square = FALSE, nlam = 100, lam_min_ratio = 0.01)
    """
    @rget m
    delete!(m, :call)
    delete!(m[:fit], :call)
    m
end   

"""
    predictsprintr(m, XH)

Input: fit object m, new data XH 
Return pr, vector of predictions
"""
function predictsprintr(m, XH)
    @rput m XH # put data from Julia to R.
    R"""
    library(sprintr);
    class(m) <- 'cv.sprinter'
    pred <- predict(m, newdata = XH)
    """
    return @rget pred
end
