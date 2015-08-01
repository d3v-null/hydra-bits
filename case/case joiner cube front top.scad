//connecting block for front top of case
//angle is at 79.1 degrees

$fn = 20;

module block(){
    polygon([    [0,0],
                [0,15],
                [15,17.89],
                [15,0]
            ]);
}

difference(){
    
    translate([0,15,0]) rotate([90,0,0]) linear_extrude(15) block();
    
    translate([0,11,10]) rotate([90,0,90]) cylinder(10,1.5,1.5);
    translate([0,4,10]) rotate([90,0,90]) cylinder(10,1.5,1.5);
    translate([11,0,10]) rotate([270,0,0]) cylinder(15,1.5,1.5);
    translate([5,7.5,17]) rotate([0,169,0]) cylinder(10,1.5,1.5);
}