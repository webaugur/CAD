// Side length
s=25.4;
//Thickness of holder
h=10;
// Hole radius
r=4;
// chamfer hole cylinder
c=0;

module base(){
    difference(){
        cube([s,s,h], center=true);
        cylinder(h, r-c, r, center=true);
    }
}

// execute entry point
base();