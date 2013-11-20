# Verifica daca numarul este divizibil cu 5.
# Outputeaza y pentru adevarat si n pentru fals la sfarsit.
# Ex1: 11111  -> 11111y
# Ex2: 111111 -> 111111n

# Parcurgem numarul pe un numar de stari egal cu divizorul.
q0 1 q1 1 R
q1 1 q2 1 R
q2 1 q3 1 R
q3 1 q4 1 R
q4 1 q0 1 R

# Daca ajungem la sfarsit pe starea q0, numarul este divizibil.
q0 _ q6 y R

# Daca nu, nu este divizibil.
q1 _ q6 n R
q2 _ q6 n R
q3 _ q6 n R
q4 _ q6 n R

# Starea finala: F = q6