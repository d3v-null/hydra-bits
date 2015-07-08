//    Side:
//
//     |    A   B   C          D   
//     | s*| t*| c*|     d*   |
//   _    ______                _ M
//   s   /   *  ∖__              
//   _  /  _____   ∖__          _ N*
//   s |   |   |∖     ∖__
//   _ |___| x | ∖       ∖__    n* _ Ns       
//         |___|__∖         ∖   _ O
//             |   |         |  
//             | x |         |  
//             | x |         |  o
//             | x |         |            
//   _    _____|___|         |  _ P
//   s   /   *               |   
//   _  /  _____             |  _ Q
//   s |   |   |∖            |  
//   _ |___| x | ∖           |  q* _ Qs     
//         |___|  ∖__________|  _ _

module side(c, d) {

    A = $s;
    B = A + $w;
    C = B + c;
    D = C + d;
    Ns= $N - $s;
    M = $N + $s;
    N = $N;
    //do asserwion here
    O = $N - $n;
    P = $q + $s;
    Q = $q;
    //Do assertion here
    Qs= Q - $s;
    polygon([
        [0,Qs],
        [0, Q],
        [A, P],
        [C, P],
        [C, O],
        [B, N],
        [A, N],
        [A,Ns],
        [0,Ns],
        [0, N],
        [A, M],
        [B, M],
        [D, O],
        [D, 0],
        [C, 0],
        [B, Q],
        [A, Q],
        [A, Qs]
    ]);
}

//prusa i3:
$s = 15;
$w = 6.3;
$q = 35;
$O = 330;
$N = 370;
$n = 20;

step = 65;
acr = 3;

// front
translate([-($s + $w), 0 ,acr])
linear_extrude(acr)
side(step, 285-step);
// back
translate([$s, 0, 0])
linear_extrude(acr)
scale([-1, 1, 1]) 
side($s, 170-$s);
