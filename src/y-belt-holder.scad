// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module belt_holder_base() {
  translate([-33-8.5,0,-1]) cube([33,15,16]);
  translate([-33-8.5,11,-1]) cube([33,15,16]);
  translate([-50,22,-1]) cube([50,4,16]);
}

module belt_holder_beltcut() {
  belt_tooth_distance = 2.5;
  position_tweak = 1.85; //GT2 0.5
  extra_sep = 0; //GT2 0.25

  // Belt slit
  translate([-66,-0.5-extra_sep+10,3]) cube([67,1+extra_sep,15]);

  // Smooth insert cutout
  translate([-66,-0.5+10,12]) rotate([45,0,0]) cube([67,15,15]);

  // Individual teeth
  for (i = [0 : 23]) {
    translate([0-i*belt_tooth_distance+position_tweak,-0.5+8,3]) cube([belt_tooth_distance/2,3,15]);
  }

  // Middle opening
  translate([-2-25,-1,3]) cube([4,11,15]);
}

module belt_holder_fancy() {
  translate([-33-8.5-4,0,-2]) rotate([0,0,-20]) cube([20,5,19]);
  mirror([1,0,0]) translate([33-8.5-20,0,-2]) rotate([0,0,-20]) cube([20,5,19]);
}

module belt_holder_holes() {
  translate([-4.5,0,7.5]) rotate([-90,0,0]) cylinder(h = 30, r = 1.7, $fn = 10);
  translate([-45.5,0,7.5]) rotate([-90,0,0]) cylinder(h = 30, r = 1.7, $fn = 10);
}

// Final part
module belt_holder() {
  difference() {
    belt_holder_base();
    belt_holder_beltcut();
    belt_holder_fancy();
    belt_holder_holes();
  }
}

belt_holder();
