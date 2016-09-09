// Author: Charlie Snyder
// Twitter Handle: @mjrsnyder

$fn=30;

width=25;
baseLength=50;
glassThickness=6;
clipLength=20;
screwDiameter=3;

module base (length, width){
    cube([length, width, 5]);
}

module glassSeparator (thickness, width) {
    cube([5,width,thickness]);
}

module clip(length, width, screwDiameter){
    cube([length+5,width,5]);
    difference() {
        translate([0, width/2]){
            cylinder(r=width/2, h=5);
        }
        cube([width/2,width,5]);
        translate([-width/4, width/2]){
            cylinder(r=screwDiameter/2, h=5);
        }
    }
}

base(baseLength, width);
translate([0,0,5]){
    glassSeparator(glassThickness, width);
}

translate([0,0,glassThickness +5]){
    clip(clipLength, width, screwDiameter);
}