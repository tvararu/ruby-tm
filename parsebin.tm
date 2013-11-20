# Realizati masina Turing care sa genereze un
# sir de x-uri de lungime data de un nr binar.
# Ex: 101 -> 101xxxxx

# Algoritmul citeste numarul de la coada la cap si
# pentru fiecare 1 intalnit appenduieste numarul necesar de x-uri la
# sfarsitul benzii. Dupa aceea, cauta urmatorul 1.

# Trecem peste numar.
# Cand intalnim blank, pornim parcurgerea inversa.
q0       1   q0        1    R
q0       0   q0        0    R
q0       _   poz1      _    L

# (IF) Daca intalnim un 1 pe prima pozitie binara, outputam un x si
# ne intoarcem la pozitia urmatoare.
poz1     1   print1    1    R
print1   _   done1     x    L

# Am outputat un x. Acum ne intoarcem pe a doua pozitie binara.
done1    1   poz2      1    L

# (ELSE) Daca intalnim un 0 pe prima pozitie binara, continuam parcurgerea
# verificand pentru pozitia 2.
poz1     0   poz2      0    L

# (IF) Daca intalnim un 1 pe a doua pozitie binara, outputam 2 de x
# si ne intoarcem la pozitia urmatoare.
poz2     1   print2    1    R
print2   1   print2    1    R
print2   0   print2    0    R
print2   x   print2    x    R
print2   _   2print1   x    R
2print1  _   done2     x    L

# Am outputat 2 de x. Acum ne intoarcem pe a treia pozitie binara.
done2    x   done2     x    L
done2    1   2done1    1    L
done2    0   2done1    0    L
2done1   1   poz3      1    L
2done1   0   poz3      0    L

# (ELSE) Daca intalnim un 0 pe a doua pozitie binara, continuam
# pentru pozitia 3.
poz2     0   poz3      0    L

# (IF) Daca intalnim un 1 pe a treia pozitie binara, outputam 4 de x
# si ne intoarcem la pozitia urmatoare.
poz3     1   print3    1    R
print3   1   print3    1    R
print3   0   print3    0    R
print3   x   print3    x    R
print3   _   3print4   x    R
3print4  _   3print3   x    R
3print3  _   3print2   x    R
3print2  _   done3     x    L

# Am outputat 4 de x. Acum ne intoarcem pe a patra pozitie binara.
done3    x   done3     x    L
done3    1   3done2    1    L
done3    0   3done2    0    L
3done2   1   3done1    1    L
3done2   0   3done1    0    L
3done1   1   poz4      1    L
3done1   0   poz4      0    L

# (ELSE) Daca intalnim un 0 pe a treia pozitie binara, continuam
# pentru pozitia 4.
poz3     0   poz4      0    L
