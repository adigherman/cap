pkgname <- "cap"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "cap-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('cap')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("capReg")
### * capReg

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: capReg
### Title: Covariate Assisted Principal Regression for Covariance Matrix
###   Outcomes
### Aliases: capReg
### Keywords: models

### ** Examples


#############################################
data(env.example)
X<-get("X",env.example)
Y<-get("Y",env.example)

# method = "CAP"
# without orthogonal constraint
re1<-capReg(Y,X,nD=2,method=c("CAP"),CAP.OC=FALSE)
# with orthogonal constraint
re2<-capReg(Y,X,nD=2,method=c("CAP"),CAP.OC=TRUE)

# method = "CAP-C"
re3<-capReg(Y,X,nD=2,method=c("CAP-C"))
#############################################



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("capReg", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("cap_beta")
### * cap_beta

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: cap_beta
### Title: Inference of model coefficients
### Aliases: cap_beta
### Keywords: models

### ** Examples


#############################################
data(env.example)
X<-get("X",env.example)
Y<-get("Y",env.example)
Phi<-get("Phi",env.example)

# asymptotic variance
re1<-cap_beta(Y,X,gamma=Phi[,2],method=c("asmp"),boot=FALSE)

# likelihood ratio test
re2<-cap_beta(Y,X,gamma=Phi[,2],method=c("LLR"),boot=FALSE)

# bootstrap confidence interval
## No test: 
re3<-cap_beta(Y,X,gamma=Phi[,2],boot=TRUE,sims=500,verbose=FALSE)
## End(No test)
#############################################



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("cap_beta", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("env.example")
### * env.example

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: env.example
### Title: Simulated data
### Aliases: env.example
### Keywords: datasets

### ** Examples

data(env.example)
X<-get("X",env.example)
Y<-get("Y",env.example)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("env.example", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
