# Adauga 1 la un numar binar.
# Ex: 1011 -> 1100

# Mai intai parcurgem banda pana la sfarsit, adica intalnirea
# caracterului blank.
q0 1 q0 1 R
q0 0 q0 0 R
q0 _ q1 _ L

# La intalnirea acestuia, pornim invers.
# Suprascriem orice 1 intalnit in 0.
# Cand intalnim 0 sau blank, il suprascriem in 1 si terminam executia.
q1 1 q1 0 L
q1 0 q2 1 L
q1 _ q2 1 L

# Starea finala: F = q2
# C spatiu = nrCaractere + 1 = nrCaractere
# C timp = (2 * nrCaractere) + 1 = 2 * nrCaractere