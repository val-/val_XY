include <./frame.scad>
include <./print_bed.scad>
include <./stage_XY.scad>

frame(width=450, depth=400, height=357);

translate([0,0,300]) print_bed();
translate([0,0,384.5]) stage_XY();
