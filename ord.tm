# Realizati masina Turing care sa ordoneze alfabetic
# orice sir ce contine doar x si y.
# Ex: xxyyxx -> xxxxyy

# Parcurgem banda pana intalnim y.
q0 x q0 x R
q0 y q1 y R

# Daca nu intalnim, sirul este sortat.
q0 _ q2 _ R # stare finala

# Verificam daca mai exista vreun x.
# Daca nu, sirul este sortat.
q1 y q1 y R
q1 _ q2 _ R # stare finala.

# Daca gasim un x, il inlocuim cu y, si parcurgem invers
# pana intalnim primul x. Caracterul urmator il inlocuim cu y,
# si reincepem parcurgerea initiala.
q1 x q3 y L
q3 y q3 y L
q3 x q4 x R
q4 y q0 x R

# Stare finala: F = q2