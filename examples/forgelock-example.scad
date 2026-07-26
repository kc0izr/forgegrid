/* Minimal use example; render as a small connector pair. */
include <../lib/FG_Connectors.scad>;

fgForgeLockRailBlock(label="EXAMPLE");
translate([55,0,0]) fgForgeLockChannelBlock(label="EXAMPLE");
