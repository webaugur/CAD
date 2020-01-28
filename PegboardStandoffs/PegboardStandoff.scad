// Side length
s=25.4;
//Thickness of holder
h=10;
// Hole radius
r=3;

module base(){
    difference(){
        cube([s,s,h], center=true);
        cylinder(h, r, r, center=true);
    }
}

// execute entry point
base();