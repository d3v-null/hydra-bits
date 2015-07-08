//  Back Side:
//
//  |        B   C             D
//  | a | b | c |    d    |
//  _____________            _ E
//  |           |            e
//  |   _____   |            _ F
//  |   |   |   |  
//  |   |   |   |            f        = 40
//  |___|   |   |__________  _ G
//          |             |  
//          |             |  
//          |             |  g
//          |             |            
//  ________|             |  _ H
//  |                     |  h
//  |   _____             |  _
//  |   |   |             |  
//  |   |   |             |  i       = 40
//  |___|   |_____________|  _ _

module back_side(a, b, c, d, e, f, g, h, i){
    B = a+b;
    C = B+c;
    D = C+d;
    
    H = i+h;
    G = H+g;
    F = G+f;
    E = F+e;
    
    polygon([
        [0, 0],
        [0, H],
        [B, H],
        [B, F],
        [a, F],
        [a, G],
        [0, G],
        [0, E],
        [C, E],
        [C, G],
        [D, G],
        [D, 0],
        [B, 0],
        [B, i],
        [a, i],
        [a, 0]
    ]);
}

sup = 20;

a = sup;
b = 56.3;
//a = 1;
//b = 1;
c = sup;
d = 250;
e = sup;
f = 40;
//g = 5;
g = 295 - sup;
h = sup;
i = 40;
back_side(a,b,c,d,e,f,g,h,i);