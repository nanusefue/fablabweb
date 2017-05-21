/*
difference() {

cube([85,110,5]);

union() {

	rotate([0,0,90])translate([6,-40,-1])cube([2,30,15]);
	rotate([0,0,90])translate([102,-40,-1])cube([2,30,15]);
	translate([25,24,4])cube([56,66,20]);
	translate([78,27,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([28,87,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([78,87,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([28,27,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);

}}

translate([0,8,3])cube([24,94,15]);

*/



difference() {

//cube([85,110,2]);
cube([85,110,3]);

union() {

	rotate([0,0,90])translate([6,-41,-1])cube([2,31,15]);
	rotate([0,0,90])translate([102,-41,-1])cube([2,31,15]);
	
    translate([28,12,2])cube([56,87.5,2]);
    // translate([25,22,1])cube([56.5,68,20]);

	/*translate([78,27,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([28,87,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([78,87,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);
	translate([28,27,-1])cylinder (h = 6, r=1.5, center = true, $fn=100);*/

}}


//RaspberryPi B
translate([0,21,2])cube([21,21,19]);
translate([0,69,2])cube([21,21,19]);
translate([17,42,2])cube([4,40,17]);


//Raspberry PI A+
/*translate([0,21,2])cube([21,21,13.5]);
translate([0,69,2])cube([21,21,13.5]);
translate([17,42,2])cube([4,40,11.5]);
translate([25,22,1])cube([56.5,68,20]);

*/
translate([0,88,2])cube([3,22,7]);
translate([0,0,2])cube([3,22,7]);

