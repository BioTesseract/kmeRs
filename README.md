[![Travis (.com)](https://img.shields.io/travis/com/:RafalUrniaz/:kmeRs.svg?style=for-the-badge)](https://travis-ci.com/RafalUrniaz/kmeRs)
[![Build Status](https://travis-ci.com/RafalUrniaz/kmeRs.svg?branch=master)](https://travis-ci.com/RafalUrniaz/kmeRs) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)

# kmeRs: The k-mers similarity score matrix package

The package contains tools to calculate DNA similarity score matrix for k length given k-mers vs. different k-mers combination. The pairwise similarity score is calculated using PAM or BLOSUM substitution matrix; 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. The results are evaluated by global similarity score calculated by Needleman-Wunsch global (Needleman and Wunsch 1970) alignment or Smith-Waterman local alignment (Smith and Waterman 1981). Higher similarity score indicates more similar sequences for BLOSUM and opposite for PAM matrix.

Depends: R (>= 3.4.0) <br/>
License: GPL-3 <br/>
Encoding: UTF-8<br/> 

References
----------
###### Needleman, Saul B., and Christian D. Wunsch. 1970. “A General Method Applicable to the Search for Similarities in the Amino Acid Sequence of Two Proteins.” *Journal of Molecular Biology* 48 (3): 443–53. doi:[https://doi.org/10.1016/0022-2836(70)90057-4](https://doi.org/https://doi.org/10.1016/0022-2836(70)90057-4).  
###### Smith, T.F., and M.S. Waterman. 1981. “Identification of Common Molecular Subsequences.” *Journal of Molecular Biology* 147 (1): 195–97. doi:[https://doi.org/10.1016/0022-2836(81)90087-5](https://doi.org/https://doi.org/10.1016/0022-2836(81)90087-5).

