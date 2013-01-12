lnds-halstead
=============

http://www.programando.org/blog/2013/01/desafio-enero-las-metricas-de-halstead/

Programa del problema:

    $ ruby halstead.rb operadores.txt programa.txt 
    
    n1 = 6 (input, if, <=, then, print, else)
    N1 = 7 (input, if, <=, then, print, else, print)
    n2 = 5 ("ingrese un valor:", a, 100, "ganaste", "perdiste")
    N2 = 6 ("ingrese un valor:", a, a, 100, "ganaste", "perdiste")
    
    N = 13
    n = 11
    V = 44.97261104228487
    L = 0.2777777777777778
    D = 3.6
    E = 161.90139975222553
    T = 8.994522208456974

Este programa:

    $ ruby halstead.rb operadores.txt halstead.rb 

    n1 = 3 (if, then, else)
    N1 = 6 (if, if, then, else, if, then)
    n2 = 68 (oper, =, File.read, ARGV[0], ., split, n1, N1, n2, N2, [], toks, ARGV[1], scan, /".*?"|\.|[^\, \, \s]+/, each, do, |t|, oper.include?, t, not, n1.include?, <<, end, n2.include?, l1, l2, L1, L2, n1.length, n2.length, N1.length, N2.length, N, n, D, +, l1/2.0, *, L2.to_f, /, V, Math.log2, E, T, 18, puts, ", #{l1}, #{n1.join, ', }, #{L1}, #{N1.join, #{l2}, #{n2.join, #{L2}, #{N2.join, #{N}, #{n}, #{V}, L, #{1/D}, #{D}, #{E}, #{T})
    N2 = 145 (oper, =, File.read, ARGV[0], ., split, n1, N1, n2, N2, =, [], [], [], [], toks, =, File.read, ARGV[1], ., scan, /".*?"|\.|[^\, \, \, \s]+/, ., each, do, |t|, oper.include?, t, not, n1.include?, t, n1, <<, t, end, N1, <<, t, not, n2.include?, t, n2, <<, t, end, N2, <<, t, end, end, l1, l2, L1, L2, =, n1.length, n2.length, N1.length, N2.length, N, n, D, =, L1, +, L2, l1, +, l2, l1/2.0, *, L2.to_f, /, l2, V, =, N, *, Math.log2, n, E, =, V, *, D, T, =, E, /, 18, puts, ", n1, =, #{l1}, #{n1.join, ', ', }, N1, =, #{L1}, #{N1.join, ', ', }, n2, =, #{l2}, #{n2.join, ', ', }, N2, =, #{L2}, #{N2.join, ', ', }, N, =, #{N}, n, =, #{n}, V, =, #{V}, L, =, #{1/D}, D, =, #{D}, E, =, #{E}, T, =, #{T}, ")

    N = 151
    n = 71
    V = 928.611815045207
    L = 0.31264367816091954
    D = 3.198529411764706
    E = 2970.192202534302
    T = 165.01067791857233
