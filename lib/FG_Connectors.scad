include <FG_Config.scad>;
include <FG_Standards.scad>;
include <FG_Common.scad>;

module _fgForgeLockRailProfile2D(){
  union(){
    translate([-FG_FL_NECK_WIDTH/2,0]) square([FG_FL_NECK_WIDTH,FG_FL_NECK_HEIGHT]);
    translate([-FG_FL_HEAD_WIDTH/2,FG_FL_NECK_HEIGHT]) square([FG_FL_HEAD_WIDTH,FG_FL_HEAD_HEIGHT]);
  }
}

module fgForgeLockRail(length=20){
  rotate([0,90,0]) linear_extrude(height=length) _fgForgeLockRailProfile2D();
}

module fgForgeLockChannelCavity(length=20,clearance=FG_SLIDING_CLEARANCE,entry_extension=1){
  neck_w=FG_FL_NECK_WIDTH+2*clearance;
  head_w=FG_FL_HEAD_WIDTH+2*clearance;
  neck_h=FG_FL_NECK_HEIGHT+clearance;
  head_h=FG_FL_HEAD_HEIGHT+clearance;
  translate([-entry_extension,0,FG_FL_BASE_THICKNESS])
    rotate([0,90,0]) linear_extrude(height=length+2*entry_extension)
      union(){
        translate([-neck_w/2,0]) square([neck_w,neck_h]);
        translate([-head_w/2,neck_h]) square([head_w,head_h]);
      }
}

module fgForgeLockChannel(length=20,clearance=FG_SLIDING_CLEARANCE,block_width=FG_TEST_BLOCK_WIDTH){
  outer_h=FG_FL_BASE_THICKNESS+FG_FL_TOTAL_HEIGHT+clearance+FG_FL_CHANNEL_TOP_WALL;
  difference(){
    cube([length,block_width,outer_h]);
    translate([0,block_width/2,0]) fgForgeLockChannelCavity(length,clearance,FG_EPSILON);
  }
}

module fgForgeLockRailTestPart(length=20,label="ENG",block_width=FG_TEST_BLOCK_WIDTH){
  label_pad=10; base_h=FG_FL_BASE_THICKNESS;
  difference(){
    union(){
      cube([length,block_width,base_h]);
      translate([0,block_width/2,base_h]) fgForgeLockRail(length);
      translate([0,block_width,0]) cube([length,label_pad,base_h]);
    }
    translate([length/2,block_width+label_pad/2,base_h-FG_TEST_LABEL_DEPTH])
      fgLabel(label,FG_TEST_LABEL_SIZE,FG_TEST_LABEL_DEPTH+FG_EPSILON);
  }
}

module fgForgeLockChannelTestPart(length=20,label="ENG",block_width=FG_TEST_BLOCK_WIDTH){
  label_pad=10;
  difference(){
    union(){
      fgForgeLockChannel(length,FG_SLIDING_CLEARANCE,block_width);
      translate([0,block_width,0]) cube([length,label_pad,FG_FL_BASE_THICKNESS]);
    }
    translate([length/2,block_width+label_pad/2,FG_FL_BASE_THICKNESS-FG_TEST_LABEL_DEPTH])
      fgLabel(label,FG_TEST_LABEL_SIZE,FG_TEST_LABEL_DEPTH+FG_EPSILON);
  }
}
