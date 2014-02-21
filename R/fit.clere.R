fit.clere  <- function(y = rnorm(10), 
                       x = matrix(rnorm(50), nrow = 10), 
                       g = 1, 
                       nItMC = 50, 
                       nItEM = 1000, 
                       nBurn = 200, 
                       dp = 5, 
                       nsamp = 200, 
                       maxit = 500, 
                       tol   = 1e-3,
                       nstart =  2, 
                       parallel =  FALSE,
                       seed  = NULL, 
                       plotit = FALSE, 
                       sparse = FALSE,  
                       analysis = "fit",  
                       algorithm = "SEM",
                       theta0 = NULL, 
                       Z0 = NULL) {
  toyfit_fun <- function(){
    if (is.null(seed)) {
        iseed = sample(1:1000, 1)
    }
    
    clereObj <- new("Clere", y = y, x = x, g = g, nItMC = nItMC, nItEM = nItEM, nBurn = nBurn, 
                    dp = dp, nsamp = nsamp, sparse = sparse,analysis = analysis, 
                    algorithm = algorithm, initialized = FALSE, maxit = maxit, tol = tol, seed = iseed)
    ## Dimensions
    clereObj@n <- nrow(clereObj@x)
    clereObj@p <- ncol(clereObj@x)
    
    if (analysis == "fit") {
      if (!is.null(theta0)) {
        K = length(theta0)
        if (K == 2*g + 3) {
          clereObj@intercept = theta0[1];
          clereObj@b         = theta0[2:(g+1)];
          clereObj@pi        = theta0[(g+2):(2*g+1)];
          clereObj@sigma2    = theta0[2*g+2]
          clereObj@gamma2    = theta0[2*g+3]
          if (abs(sum(clereObj@pi)-1) >= 1e-10) {
            stop("[Clere:fit.clere] Invalid proportions for initial vector of parameters.\n\tPlease check your initial guess of parameters",
                 call. = FALSE)
          }
          if (clereObj@sigma2 <= 0 | clereObj@gamma2 <= 0) {
            stop("[Clere:fit.clere] Non negative variances are not allowed!\n\tPlease check your initial guess of parameters",
                 call. = FALSE)
          }
        } else {
          stop("[Clere:fit.clere] The required number of groups is not consistent with your initial guess of parameters.\n\tPlease check your initial guess of parameters",
               call. = FALSE)
        }
        
        ## Check the initial partition
        if (is.null(Z0)) {
          stop("[Clere:fit.clere] An initial partition should also be given with the initial set of parameters", call. = FALSE)
        } else {
          if (length(Z0) != clereObj@p) {
            stop(paste0("[Clere:fit.clere] The length of the initial partition should be ", clereObj@p), call. = FALSE)
          } else {}
          tz = table(Z0);
          nz = as.numeric(names(tz))
          if (min(nz)>0 | max(nz)>=g) {
            stop(paste0("[Clere:fit.clere] The partition only assigns numbers between 0 and ", g-1, ", not between ", min(nz), " and ", max(nz), " as specifed by the user"),
                 call. = FALSE)
          }
        }
        clereObj@Z0 = Z0
        clereObj@initialized = TRUE; 
      }
    }
    .Call("clere", clereObj, PACKAGE = "clere")

    ## Last refinement
    ## Clean the output
    clereObj@Bw[!is.finite(clereObj@Bw)] <- NA
    clereObj@Zw[!is.finite(clereObj@Zw)] <- NA
    
    clereObj@g <- length(clereObj@b)
    ## Rename matrix P
    colnames(clereObj@P) <- paste("Group",1:clereObj@g)
    rownames(clereObj@P) <- colnames(x)
    
    ## Rename output columns
    K <- 1:length(clereObj@b)
    colnames(clereObj@theta) = c("intercept", paste0("b", K), paste0("pi", K), "sigma2", "gamma2", "CLL")
    if (plotit) {
      plot(clereObj)
    }
    return(clereObj)
  }
  ## replication now
  if(parallel){
    Models <- mclapply(1:nstart,function(startingPoint){ mod <- toyfit_fun() },mc.cores=nstart)
  }else{
    Models <- sapply(1:nstart,function(startingPoint){ mod <- toyfit_fun() })
  }
  
  if(analysis=="fit"){
    model <- Models[[which.max(sapply(Models,function(m) summary(m)@likelihood))]]
    return(model)
  }
  if(analysis=="aic"){
    model <- Models[[which.min(sapply(Models,function(m) summary(m)@AIC))]]
    return(model)
  }
  if(analysis=="bic"){
    model <- Models[[which.min(sapply(Models,function(m) summary(m)@BIC))]]
    return(model)
  }
  if(analysis=="icl"){
    model <- Models[[which.min(sapply(Models,function(m) summary(m)@ICL))]]
    return(model)
  }
}


