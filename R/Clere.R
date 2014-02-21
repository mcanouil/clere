######################################################################
############################ Class Clere #############################
############################## Creation ##############################
######################################################################

### Class definition ###
setClass(
    Class = "Clere", 
    representation = representation(
        y = "numeric", 
        x = "matrix", 
        n = "integer", 
        p = "integer", 
        g = "numeric", 
        nItMC = "numeric", 
        nItEM = "numeric", 
        nBurn = "numeric", 
        dp = "numeric", 
        nsamp = "numeric", 
        sparse = "logical",  
        analysis = "character",  
        algorithm = "character", 
        initialized = "logical", 
        maxit = "numeric", 
        tol = "numeric", 
        seed = "integer", 
        b = "numeric", 
        pi = "numeric", 
        sigma2 = "numeric", 
        gamma2 = "numeric", 
        intercept = "numeric", 
        likelihood = "numeric", 
        entropy = "numeric", 
        P = "matrix", 
        theta = "matrix", 
        Zw = "matrix", 
        Bw = "matrix", 
        Z0 = "numeric", 
        message = "character"
    ), 
    prototype = prototype(
        y = numeric(), 
        x = matrix(, nrow = 0, ncol = 0), 
        n = integer(), 
        p = integer(), 
        g = numeric(), 
        nItMC = numeric(), 
        nItEM = numeric(), 
        nBurn = numeric(), 
        dp = numeric(), 
        nsamp = numeric(), 
        sparse = logical(),  
        analysis = character(),  
        algorithm = character(), 
        initialized = logical(), 
        maxit = numeric(), 
        tol = numeric(), 
        seed = integer(), 
        b = numeric(), 
        pi = numeric(), 
        sigma2 = numeric(), 
        gamma2 = numeric(), 
        intercept = numeric(), 
        likelihood = numeric(), 
        entropy = numeric(), 
        P = matrix(, nrow = 0, ncol = 0), 
        theta = matrix(, nrow = 0, ncol = 0), 
        Zw = matrix(, nrow = 0, ncol = 0), 
        Bw = matrix(, nrow = 0, ncol = 0), 
        Z0 = numeric(), 
        message = character()
    )
)


### Constructor ###


### Is ###
setGeneric(name = "is.clere", def = function(object) {standardGeneric("is.clere")})
setMethod(f = "is.clere", signature = "ANY", definition = function(object) {
    if (length(object)>1) {
        return(sapply(object, is.clere))
    } else {
        if (class(object) == "Clere") {
            return(TRUE)
        } else {
            return(FALSE)
        }
    }
})


