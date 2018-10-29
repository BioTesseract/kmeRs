# Multiple platforms testing at https://github.com/r-hub/rhub

library(rhub)
check()

# Debian Linux, R-devel, GCC (debian-gcc-devel) 									| OK |
# macOS 10.11 El Capitan, R-release (experimental) (macos-elcapitan-release) 		| OK |
# Oracle Solaris 10, x86, 32 bit, R-patched (experimental) (solaris-x86-patched) 	| OK |
# Windows Server 2008 R2 SP1, R-release, 32/64 bit (windows-x86_64-release) 		| OK |

rhub::check_for_cran()

# | OK |

# Run BiocCheck after running R CMD check.

library(BiocCheck)
BiocCheck("kmeRs_1.1.0.tar.gz")