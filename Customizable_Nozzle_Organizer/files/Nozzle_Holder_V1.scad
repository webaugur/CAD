include <write/Write.scad>
//include <VectorMath.scad>
//Font
font="write/Letters.dxf"; //["write/BlackRose.dxf":BlackRose,"write/braille.dxf":Braille,"write/knewave.dxf":knewave,"write/Letters.dxf":Default,"write/orbitron.dxf":Orbitron]
//Text size
t_size=8;
//Text Vertical Offset from hole
t_vert=0;
//Text depth/height
depth=1.5;
//Text emboss or engrave
emboss=1; //[0:engrave,1:emboss]
//Border around holes
bor=2.5;
//Square or round border
square=0; //[0:round,1:square]
//Thickness of holder
thick=8;
//number of nozzle types
num=6;
//Nozzle shaft radius in array
r=[3.15,3.15,3.15,3.15,3.15,3.15];
//Nozzle hole depths in array
h=[8,7,7,7,7,8];
//Number of each nozzle type in array
n=[1,1,2,2,3,1];
//Nozzle orifice diameter/labels in array
o=["",".3",".5",".8",".4",""];
//Label block sizes in array
s=[0,20,20,20,20,0];

//offset=0;

if(emboss==1) textemb();
else texteng();

module base(){
for(i=[0:num-1]){assign(offset=bor+i*bor+2*sumv(r,i)-r[1]){
translate([offset,0,0]){difference(){
	union(){
	translate([0,s[i]/2,0])cube([2*(bor+r[i]),s[i],thick],center=true);
for(j=[0:n[i]-1]){
	translate([0,-j*(bor+2*r[i]),0])
	if(square==0)cylinder(r=bor+r[i],h=thick, $fn=50,center=true);
	else cube([2*(bor+r[i]),2*(bor+r[i]),thick],center=true);
}	//end for
}	//end union
	for(j=[0:n[i]-1])translate([0,-j*(bor+2*r[i]),thick-h[i]])cylinder(r=r[i],h=h[i]+0.1,$fn=50,center=true);
}}	//end trans dif
}}	//end for assign
}	//end module

module textemb(){
union(){
base();
for(i=[0:num-1]){assign(offset=bor+i*bor+2*sumv(r,i)-r[1]){
translate([offset,s[i]/2+r[i]/2,thick/2])rotate([0,0,90])write(o[i],h=t_size,t=depth,center=true,font=font);
}}	//end for assign
}	//end union
}	//end module

module texteng(){
difference(){
base();
for(i=[0:num-1]){assign(offset=bor+i*bor+2*sumv(r,i)-r[1]){
translate([offset,s[i]/2+r[i]/2,thick/2])rotate([0,0,90])write(o[i],h=t_size,t=depth,center=true);
}}	//end for assign
}	//end union
}	//end module



// VectorMath.scad
// Version 2
// Released to the Public Domain
function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));