### Show ###
setMethod(f = "show", signature = "Clere", definition = function(object) {
  showSlot <- function(slot) {
    sNames <- gsub("^[^@]*@(.*)", "\\1", slot)
    eSlot <- eval(parse(text = slot))
    tmp <- switch(EXPR = class(eSlot),
                  "matrix" = {
                    cat(paste0(" ~ ", sNames, " : [", nrow(eSlot), "x", ncol(eSlot), "]", collapse = ""))
                    if (all(dim(eSlot)==0)) {
                      cat("NA")
                    } else {
                      cat("\n")
                      nrowShow <- seq(min(5, nrow(eSlot)))
                      ncolShow <- seq(min(5, ncol(eSlot)))
                      shortObject <- eSlot[nrowShow, ncolShow]
                      if (is.null(rownames(shortObject))) {
                        rownames(shortObject) <- seq(nrow(shortObject))
                      }
                      if (is.null(colnames(shortObject))) {
                        colnames(shortObject) <- seq(ncol(shortObject))
                      }
                      resFormat <- format(cbind(c("", rownames(shortObject)), rbind(colnames(shortObject), format(shortObject, digits = 4))), justify = "centre")
                      if (nrow(shortObject)!=nrow(eSlot)) {
                        resFormat <- rbind(resFormat, c(".", sapply(seq(colnames(shortObject)), function(iCol) {paste0(rep(".", nchar(resFormat[1, 1])), collapse = "")})))
                      }
                      if (ncol(shortObject)!=ncol(eSlot)) {
                        resFormat <- cbind(resFormat, c(".", rep(paste0(rep(".", nchar(resFormat[1, 1])), collapse = ""), nrow(resFormat)-1)))
                      }
                      cat(paste0("     ", apply(format(resFormat, justify = "centre"), 1, paste, collapse = " "), "\n", collapse = ""))
                    }
                    cat("\n")
                  },
                  "data.frame" = {
                    cat(paste0(" ~ ", sNames, " : [", nrow(eSlot), "x", ncol(eSlot), "]", collapse = ""))
                    if (all(dim(eSlot)==0)) {
                      cat("NA")
                    } else {
                      cat("\n")
                      nrowShow <- seq(min(5, nrow(eSlot)))
                      ncolShow <- seq(min(5, ncol(eSlot)))
                      shortObject <- eSlot[nrowShow, ncolShow]
                      if (is.null(rownames(shortObject))) {
                        rownames(shortObject) <- seq(nrow(shortObject))
                      } else {}
                      if (is.null(colnames(shortObject))) {
                        colnames(shortObject) <- seq(ncol(shortObject))
                      } else {}
                      resFormat <- format(cbind(c("", rownames(shortObject)), rbind(colnames(shortObject), format(shortObject, digits = 4))), justify = "centre")
                      if (nrow(shortObject)!=nrow(eSlot)) {
                        resFormat <- rbind(resFormat, c(".", sapply(seq(colnames(shortObject)), function(iCol) {paste0(rep(".", nchar(resFormat[1, 1])), collapse = "")})))
                      } else {}
                      if (ncol(shortObject)!=ncol(eSlot)) {
                        resFormat <- cbind(resFormat, c(".", rep(paste0(rep(".", nchar(resFormat[1, 1])), collapse = ""), nrow(resFormat)-1)))
                      } else {}
                      cat(paste0("     ", apply(format(resFormat, justify = "centre"), 1, paste, collapse = " "), "\n", collapse = ""))
                    }
                    cat("\n")
                  },
                  "numeric" = {
                    cat(paste0(" ~ ", sNames, " : ", collapse = ""))
                    if (length(eSlot) == 0) {
                      cat("NA")
                    } else {
                      if (length(eSlot)>1) {
                        cat(paste0("[", length(eSlot), "] ", paste0(format(head(eSlot), digits = 4), collapse = " ")))
                      } else {
                        cat(format(eSlot, digits = 4))
                      }
                    }
                    cat("\n")
                  },
                  "character" = {
                    cat(paste0(" ~ ", sNames, " : ", collapse = ""))
                    if (length(eSlot) == 0) {
                      cat("NA")
                    } else {
                      if (length(eSlot)>1) {
                        cat("[", length(eSlot), "] \"", paste0(head(eSlot), collapse = "\" \""), "\"", sep = "")
                      } else {
                        cat(paste0("\"", eSlot, "\""))
                      }
                    }
                    cat("\n")
                  },
                  {
                    cat(paste0(" ~ ", sNames, " : ", collapse = ""))
                    if (length(eSlot) == 0) {
                      cat("NA")
                    } else {
                      if (length(eSlot)>1) {
                        cat(paste0("[", length(eSlot), "] ", paste0(head(eSlot), collapse = " ")))
                      } else {
                        cat(eSlot)
                      }
                    }
                    cat("\n")
                  }
                  )
    return(invisible())
  }
  showObject <- function(object) {
    cat("	~~~ Class:", class(object), "~~~\n")
    sNames <- paste0("object@", slotNames(object))
    trash <- sapply(sNames, showSlot)
    return(invisible())
  }
  showObject(object)
  return(invisible(object))
})


