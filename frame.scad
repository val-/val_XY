//http://corexy.com/theory.html

include <./lib/boxes.scad>
include <./lib/stepper-motors.scad>

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





