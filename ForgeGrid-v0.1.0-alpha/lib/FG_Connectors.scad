include <FG_Config.scad>;
include <FG_Standards.scad>;
module fgForgeLockRail(length=FG_FL_LENGTH){cube([length,12,FG_FL_HEIGHT]);}
module fgForgeLockChannel(length=FG_FL_LENGTH,clearance=FG_GENERAL_CLEARANCE){
cube([length,12+clearance,FG_FL_DEPTH+clearance]);
}