### Getteur ###
setMethod(f = "[", signature = "Clere", definition = function(x, i, j, drop) {
    switch(EXPR = i, 
        "y" = {
            if (missing(j)) {
                return(x@y)
            } else {
                if (j>length(x@y)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@y[j])
                }
            }
        }, 
        "x" = {return(x@x)}, 
        "n" = {
            if (missing(j)) {
                return(x@n)
            } else {
                if (j>length(x@n)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@n[j])
                }
            }
        }, 
        "p" = {
            if (missing(j)) {
                return(x@p)
            } else {
                if (j>length(x@p)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@p[j])
                }
            }
        }, 
        "g" = {
            if (missing(j)) {
                return(x@g)
            } else {
                if (j>length(x@g)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@g[j])
                }
            }
        }, 
        "nItMC" = {
            if (missing(j)) {
                return(x@nItMC)
            } else {
                if (j>length(x@nItMC)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@nItMC[j])
                }
            }
        }, 
        "nItEM" = {
            if (missing(j)) {
                return(x@nItEM)
            } else {
                if (j>length(x@nItEM)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@nItEM[j])
                }
            }
        }, 
        "nBurn" = {
            if (missing(j)) {
                return(x@nBurn)
            } else {
                if (j>length(x@nBurn)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@nBurn[j])
                }
            }
        }, 
        "dp" = {
            if (missing(j)) {
                return(x@dp)
            } else {
                if (j>length(x@dp)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@dp[j])
                }
            }
        }, 
        "nsamp" = {
            if (missing(j)) {
                return(x@nsamp)
            } else {
                if (j>length(x@nsamp)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@nsamp[j])
                }
            }
        }, 
        "sparse" = {
            if (missing(j)) {
                return(x@sparse)
            } else {
                if (j>length(x@sparse)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@sparse[j])
                }
            }
        }, 
        "analysis" = {
            if (missing(j)) {
                return(x@analysis)
            } else {
                if (j>length(x@analysis)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@analysis[j])
                }
            }
        }, 
        "algorithm" = {
            if (missing(j)) {
                return(x@algorithm)
            } else {
                if (j>length(x@algorithm)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@algorithm[j])
                }
            }
        }, 
        "initialized" = {
            if (missing(j)) {
                return(x@initialized)
            } else {
                if (j>length(x@initialized)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@initialized[j])
                }
            }
        }, 
        "maxit" = {
            if (missing(j)) {
                return(x@maxit)
            } else {
                if (j>length(x@maxit)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@maxit[j])
                }
            }
        }, 
        "tol" = {
            if (missing(j)) {
                return(x@tol)
            } else {
                if (j>length(x@tol)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@tol[j])
                }
            }
        }, 
        "seed" = {
            if (missing(j)) {
                return(x@seed)
            } else {
                if (j>length(x@seed)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@seed[j])
                }
            }
        }, 
        "b" = {
            if (missing(j)) {
                return(x@b)
            } else {
                if (j>length(x@b)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@b[j])
                }
            }
        }, 
        "pi" = {
            if (missing(j)) {
                return(x@pi)
            } else {
                if (j>length(x@pi)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@pi[j])
                }
            }
        }, 
        "sigma2" = {
            if (missing(j)) {
                return(x@sigma2)
            } else {
                if (j>length(x@sigma2)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@sigma2[j])
                }
            }
        }, 
        "gamma2" = {
            if (missing(j)) {
                return(x@gamma2)
            } else {
                if (j>length(x@gamma2)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@gamma2[j])
                }
            }
        }, 
        "intercept" = {
            if (missing(j)) {
                return(x@intercept)
            } else {
                if (j>length(x@intercept)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@intercept[j])
                }
            }
        }, 
        "likelihood" = {
            if (missing(j)) {
                return(x@likelihood)
            } else {
                if (j>length(x@likelihood)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@likelihood[j])
                }
            }
        }, 
        "entropy" = {
            if (missing(j)) {
                return(x@entropy)
            } else {
                if (j>length(x@entropy)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@entropy[j])
                }
            }
        }, 
        "P" = {return(x@P)}, 
        "theta" = {return(x@theta)}, 
        "Zw" = {return(x@Zw)}, 
        "Bw" = {return(x@Bw)}, 
        "Z0" = {
            if (missing(j)) {
                return(x@Z0)
            } else {
                if (j>length(x@Z0)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@Z0[j])
                }
            }
        }, 
        "message" = {
            if (missing(j)) {
                return(x@message)
            } else {
                if (j>length(x@message)) {
                    stop("[Clere:get] indice out of limits", call. = FALSE)
                } else {
                    return(x@message[j])
                }
            }
        }, 
        stop("[Clere:get] ", i, " is not a \"Clere\" slot", call. = FALSE)
    )
})



### Clusters ###
setGeneric(name = "clusters", def = function(object, threshold = NULL, ...) {standardGeneric("clusters")})
setMethod(f = "clusters", signature = "Clere", definition = function(object, threshold = NULL, ...) {
    if(is.null(threshold)) {
      return(apply(object@P, 1, which.max))
    }else{
      return(apply(object@P >= threshold, 1, function(x) ifelse(sum(x)>0,which.max(x),NA)))
    }
})


### Predict ###
setMethod(f = "predict", signature = "Clere", definition = function(object, newx, ...) {
    if (class(newx) == "matrix") {
        if (ncol(newx) == object@p) {
          return(object@intercept + rowMeans(newx%*%object@Bw,na.rm=TRUE) )
        } else {
            stop(paste0("[Clere:predict] \"newx\" must be a matrix with ", object@p, " columns"), call. = FALSE)
        }
    } else {
        stop("[Clere:predict] \"newx\" is not a matrix", call. = FALSE)
    }
})


