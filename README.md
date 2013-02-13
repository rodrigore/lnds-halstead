Fix Metrica halstead de aldrinmartoq
=============

http://www.programando.org/blog/2013/01/desafio-enero-las-metricas-de-halstead/


Este programa con operadores ejemplo (Peor que el original WTF) :

    $ ruby halstead.rb operadoresOld.txt halstead.rb 

    n1 = 3 (if, then, else)
    N1 = 4 (if, then, else, then)
    n2 = 58 (oper, =, File, read, ARGV, 0, split, n1, N1, n2, N2, special, '\ < \ = \ > \ * \ + \ - \ ~ \ ^ \ & \ | \ ! \ @ \ # \ $ \ % ', punct, '\.\(\)\,\[\]\{\}\:\;', toks, 1, gsub, /, #, +, ' \1 ', scan, "', *, ?, |, ^#, \s, each, do, t, include?, unless, <<, end, l1, l2, L1, L2, length, N, n, D, l1/2, to_f, V, Math, log2, E, T, 18, puts, ", join, ', ', L, 1/D)
    N2 = 185 (oper, =, File, read, ARGV, 0, split, n1, N1, n2, N2, =, special, =, '\ < \ = \ > \ * \ + \ - \ ~ \ ^ \ & \ | \ ! \ @ \ # \ $ \ % ', punct, =, '\.\(\)\,\[\]\{\}\:\;', toks, =, File, read, ARGV, 1, gsub, /, #, special, +, /, ' \1 ', scan, /, "', *, ?, "', |, ^#, punct, \s, +, /, each, do, |, t, |, oper, include?, t, unless, n1, include?, t, n1, <<, t, end, N1, <<, t, unless, n2, include?, t, n2, <<, t, end, N2, <<, t, end, end, l1, l2, L1, L2, =, n1, length, n2, length, N1, length, N2, length, N, n, D, =, L1, +, L2, l1, +, l2, l1/2, 0, *, L2, to_f, /, l2, V, =, N, *, Math, log2, n, E, =, V, *, D, T, =, E, /, 18, puts, ", n1, =, #, l1, #, n1, join, ', ', N1, =, #, L1, #, N1, join, ', ', n2, =, #, l2, #, n2, join, ', ', N2, =, #, L2, #, N2, join, ', ', N, =, #, N, n, =, #, n, V, =, #, V, L, =, #, 1/D, D, =, #, D, E, =, #, E, T, =, #, T, ")

    N = 189
    n = 61
    V = 1120.9093567993855
    L = 0.209009009009009
    D = 4.7844827586206895
    E = 5362.9714915832665
    T = 297.9428606435148

Este programa con operadores finales:

    $ ruby halstead.rb operadores.txt halstead.rb 

    n1 = 13 (=, /, #, +, *, |, each, do, if, unless, then, end, else)
    N1 = 66 (=, =, =, =, =, /, #, +, /, /, *, |, +, /, each, do, |, |, if, unless, then, end, else, unless, then, end, end, end, =, =, +, +, *, /, =, *, =, *, =, /, =, #, #, =, #, #, =, #, #, =, #, #, =, #, =, #, =, #, =, #, =, #, =, #, =, #)
    n2 = 48 (oper, File, read, ARGV, 0, split, n1, N1, n2, N2, special, '\ < \ = \ > \ * \ + \ - \ ~ \ ^ \ & \ | \ ! \ @ \ # \ $ \ % ', punct, '\.\(\)\,\[\]\{\}\:\;', toks, 1, gsub, ' \1 ', scan, "', ?, ^#, \s, t, include?, <<, l1, l2, L1, L2, length, N, n, D, l1/2, to_f, V, Math, log2, E, T, 18, puts, ", join, ', ', L, 1/D)
    N2 = 123 (oper, File, read, ARGV, 0, split, n1, N1, n2, N2, special, '\ < \ = \ > \ * \ + \ - \ ~ \ ^ \ & \ | \ ! \ @ \ # \ $ \ % ', punct, '\.\(\)\,\[\]\{\}\:\;', toks, File, read, ARGV, 1, gsub, special, ' \1 ', scan, "', ?, "', ^#, punct, \s, t, oper, include?, t, n1, include?, t, n1, <<, t, N1, <<, t, n2, include?, t, n2, <<, t, N2, <<, t, l1, l2, L1, L2, n1, length, n2, length, N1, length, N2, length, N, n, D, L1, L2, l1, l2, l1/2, 0, L2, to_f, l2, V, N, Math, log2, n, E, V, D, T, E, 18, puts, ", n1, l1, n1, join, ', ', N1, L1, N1, join, ', ', n2, l2, n2, join, ', ', N2, L2, N2, join, ', ', N, N, n, n, V, V, L, 1/D, D, D, E, E, T, T, ")

    N = 189
    n = 61
    V = 1120.9093567993855
    L = 0.0600375234521576
    D = 16.65625
    E = 18670.146474189765
    T = 1037.2303596772092


# ¿Por qué es peor la métrica?

La razón es simple: De acuerdo a la nueva lista de operadores, signos de puntuación y aclaraciones del desafió, el repositorio global falla en ciertos casos. Un ejemplo es el caso en que los operadores que son signos de comparación se encuentran juntos a otros operadores u operando. Dando un ejemplo mas concreto seria el caso de a<=1.00, en donde si se toma en consideración la nueva lista de operadores, se debería separar el operador <= de la letra a y de los dos numeros, lo que el repositorio viejo no hace.

# Aclaración final

No creo (y es altamente probable) que la mejora realizada no sea perfecta (noob de ruby). Probablemente pueda fallar en algún caso, como cabe destacar que el cambio agregado esta ligado en cierto aspecto a los símbolos y operadores de comparación mas genéricos  por lo que quizás para un determinado lenguaje de programación no funcione la métrica del todo.

Por ultimo, hice esta pequeña mejora con la principal motivación de participar y permitiendo en lo posible llegar a la base mínima de 8 participantes.

