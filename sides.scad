//    Sides:
//
//     |   $A  $B   C          D   
//     | $s| $w| c*|     d*   |
//   _    ______                _  M
//  $s   /   *  ∖__              
//   _  /  _____   ∖__          _ $N
//  $s |   |   |∖     ∖__            
//   _ |___| x | ∖       ∖__    $n _ Ns       
//         |___|__∖         ∖   _ $O
//             |   |         |    
//             | x |         |    
//             |   |         |  o
//             | x |         |            
//   _    _____|___|         |  _ P
//  $s   /   *               |   
//   _  /  _____             |  _ Q
//  $s |   |   |∖            |    
//   _ |___| x | ∖           |  $q _ Qs     
//         |___|  ∖__________|  _ _

//      Front:
// 
//     |     G   $H  $I      $J  $K  $L   $W
//     | l  | $a| $a|       | $a| $a| r  |
//   _      _________       _________       _ M
//  $s      |   |   |       |   |   |
//   _  ____|   |   |_______|   |   |____   _ $N           
//  $s |    | x | x |       | x | x |    |            
//   _ |    |   |___| PRUSA |___|   |    |  $n _ Ns             
//     |    | x |_______________| x |    |  _ $O         
//     |   /|   |   |       |   |   |∖   |            
//     |  | | x | x |       | x | x | |  |            
//     |  | |   |   |       |   |   | |  |  o         
//     |  | | x | x |       | x | x | |  |            
//   _ |  | |   |   |       |   |   | |  |  _ P         
//  $s |  | | x | x |       | x | x | |  |            
//   _ |   ∖|   |   |_______|   |   |/   |  _ $Q        
//  $s |    | x | x |       | x | x |    |         
//   _ |    |   |___|       |___|   |    |  $q _ Qs          
//     |____|___|_______________|___|____|  __   
//      
// 
module prusa_frame(){
    difference() {   
        polygon([
            [ 0, 0],
            [ 0,$N],
            [$W,$N],
            [$W, 0]
        ]);
        polygon([
            [$l,$Q],
            [$l,$O],
            [$L,$O],
            [$L,$Q]
        ]);
    }
}

module case_side(c, d) {
    C = $B + c;
    D = C  + d;
    Ns= $N - $s;
    M = $N + $s;
    P = $q + $s;
    Qs= $Q - $s;
    polygon([
        [ 0,Qs],
        [ 0,$Q],
        [$A, P],
        [ C, P],
        [ C,$O],
        [$B,$N],
        [$A,$N],
        [$A,Ns],
        [ 0,Ns],
        [ 0,$N],
        [$A, M],
        [$B, M],
        [ D,$O],
        [ D, 0],
        [ C, 0],
        [$B,$Q],
        [$A,$Q],
        [$A,Qs]
    ]);
}

module case_front() {
    polygon([
        [$H, 0],
        [$H,$O],
        [$K,$O],
        [$K, 0]
    ]);
}

//prusa i3:
$s = 15;    // support thickness
$w = 6.3;   // frame width
$q = 35;    // frame bottom height
// $O = 330;
$N = 370;   // top of frame
$n = 40;    // frame top height

//re-measure this
$l = 65;
$r = 65;
$W = 400;
$a = 3;

step = 65;

// calculations
$A = $s;
$B = $A + $w;
$O = $N - $n;
$Q = $q;
$L = $W - $r;
$K = $L - $a;
$H = $l + $a;


//printer frame
rotate([90,0,90])
linear_extrude($w)
prusa_frame();

//left
translate([0,$H,0])
rotate([90,0,0]){
    // front left
    translate([-$s, 0 ,0])
    linear_extrude($a)
    case_side(step, 285-step);
    // back left
    translate([$s+$w, 0, -$a])
    linear_extrude($a)
    scale([-1, 1, 1]) 
    case_side($s, 170-$s);
}

//right
translate([0,$K,0])
rotate([90,0,0]){
    // front left
    translate([-$s, 0 ,-$a])
    linear_extrude($a)
    case_side(step, 285-step);
    // back left
    translate([$s+$w, 0, 0])
    linear_extrude($a)
    scale([-1, 1, 1]) 
    case_side($s, 170-$s);
}

//front
translate([285+$a,0,0])
rotate([90,0,90])
linear_extrude($a)
case_front();