### Summary ###
setMethod(f = "summary", signature = "Clere", definition = function(object, ...) {
    if (missing(object)) {
        stop("[Clere:summary] \"object\" is missing", call. = FALSE)
    } else {}
    nbVarGroups = length(object@b)
    K = 2*(nbVarGroups+1)
    nd = 4
    sep = "\t"
    summaryClere <- new("sClere", 
        analysis = object@analysis, 
        g = object@g,
        nbVarGroups = length(object@b), 
        algorithm = object@algorithm, 
        intercept = object@intercept, 
        b = object@b, 
        pi = object@pi, 
        sigma2 = object@sigma2, 
        gamma2 = object@gamma2, 
        likelihood = object@likelihood, 
        entropy = object@entropy, 
        AIC = -2*object@likelihood + 2*K, 
        BIC = -2*object@likelihood + K*log(object@n), 
        ICL = -2*object@likelihood + K*log(object@n)+object@entropy
    )
    return(summaryClere)
})


### Plot ###
# setGeneric(name = "plot", def = function(x, ...) {standardGeneric("plot")})
setMethod(f = "plot", signature = "Clere", definition = function(x, ...) {
    if (nrow(x@theta) >= 2) {
        snbRow <- seq(nrow(x@theta))
        K <- length(x@b)
        sK <- seq(K)
        op <- par(mfrow = c(2, 2))
        xlabname = paste(x@algorithm, "iterations")
        
        ### First plot
        matplot(snbRow, x@theta[, 1+(sK)], type = "l", ylab = "The b's", lty = 1, xlab = xlabname)
        abline(v = x@nBurn, col = "grey")
        
        ### Second plot
        matplot(snbRow, x@theta[, 1+K+(sK)], type = "l", ylab = "The pi's", lty = 1, xlab = xlabname)
        abline(v = x@nBurn, col = "grey")
        
        ### Third plot
        matplot(snbRow, x@theta[, c(2*K+2, 2*K+3)], type = "l", ylab = "sigma^2 and gamma^2", lty = 1, xlab = xlabname, 
            ylim = c(0.5*min(x@theta[, c(2*K+2,2*K+3)], na.rm = TRUE), 1.5*max(x@theta[, c(2*K+2,2*K+3)], na.rm = TRUE)))
        legend("topright", legend = c("sigma2", "gamma2"), box.lty = 0, lty = 1, col = 1:2)
        abline(v = x@nBurn, col = "grey")
        
        ### Fourth plot
        plot(snbRow, x@theta[, 1], type = "l", ylab = "Intercept", lty = 1, xlab = xlabname)
        abline(v = x@nBurn, col = "grey")
        
        par(op)
    } else {
        stop("[Clere:plot] SEM iterations is below 2", call. = FALSE)
    }
})


