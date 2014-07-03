//http://corexy.com/theory.html

include <./lib/boxes.scad>
include <./lib/stepper-motors.scad>
include <./lib/bearings.scad>

module stage_XY() {

  a_motor_pos = [225, -250, -2.6];
  b_motor_pos = [-225, -250, -2.6];
  
  difference() {
    color("white", 1) translate([0, -25, 0]) roundedBox([500, 500, 5], 5, true);
    roundedBox([405, 365, 7], 5, true);
    translate(a_motor_pos) motor_holes();
    translate(b_motor_pos) motor_holes();
  }  
  
  translate(a_motor_pos) {
    translate([0, 0, 10]) pulley();
    rotate([0,0,90]) NEMA(NEMA17);
  }
  translate(b_motor_pos) {
    translate([0, 0, 10]) pulley();
    rotate([0,0,-90]) NEMA(NEMA17);  
  }

  translate([0,0,-81.5]) X_axis(224*$t);

}

module motor_holes() {
  translate([0, 0, -1]) cylinder(r=12.5,h=10);
  translate([15.5, 15.5, -1]) cylinder(r=1.8,h=10);
  translate([-15.5, -15.5, -1]) cylinder(r=1.8,h=10);
  translate([-15.5, 15.5, -1]) cylinder(r=1.8,h=10);
  translate([15.5, -15.5, -1]) cylinder(r=1.8,h=10);
}

module X_axis(x_state=112, rod_width=351) {
  translate([112-x_state,0,0]) extruder();
  translate([-rod_width/2,35,69]) rotate([90,0,90]) rod(rod_width, 4);
  translate([-rod_width/2,-35,69]) rotate([90,0,90]) rod(rod_width, 4);
  translate([-165,0,69]) roundedBox([20, 100, 20], 5, true);
  translate([165,0,69]) roundedBox([20, 100, 20], 5, true);
  translate([0,0,81.6]) stage_X();
}

module stage_X() {
  color("white") {
    difference() {
      roundedBox([400, 160, 5], 5, true);
      roundedBox([310, 105, 7], 5, true);
    }
  }
  pulley_bearing();
}

module extruder() {
  translate([0,0,69]) roundedBox([80, 100, 20], 5, true);
  translate([-12,0,0]) hotend();
  translate([12,0,0]) hotend();
}

module hotend() {
  color("LightSlateGray") {
    translate([0, -102.2, -69]) rotate([90,0,90]) import("./lib/hotend.stl");
  }
}

module rod(h, r=6) {
  color("LightSlateGray") {
    cylinder(h=h, r=r);
  }
}





//translate([0,0,384.5]) stage_XY();


