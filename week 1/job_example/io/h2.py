import pyscf
import numpy as np
from pyscf import gto, dft, scf, cc, fci

h2 = gto.M(atom =f"""
    H
    H 1 0.74
""", basis = 'cc-pvdz', spin=0)

mypbe=dft.RKS(h2)
mypbe.xc = 'pbe' # = 'pbe,pbe'
E=mypbe.kernel()

Dpbe = mypbe.make_rdm1()

#write down the energy or what u desire into a text file to access later
with open('../data/e_tot.dat', 'w') as f:
    f.write('total energy:' + str(E))

# can use np to save matrices
np.savetxt("../data/Dpbe.dat", Dpbe)