### GGPlot ###
setGeneric(name = "ggPlot", def = function(data, ...) {standardGeneric("ggPlot")})
setMethod(f = "ggPlot", signature = "Clere", definition = function(data, ...) {
    is.installed <- function(mypkg) {
        is.element(mypkg, installed.packages()[,1])
    }
    if (all(is.installed(c("ggplot2", "grid")))) {
        require(ggplot2)
        require(grid)
    } else {
        stop("[Clere:ggPlot] \"ggPlot2\" and \"grid\" packages must be installed", call. = FALSE)
    }
    
    multiplot <- function (plotlist = NULL, cols = 1, rows = 1, layout = NULL) {
        plots <- plotlist
        numPlots = length(plots)
        if (is.null(layout)) {
            layout <- matrix(seq(1, cols * ceiling(numPlots/cols)), ncol = cols, nrow = rows, byrow = TRUE)
        } else {}
        if (numPlots == 1) {
            print(plots[[1]])
        } else {
            grid.newpage()
            pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
            for (i in seq(numPlots)) {
                matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
                print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row, layout.pos.col = matchidx$col))
            }
        }
    }
    ggplotColours <- function(n = 6, h = c(0, 360) + 15) {
            if ((diff(h)%%360) < 1) {
                h[2] <- h[2] - 360/n
            } else {}
            hcl(h = (seq(h[1], h[2], length = n)), c = 100, l = 65)
        }

    nbrow <- nrow(data@theta)
    if (nbrow >= 2) {
        K <- length(data@b)
        sK <- seq(K)
        xlabname <- paste(data@algorithm, "iterations")
        seqnrow <- seq(nbrow)
        cnames <- colnames(data@theta)
        
        ### First plot
        dataTmp <- cbind(rep(seqnrow, length(1+(sK))), rep(cnames[1+(sK)], each = nbrow), as.data.frame(matrix(data@theta[, 1+(sK)], ncol = 1)))
        colnames(dataTmp) <- c("x", "b", "values")
        p1 <- eval(parse(text = paste0("ggplot(data = dataTmp, aes(x = x, y = values, colour = b)) + geom_line() + geom_vline(xintercept = data@nBurn, colour = \"grey\")")))
        p1 <- p1 + labs(x = xlabname, y = "The b's") # labs' name, "title" can be added
        p1 <- p1 + theme(legend.position = "none") # remove legend
        p1 <- p1 + scale_colour_manual(values = ggplotColours(length(1+(sK)))) # color palette
        
        ### Second plot
        dataTmp <- cbind(rep(seqnrow, length(1+K+(sK))), rep(cnames[1+K+(sK)], each = nbrow), as.data.frame(matrix(data@theta[, 1+K+(sK)], ncol = 1)))
        colnames(dataTmp) <- c("x", "pi", "values")
        p2 <- eval(parse(text = paste0("ggplot(data = dataTmp, aes(x = x, y = values, colour = pi)) + geom_line() + geom_vline(xintercept = data@nBurn, colour = \"grey\")")))
        p2 <- p2 + labs(x = xlabname, y = "The pi's") # labs' name, "title" can be added
        p2 <- p2 + theme(legend.position = "none") # remove legend
        p2 <- p2 + scale_colour_manual(values = ggplotColours(length(1+K+(sK)))) # color palette
        
        ### Third plot
        dataTmp <- cbind(rep(seqnrow, length(c(2*K+2,2*K+3))), rep(cnames[c(2*K+2,2*K+3)], each = nbrow), as.data.frame(matrix(data@theta[, c(2*K+2,2*K+3)], ncol = 1)))
        colnames(dataTmp) <- c("x", "sg", "values")
        p3 <- eval(parse(text = paste0("ggplot(data = dataTmp, aes(x = x, y = values, colour = sg)) + geom_line() + geom_vline(xintercept = data@nBurn, colour = \"grey\")")))
        p3 <- p3 + labs(x = xlabname, y = "sigma^2 and gamma^2") # labs' name, "title" can be added
        p3 <- p3 + scale_colour_manual(values = ggplotColours(length(c(2*K+2,2*K+3)))) # color palette        
        p3 <- p3 + ylim(c(0.5*min(data@theta[, c(2*K+2,2*K+3)], na.rm = TRUE), 1.5*max(data@theta[, c(2*K+2,2*K+3)], na.rm = TRUE))) # ylim
        # tmpSigGam <- range(dataTmp[, "values"])
        # tmpSigma2 <- range(dataTmp[dataTmp$sg == "sigma2", "values"][(nbrow*2/3):nbrow])
        # if ((abs(tmpSigma2[2]-tmpSigGam[2])/tmpSigGam[2]) >= 0.70) {
            p3 <- p3 + theme(legend.title = element_blank(), legend.justification = c(1, 1), legend.position = c(1, 1)) # legend aspect and position
        # } else {
            # p3 <- p3 + theme(legend.title = element_blank(), legend.justification = c(1, 1), legend.position = c(1, tmpSigma2[1]/tmpSigGam[2])) # legend aspect and position
        # }

        ### Fourth plot
        dataTmp <- cbind(seqnrow, as.data.frame(data@theta[, 1]))
        colnames(dataTmp) <- c("x", "intercept")
        p4 <- eval(parse(text = paste0("ggplot(data = dataTmp, aes(x = x, y = intercept)) + geom_line(colour = ggplotColours(1)) + geom_vline(xintercept = data@nBurn, colour = \"grey\")")))
        p4 <- p4 + labs(x = xlabname, y = "Intercept")
        
        allPlots <- list(p1, p2, p3, p4)
        multiplot(plotlist = allPlots, cols = 2, rows = 2) # All plots in the same device
        invisible(allPlots)
    } else {
        stop("[Clere:plot] SEM iterations is below 2", call. = FALSE)
    }
})
