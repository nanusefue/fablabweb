cube([100,10,2]);
for ( i = [0 :2: 99] )
{
translate([i,0,0])
difference(){
translate([0,0,2])cube([2,10,2]);
translate([0,-1,4])rotate([0,45,0])cube([3,12,3]);

}
}
