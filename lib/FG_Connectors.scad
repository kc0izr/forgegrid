/* ForgeGrid | FG_Connectors.scad | v0.2.0-alpha
   ForgeLock Gen 1 baseline fit geometry.
   Rail and channel slide along the X axis. This revision intentionally excludes
   magnets and detents so clearance can be measured without confounding forces. */
include <FG_Common.scad>;

// The captured rail. Place this directly on a module's top surface.
module fgForgeLockRail(length=FG_FL_RAIL_LENGTH,
                       stem_width=FG_FL_STEM_WIDTH,
                       head_width=FG_FL_HEAD_WIDTH,
                       stem_height=FG_FL_STEM_HEIGHT,
                       head_height=FG_FL_HEAD_HEIGHT,
                       base_height=FG_FL_BASE_HEIGHT,
                       lead_in=1.2) {
    difference() {
        union() {
            // Stem and head create an inverted-T captured profile.
            translate([0, -stem_width/2, base_height])
                cube([length, stem_width, stem_height]);
            translate([0, -head_width/2, base_height + stem_height])
                cube([length, head_width, head_height]);
        }
        // 45-degree lead-in on insertion end (negative X).
        translate([-0.01, -head_width/2-0.01, base_height+stem_height])
            rotate([0,45,0]) cube([lead_in*1.42, head_width+0.02, lead_in*1.42]);
    }
}

// Subtractive captured channel. Cut this from a solid housing.
module fgForgeLockChannel(length=FG_FL_RAIL_LENGTH,
                          clearance=FG_SLIDING_CLEARANCE,
                          stem_width=FG_FL_STEM_WIDTH,
                          head_width=FG_FL_HEAD_WIDTH,
                          stem_height=FG_FL_STEM_HEIGHT,
                          head_height=FG_FL_HEAD_HEIGHT,
                          base_height=FG_FL_BASE_HEIGHT,
                          lead_in=1.2) {
    // Clearances apply across both sides / vertical faces.
    translate([-0.01, -(stem_width + 2*clearance)/2, base_height-clearance])
        cube([length+0.02, stem_width + 2*clearance, stem_height + clearance]);
    translate([-0.01, -(head_width + 2*clearance)/2, base_height + stem_height-clearance])
        cube([length+0.02, head_width + 2*clearance, head_height + 2*clearance]);
    // Broad entry funnel at the open end.
    translate([-0.01, -(head_width + 2*clearance)/2, base_height + stem_height-clearance])
        rotate([0,45,0]) cube([lead_in*1.42, head_width+2*clearance, lead_in*1.42]);
}

// A printable receiver block, open at X=0 with a solid end stop at +X.
module fgForgeLockChannelBlock(length=FG_FL_RAIL_LENGTH,
                               clearance=FG_SLIDING_CLEARANCE,
                               wall=FG_WALL_NORMAL,
                               label="") {
    block_length = length + wall + FG_FL_STOP_WIDTH;
    difference() {
        cube([block_length, FG_FL_HOUSING_WIDTH, FG_FL_HOUSING_HEIGHT]);
        translate([0, FG_FL_HOUSING_WIDTH/2, 0])
            fgForgeLockChannel(length=length, clearance=clearance);
        // Recessed label on top, intentionally shallow.
        if (label != "")
            translate([block_length/2, FG_FL_HOUSING_WIDTH/2, FG_FL_HOUSING_HEIGHT-FG_TEXT_DEPTH])
                fgText(label, size=2.7, depth=FG_TEXT_DEPTH+0.02);
    }
}

// A printable rail test piece with a grip tab and matching label.
module fgForgeLockRailBlock(length=FG_FL_RAIL_LENGTH,
                            clearance=FG_SLIDING_CLEARANCE,
                            label="") {
    grip_length = 12;
    difference() {
        union() {
            cube([length + grip_length, FG_FL_HOUSING_WIDTH, FG_FL_BASE_HEIGHT]);
            translate([grip_length, FG_FL_HOUSING_WIDTH/2, 0])
                fgForgeLockRail(length=length);
        }
        if (label != "")
            translate([grip_length/2, FG_FL_HOUSING_WIDTH/2, FG_FL_BASE_HEIGHT-FG_TEXT_DEPTH])
                fgText(label, size=2.7, depth=FG_TEXT_DEPTH+0.02);
    }
}
