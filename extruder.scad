include <./lib/boxes.scad>

$fn=50;
hotend_delta = 24;
hotend_r=6.05;
hotend_R=8.05;
cut_width=0.25;

hotend_mount_a=90;
hotend_mount_b=50;

module extruder() {
  
  
  hotend_mount_top();
  hotend_mount_middle();
  hotend_mount_bootom();

  hotend_coller();  

  translate([-hotend_delta/2,0,0]) hotend();
  translate([hotend_delta/2,0,0]) hotend();
}

module hotend_mount_top() {
  color("WhiteSmoke") {
    translate([0,0,64.7]) {
      difference() {
        roundedBox([hotend_mount_a, hotend_mount_b, 5], 5, true);
        translate([-hotend_delta/2,0,-4]) cylinder(r=hotend_r,h=7);
        translate([hotend_delta/2,0,-4]) cylinder(r=hotend_r,h=7);
      }  
    }
  }
}

module hotend_mount_middle() {
  color("blue") {
    translate([0,0,60.315]) {
      difference() {
        roundedBox([hotend_mount_a, hotend_mount_b, 3.7], 5, true);
        translate([-hotend_delta/2,0,-4]) cylinder(r=hotend_R,h=7);
        translate([hotend_delta/2,0,-4]) cylinder(r=hotend_R,h=7);
      }  
    }
  }
}

module hotend_mount_bootom() {
  color("WhiteSmoke") {
    translate([0,0,55.95]) {
      difference() {
        roundedBox([hotend_mount_a, hotend_mount_b, 5], 5, true);
        translate([-hotend_delta/2,0,-4]) cylinder(r=hotend_r,h=7);
        translate([hotend_delta/2,0,-4]) cylinder(r=hotend_r,h=7);
        translate([hotend_delta/2,hotend_r-cut_width,-4]) cube([100, cut_width, 20]);
        translate([hotend_delta/2,-hotend_r,-4]) cube([100, cut_width, 20]);
        rotate([0,0,180]) {
          translate([hotend_delta/2,hotend_r-cut_width,-4]) cube([100, cut_width, 20]);
          translate([hotend_delta/2,-hotend_r,-4]) cube([100, cut_width, 20]);
        }
      }
    }
  }
}

module small_fan() {
  color("gray") {
    rotate([90,0,0]) {
      difference() {
        roundedBox([30, 30, 10], 3, true);
        translate([12,12,-10]) cylinder(r=1.5,h=20);
        translate([-12,12,-10]) cylinder(r=1.5,h=20);
        translate([12,-12,-10]) cylinder(r=1.5,h=20);
        translate([-12,-12,-10]) cylinder(r=1.5,h=20);
        difference() {
          translate([0,0,-10]) cylinder(r=14,h=20);
          translate([0,0,-12]) cylinder(r=8,h=25);
        }
      }
    }
  }
}

module hotend_coller() {
 
  translate([15,-20,34.5]) small_fan();
  translate([-15,-20,34.5]) small_fan();

  hotend_coller_duct();

}

module hotend_coller_duct() {
  color("blue") {
    
    difference() {
      translate([0,0,34.5]) {      
        rotate([90,0,0]) roundedBox([60, 30, 30], 3, true);
      }
      union() {
       translate([12,0,0]) cylinder(r=11.3,h=47.5);
       translate([12,0,0]) cylinder(r=8,h=80);
      }
      union() {
       translate([-12,0,0]) cylinder(r=11.3,h=47.5);
       translate([-12,0,0]) cylinder(r=8,h=80);
      }      

      translate([41.5,0,0]) cylinder(r=17,h=80);
      translate([-41.5,0,0]) cylinder(r=17,h=80);

      difference() {
        translate([0,17.5,34.5]) cube([65,35,35],true);
        union() {
          translate([12,0,0]) cylinder(r=12.5,h=90);
          translate([-12,0,0]) cylinder(r=12.5,h=90);
          cube([5,13,100],true);
        }
      }

      translate([0,24,34.5]) cube([65,35,26],true);

      hull() {
        translate([15,-14.5,34.5]) rotate([90,0,0]) cylinder(r=14,h=1);
        translate([12,0,34.5]) cube([20,1,26], true);
      }

      hull() {
        translate([-15,-14.5,34.5]) rotate([90,0,0]) cylinder(r=14,h=1);
        translate([-12,0,34.5]) cube([20,1,26], true);
      }      

    }
    
  }
}

module hotend() {
  color("LightSlateGray") {    
    translate([0, -102.2, -69]) rotate([90,0,90]) import("./lib/hotend.stl");
  }
}

extruder();