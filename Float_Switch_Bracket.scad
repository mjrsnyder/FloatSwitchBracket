// Author: Charlie Snyder
// Twitter Handle: @mjrsnyder

$fn=30;

length=60;
width=25;
switchRadius=5;
switchArmLength=30;

module riser_base(length, width) {
    difference () {
        cube([length,width,5]);
        translate ([7.5,(width -5)/2,0]) {
            cube([length - 20,5,5]);
        }
        translate([7.5,width/2,0]){
            cylinder(r=2.5, h=5);
        }
        translate([length -12.5 ,width/2,0]){
            cylinder(r=2.5, h=5);
        }
    }
}

module switch_holder(width, length, holeRadius) {
    difference(){
        cube([length, width, 3]);
        translate([holeRadius+5, (width - (holeRadius*2))/2]) {
            cube([length - 5, holeRadius*2, 3]);
        }
        translate([holeRadius+5 ,width/2]){
            cylinder(r=holeRadius, h=3);
        }
    }
}



riser_base(length,width);

translate([length,0,5]) {
    rotate(a=270, v=[0,1,0]) {
        switch_holder(width, switchArmLength, switchRadius);
    }
}