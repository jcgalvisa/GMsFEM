# GMsFEM
GMsFEM Codes (for part of Generalized multiscale finite element methods (GMsFEM) Y Efendiev, J Galvis, TY Hou Journal of computational physics 251, 116-135)


In matlab,  Run Original_GMsFEM, follow functions for coefficient,
right hand side and boundary conditions.

Run GMsFEM_kappa_tilde for modified version with local
eigenvalue problem with \tilde{kappa}

Before running, change parameters accordingly (number of coarse blocks, fine mesh size, high-contrast coefficient, ...) 

The equation is -div( kappa(x) grad(u)) =f in a square two dimensional domain. 
The GMsFEM method was developed for obtaining coarse-scale approximation when  kappa is a high-contrast multiscale coefficient. 

WARNING: This code was built on overlapping and nonoverlapping domain decomposition codes. Therefore some computations are coded in ways closer to domain decomposition than multiscale methods. If your training is in multiscale methods, you may find some procedures odd to you. 

For other experiments in the paper Generalized multiscale finite element methods (GMsFEM)
Y Efendiev, J Galvis, TY Hou,
Journal of computational physics 251, 116-135, please write me
email at jcgavlisa@unal.edu.co.
