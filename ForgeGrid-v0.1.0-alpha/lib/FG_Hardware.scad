include <FG_Common.scad>;
include <FG_Standards.scad>;
module fgMagnet6x2(){cylinder(d=FG_MAGNET_6X2_DIAMETER+0.1,h=FG_MAGNET_6X2_HEIGHT+0.02);}
module fgM3Clearance(h){fgHole(FG_M3_CLEARANCE,h);}
