include <./lib/rods.scad>
include <./lib/bearings.scad>
include <./lib/boxes.scad>
include <./lib/shapes.scad>

$fn=50;


module bearing_mount_box_top() {
  difference() {
    translate([0,50,6]) roundedBox([35, 90, 12], 5, true);
    translate([0,50,0]) rotate([-90,0,0]) hexagon(14, 120);
    translate([0,20,0]) rotate([0,0,0]) bearing_mount_hole(90,-18);
    translate([-28,20+3.0,9]) cube([30,1.5,20]);
    translate([-28,20-4.5,9]) cube([30,1.5,20]);
    translate([0,80,0]) rotate([0,0,0]) bearing_mount_hole(90,-18);
    translate([-28,80+3.0,9]) cube([30,1.5,20]);
    translate([-28,80-4.5,9]) cube([30,1.5,20]);    
  }
}

module bearing_mount_box_bottom() {
  difference() {
    translate([0,50,-6]) roundedBox([35, 90, 12], 5, true);
    translate([0,50,0]) rotate([-90,0,0]) hexagon(14, 120);
    translate([0,20,0]) rotate([0,120,0]) bearing_mount_hole(90,-18);
    translate([0,20,0]) rotate([0,-120,0]) bearing_mount_hole(270,18);
    translate([0,80,0]) rotate([0,120,0]) bearing_mount_hole(90,-18);
    translate([0,80,0]) rotate([0,-120,0]) bearing_mount_hole(270,18);
  }
}

module bearing_mount_trio() {
  rotate([0,0,0]) bearing_mount(90,-2.8);
  rotate([0,120,0]) bearing_mount(90,-2.8);
  rotate([0,-120,0]) bearing_mount(270,2.8);
}

module bearing_mount(angle, depth) {
  translate([-1.25,0,9.50]) rotate([0,90,0]) small_bearing();  
  translate([depth,0,9.50]) rotate([0,angle,0]) screwM3();
}

module bearing_mount_hole(angle, depth) {

  translate([depth,0,9.50]) rotate([0,angle,0]) {
    difference() {
     cylinder(r=4.5, h=20);
     translate([0,0,19.3]) cylinder(r=2.5, h=1);
    }
    cylinder(r=1.6, h=26);
  }
}


module screwM3(h=10) {
  color("SlateGray") {
    difference() {
      union() {
        cylinder(h=h,r=1.5);
        cylinder(h=1.65,r2=1.5,r1=3.2);
      }
      translate([0,0,0]) rotate([0,90,0]) cube([1,0.8,8], true);
    }
  }
}

//rotate([-90,0,0]) rod(100);

translate([0,20,0]) bearing_mount_trio();
translate([0,80,0]) bearing_mount_trio();

bearing_mount_box_top();
bearing_mount_box_bottom();






