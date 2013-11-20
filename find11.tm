# Realizati masina Turing care cauta la dreapta secventa 11,
# dupa care se opreste.
# Ex1: 001100 -> 001100. Stare finala q2
# Ex1: 001001 -> 001001. Stare finala q3

# Daca ne aflam pe 0, continuam la dreapta.
q0 0 q0 0 R

# Daca intalnim 1, iar caracterul urmator este tot 1, finalizam executia.
q0 1 q1 1 R
q1 1 q2 1 R

# Daca am intalnit 1, iar caracterul actual este 0, continuam parcurgerea.
q1 0 q0 0 R

# Daca ajungem la sfarsit dupa un 0 sau dupa un singur 1,
# finalizam executia in starea q3
q0 _ q3 _ R
q1 _ q3 _ R

# Starea finala: F = q2 daca s-a gasit
#                F = q3 daca nu s-a gasit