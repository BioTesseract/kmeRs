![](https://img.shields.io/badge/%20bioc__check-true-green.svg) [![Build Status](https://travis-ci.com/RafalUrniaz/kmeRs.svg?branch=master)](https://travis-ci.com/RafalUrniaz/kmeRs) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html) [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/devtools)](https://cran.r-project.org/package=devtools) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/373b82ef47824c96a0e138afd8e59a02)](https://www.codacy.com/app/RafalUrniaz/kmeRs?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RafalUrniaz/kmeRs&amp;utm_campaign=Badge_Grade)

# kmeRs: K-Mers Similarity Score Matrix

The package contains tools to calculate similarity score matrix for DNA k-mers. The pairwise similarity score is calculated using PAM or BLOSUM substitution matrix. The results are evaluated by similarity score calculated by Needleman-Wunsch (global) (Needleman and Wunsch 1970) or Smith-Waterman (local) alignment. (Smith and Waterman 1981). Higher similarity score indicates more similar sequences for BLOSUM and less similar sequences for PAM matrix; 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively.

## Installation

```r
# Install from CRAN
install.packages("")

# Or the development version from GitHub:
# install.packages("devtools")
devtools::install_github("rafalurniaz/kmeRs/kmeRs/")
```
## Documentation and tutorials 
The documentation like manual or tutorials can be found in [documentation](/documentation/) folder to this repository or  directly from installed package by commands:
```r
# To show the introduction vignette
vignette("Introduction_to_kmeRs_package", package="kmeRs")

# To show the manual and functions examples
help(package = "kmeRs")
```
## Quick demo 

```r
kmeRs::kmeRs_test_package()
```

Depends: R (>= 3.4.0) <br/>
Imports: tcR, rDNAse, utils, stats, Biostrings <br/>
Encoding: UTF-8<br/> 

References
----------
###### Needleman, Saul B., and Christian D. Wunsch. 1970. “A General Method Applicable to the Search for Similarities in the Amino Acid Sequence of Two Proteins.” *Journal of Molecular Biology* 48 (3): 443–53. doi:[https://doi.org/10.1016/0022-2836(70)90057-4](https://doi.org/10.1016/0022-2836(70)90057-4).  
###### Smith, T.F., and M.S. Waterman. 1981. “Identification of Common Molecular Subsequences.” *Journal of Molecular Biology* 147 (1): 195–97. doi:[https://doi.org/10.1016/0022-2836(81)90087-5](https://doi.org/10.1016/0022-2836(81)90087-5).

