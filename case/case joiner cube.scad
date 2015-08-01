$fn = 20;

difference(){
    
    cube(15,15,15);
    
    translate([5,0,10]) rotate([270,0,0]) cylinder(10,1.5,1.5);
    
    translate([15,10,10]) rotate([270,0,90]) cylinder(10,1.5,1.5);
}