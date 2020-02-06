## Fix ERRORS for R-devel

Fix errors and few notes from current cran checks 
https://cran.r-project.org/web/checks/check_results_clere.html


## R CMD check results

### Local server (`devtools::check()`)

* Linux Debian 4.9.110-3+deb9u2, R-3.6.2: NOTE

```
> checking installed package size ... NOTE
    installed size is 26.4Mb
    sub-directories of 1Mb or more:
      libs  25.3Mb
> checking sizes of PDF files under 'inst/doc' ... NOTE
    Unable to find GhostScript executable to run checks on size reduction
```

### win-builder (`devtools::check_win_devel()`)

* R-devel: OK

### R-hub builder (`rhub::check_for_cran()`)

* Fedora Linux, R-devel, clang, gfortran: WARNING

```
> checking re-building of vignette outputs ... WARNING
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘clere.Rnw’ using Sweave
    Error: processing vignette 'clere.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'clere.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `microtype.sty' not found.
```

* Ubuntu Linux 16.04 LTS, R-release, GCC: NOTE

```
> checking installed package size ... NOTE
      installed size is 24.7Mb
      sub-directories of 1Mb or more:
        libs  23.8Mb
> checking examples ... NOTE
    Examples with CPU or elapsed time > 5s
                   user system elapsed
    clere-package 1.932      0   5.502
```

* Windows Server 2008 R2 SP1, R-devel, 32/64 bit: NOTE

```
> checking sizes of PDF files under 'inst/doc' ... NOTE
> checking for non-standard things in the check directory ... NOTE
    Found the following files/directories:
      'clere-Ex_i386.Rout' 'clere-Ex_x64.Rout' 'examples_i386' 'examples_x64'
```

* Debian Linux, R-devel, GCC ASAN/UBSAN: PREPERROR


### R-hub builder (`rhub::check_on_macos()`)

* macOS 10.11 El Capitan, R-release: OK


### travis-ci

* Ubuntu 16.04.6 LTS, R-devel: NOTE

```
> checking installed package size ... NOTE
    installed size is 25.0Mb
    sub-directories of 1Mb or more:
      libs  23.8Mb
```

* Ubuntu 16.04.6 LTS, R-release: NOTE

```
> checking installed package size ... NOTE
    installed size is 25.0Mb
    sub-directories of 1Mb or more:
      libs  23.8Mb
```

* Ubuntu 16.04.6 LTS, R-3.5: NOTE

```
> checking installed package size ... NOTE
    installed size is 25.0Mb
    sub-directories of 1Mb or more:
      libs  23.8Mb
```

* Ubuntu 16.04.6 LTS, R-3.6: NOTE

```
> checking installed package size ... NOTE
    installed size is 25.0Mb
    sub-directories of 1Mb or more:
      libs  23.8Mb
```
