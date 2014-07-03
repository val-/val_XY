
include <./screws.scad>
include <./nuts.scad>
include <./washers.scad>

module pulley() {
  color("gray") difference() {
    cylinder(r=8, h=16);
    translate([0,0,-1]) cylinder(r=2.55, h=18);
    difference() {
      translate([0,0,8]) cylinder(r=9, h=7);
      translate([0,0,8]) cylinder(r=5, h=9);
    }
  }
}

module pulley_bearing() {
  
  norm_bearing();
  translate([0,0,5.2]) norm_bearing();
  //color("DimGray") {
    translate([0,0,15]) rotate([0,180,0]) screw(M4_cap_screw, 20);
  //}

  
}

module small_bearing() {
  color("WhiteSmoke") {
    difference() {
      cylinder(r=3.5,h=2.5);
      translate([0,0,-1]) cylinder(r=1.5,h=4);
    }
  }
}

module norm_bearing() {
  color("WhiteSmoke") {
    difference() {
      cylinder(r=6.5,h=5);
      translate([0,0,-1]) cylinder(r=2,h=7);
    }
  }
}
