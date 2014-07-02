//http://corexy.com/theory.html

include <./lib/boxes.scad>
include <./lib/motors.scad>

module frame(width=600, depth=500, height=700, tube_size=25) {
  
  frame_stage(width, depth, tube_size);  
  translate([0,0,height]) frame_stage(width, depth, tube_size);  
  frame_pillars(width, depth, height, tube_size);

}

module frame_stage(width, depth, tube_size) {
  translate([-width/2,-tube_size-depth/2,tube_size]) rotate([0,90,0]) alu_tube(width, tube_size);  
  translate([-width/2,depth/2,tube_size]) rotate([0,90,0]) alu_tube(width, tube_size);  
  translate([-tube_size-width/2,depth/2,0]) rotate([90,0,0]) alu_tube(depth, tube_size);  
  translate([width/2,depth/2,0]) rotate([90,0,0]) alu_tube(depth, tube_size);
}

module frame_pillars(width, depth, height, tube_size) {
  translate([-tube_size-width/2,-tube_size-depth/2,0]) alu_tube(height+tube_size, tube_size);  
  translate([width/2,-tube_size-depth/2,0]) alu_tube(height+tube_size, tube_size);  
  translate([-tube_size-width/2,depth-depth/2,0]) alu_tube(height+tube_size, tube_size);  
  translate([width/2,depth-depth/2,0]) alu_tube(height+tube_size, tube_size);    
}

module alu_tube(width, size, thickness=2) {
  color("LightGrey") translate([size/2,size/2,width/2]) difference() {
    cube([size,size,width], true);
    cube([size-thickness*2,size-thickness*2,width+2], true);
  }
}

module print_bed() {
  color("red") {
    cube([216,216,3], true);
  }
}

module XY_stage() {
  color("white") {
    difference() {
      translate([0, -25, 0]) roundedBox([500, 500, 5], 5, true);
      roundedBox([405, 365, 7], 5, true);
    }
  }

  
  translate([225, -250, -2.5]) stepper_motor_mount(17,0, true, 0);
  translate([-225, -250, -2.5]) stepper_motor_mount(17,0, true, 0);
  

}

module X_axis(x_state=112, rod_width=351) {
  translate([112-x_state,0,0]) extruder();
  translate([-rod_width/2,35,69]) rotate([90,0,90]) rod(rod_width);
  translate([-rod_width/2,-35,69]) rotate([90,0,90]) rod(rod_width);
  translate([-165,0,69]) roundedBox([20, 100, 20], 5, true);
  translate([165,0,69]) roundedBox([20, 100, 20], 5, true);
  translate([0,0,81.6]) X_stage();
}

module X_stage() {
  color("white") {
    difference() {
      roundedBox([400, 160, 5], 5, true);
      roundedBox([310, 105, 7], 5, true);
    }
  }
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


frame(width=450, depth=400, height=357);

translate([0,0,300]) print_bed();
translate([0,0,384.5]) XY_stage();

//translate([0,0,303]) X_axis(224*$t);
translate([0,-100,303]) X_axis(224);
//translate([0,-100,303]) X_axis(0);
//translate([0,100,303]) X_axis(224);
//translate([0,100,303]) X_axis(0);




