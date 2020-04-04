# Divergence of Many-Body Perturbation Theory for Noncovalent Interactions of Large Molecules
Repository containing the benchmark calculations of the S66, L7, and S30L benchmarks.

Abstract: Prompted by recent reports of large errors in noncovalent interaction (NI) energies 
obtained from many-body perturbation theory (MBPT), we compare the performance of second-order 
Mo̷ller–Plesset MBPT (MP2), spin-scaled MP2, dispersion-corrected semilocal density functional 
approximations (DFAs), and post-Kohn–Sham random phase approximation (RPA) for predicting binding 
energies of supramolecular complexes contained in the S66, L7, and S30L benchmarks. All binding 
energies are extrapolated to the basis set limit, corrected for basis set superposition errors, 
and compared to reference results of the domain-based local pair-natural orbital coupled-cluster 
(DLPNO-CCSD(T)) or better quality. Our results confirm that MP2 severely overestimates binding 
energies of large complexes, producing relative errors of over 100% for several benchmark compounds. 
RPA relative errors consistently range between 5 and 10%, significantly less than reported 
previously using smaller basis sets, whereas spin-scaled MP2 methods show limitations similar 
to MP2, albeit less pronounced, and empirically dispersion-corrected DFAs perform almost as 
well as RPA. Regression analysis reveals a systematic increase of relative MP2 binding energy 
errors with the system size at a rate of approximately 0.1% per valence electron, whereas the 
RPA and dispersion-corrected DFA relative errors are virtually independent of the system size. 
These observations are corroborated by a comparison of computed rotational constants of organic 
molecules to gas-phase spectroscopy data contained in the ROT34 benchmark. To analyze these 
results, an asymptotic adiabatic connection symmetry-adapted perturbation theory (AC-SAPT) is 
developed, which uses monomers at full coupling, whose ground-state density is constrained to 
the ground-state density of the complex. Using the fluctuation–dissipation theorem, we obtain 
a nonperturbative “screened second-order” expression for the dispersion energy in terms of 
monomer quantities, which is exact for non-overlapping subsystems and free of induction terms; 
a first-order RPA-like approximation to the Hartree, exchange, and correlation kernel recovers 
the macroscopic Lifshitz limit. The AC-SAPT expansion of the interaction energy is obtained 
from Taylor expansion of the coupling strength integrand. Explicit expressions for the convergence 
radius of the AC-SAPT series are derived within RPA and MBPT and numerically evaluated. While 
the AC-SAPT expansion is always convergent for nondegenerate monomers when RPA is used, it is 
found to spuriously diverge for second-order MBPT, except for the smallest and least polarizable 
monomers. The divergence of the AC-SAPT series for MBPT is numerically confirmed within RPA; 
prior numerical results on the convergence of the SAPT expansion for MBPT methods are revisited 
and support this conclusion once sufficiently high orders are included. The cause of the failure 
of MBPT methods for NIs of large systems is missing or incomplete “electrodynamic” screening of 
the Coulomb interaction due to induced particle–hole pairs between electrons in different monomers, 
leaving the effective interaction too strong for AC-SAPT to converge. Hence, MBPT cannot be 
considered reliable for quantitative predictions of NIs, even in moderately polarizable molecules 
with a few tens of atoms. The failure to accurately account for electrodynamic polarization 
makes MBPT qualitatively unsuitable for applications such as NIs of nanostructures, macromolecules,
and soft materials; more robust nonperturbative approaches such as RPA or coupled cluster methods 
should be used instead whenever possible.

DOI: 10.1021/acs.jctc.9b01176
