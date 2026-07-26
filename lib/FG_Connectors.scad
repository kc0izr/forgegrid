/* ForgeGrid | FG_Connectors.scad | v0.2.2-alpha
   ForgeGuide v0: a self-supporting, open 45-degree V-guide calibration profile.
   It validates sliding fit only. It deliberately does not provide final lift
   retention; that is tested in a later, separate locking prototype. */
include <FG_Common.scad>;

// A 45-degree trapezoidal rail, extruded along X. It prints directly on its
// narrow lower face and has no unsupported horizontal surfaces.
module fgForgeGuideRail(length=FG_FG_RAIL_LENGTH,
                        bottom_width=FG_FG_BOTTOM_WIDTH,
                        top_width=FG_FG_TOP_WIDTH,
                        height=FG_FG_HEIGHT) {
    rotate([0,90,0])
        linear_extrude(height=length)
            polygon(points=[
                [-height, -bottom_width/2],
                [-height,  bottom_width/2],
                [0,         top_width/2],
                [0,        -top_width/2]
            ]);
}

// Subtractive guide channel. The top is intentionally open: its 45-degree
// walls need no bridging or supports when the receiver is printed flat.
module fgForgeGuideChannel(length=FG_FG_RAIL_LENGTH,
                           clearance=FG_SLIDING_CLEARANCE,
                           bottom_width=FG_FG_BOTTOM_WIDTH,
                           top_width=FG_FG_TOP_WIDTH,
                           height=FG_FG_HEIGHT,
                           floor=FG_FG_CHANNEL_FLOOR) {
    translate([0, 0, floor])
        fgForgeGuideRail(
            length=length + 0.02,
            bottom_width=bottom_width + 2*clearance,
            top_width=top_width + 2*clearance,
            height=height + 0.02);
}

// Open-top receiver. The rail rests on the internal floor after being lowered
// into the V-guide, then is slid along X to assess fit.
module fgForgeGuideChannelBlock(length=FG_FG_RAIL_LENGTH,
                                clearance=FG_SLIDING_CLEARANCE) {
    block_length = length + FG_FG_WALL;
    block_height = FG_FG_CHANNEL_FLOOR + FG_FG_HEIGHT;
    difference() {
        cube([block_length, FG_FG_HOUSING_WIDTH, block_height]);
        translate([0, FG_FG_HOUSING_WIDTH/2, 0])
            fgForgeGuideChannel(length=length, clearance=clearance);
    }
}

// Rail coupon with a labelled grip tab. The rail begins immediately after the
// tab, allowing it to slide into a matching receiver without interference.
module fgForgeGuideRailBlock(length=FG_FG_RAIL_LENGTH,
                             clearance=FG_SLIDING_CLEARANCE,
                             label="") {
    grip_length = 12;
    grip_width = 12;
    grip_height = FG_FG_HEIGHT;
    difference() {
        union() {
            cube([grip_length, grip_width, grip_height]);
            translate([grip_length, grip_width/2, 0])
                fgForgeGuideRail(length=length);
        }
        if (label != "")
            translate([grip_length/2, grip_width/2, grip_height-FG_TEXT_DEPTH])
                fgText(label, size=2.0, depth=FG_TEXT_DEPTH+0.02);
    }
}
