/* Renderable regression layout for the selected baseline (currently 0.20 mm). */
include <../lib/FG_Connectors.scad>;

fgForgeLockRailBlock(clearance=FG_SLIDING_CLEARANCE, label="BASE RAIL");
translate([55,0,0])
    fgForgeLockChannelBlock(clearance=FG_SLIDING_CLEARANCE, label="BASE CHANNEL");
