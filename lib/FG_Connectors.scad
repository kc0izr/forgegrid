/*
ForgeGrid ForgeLock Gen1 provisional connector library.
Version: 0.3.1-alpha

Datum contract:
- Every standalone printable module occupies Z >= 0.
- Z = 0 is the print-bed datum.
- X is engagement length.
- Y is connector width.
*/

include <FG_Config.scad>;
include <FG_Standards.scad>;
include <FG_Common.scad>;

// Captured T rail built only from axis-aligned solids.
// Bottom of rail is exactly Z=0.
module fgForgeLockRail(length=20, lead_in=FG_FL_LEAD_IN) {
    assert(length > 0, "Rail length must be positive.");
    assert(lead_in >= 0, "Lead-in must not be negative.");
    assert(lead_in * 2 < length, "Lead-in is too long for this rail.");

    // A small end taper is created by hulling full and reduced profiles.
    reduced_neck = max(2, FG_FL_NECK_WIDTH - 2*lead_in);
    reduced_head = max(reduced_neck, FG_FL_HEAD_WIDTH - 2*lead_in);

    hull() {
        translate([0, -reduced_neck/2, 0])
            cube([FG_EPSILON, reduced_neck, FG_FL_NECK_HEIGHT]);

        translate([lead_in, -FG_FL_NECK_WIDTH/2, 0])
            cube([FG_EPSILON, FG_FL_NECK_WIDTH, FG_FL_NECK_HEIGHT]);
    }

    hull() {
        translate([0, -reduced_head/2, FG_FL_NECK_HEIGHT])
            cube([FG_EPSILON, reduced_head, FG_FL_HEAD_HEIGHT]);

        translate([lead_in, -FG_FL_HEAD_WIDTH/2, FG_FL_NECK_HEIGHT])
            cube([FG_EPSILON, FG_FL_HEAD_WIDTH, FG_FL_HEAD_HEIGHT]);
    }

    translate([lead_in, -FG_FL_NECK_WIDTH/2, 0])
        cube([length - 2*lead_in, FG_FL_NECK_WIDTH, FG_FL_NECK_HEIGHT]);

    translate([lead_in, -FG_FL_HEAD_WIDTH/2, FG_FL_NECK_HEIGHT])
        cube([length - 2*lead_in, FG_FL_HEAD_WIDTH, FG_FL_HEAD_HEIGHT]);

    hull() {
        translate([length-lead_in, -FG_FL_NECK_WIDTH/2, 0])
            cube([FG_EPSILON, FG_FL_NECK_WIDTH, FG_FL_NECK_HEIGHT]);

        translate([length-FG_EPSILON, -reduced_neck/2, 0])
            cube([FG_EPSILON, reduced_neck, FG_FL_NECK_HEIGHT]);
    }

    hull() {
        translate([length-lead_in, -FG_FL_HEAD_WIDTH/2, FG_FL_NECK_HEIGHT])
            cube([FG_EPSILON, FG_FL_HEAD_WIDTH, FG_FL_HEAD_HEIGHT]);

        translate([length-FG_EPSILON, -reduced_head/2, FG_FL_NECK_HEIGHT])
            cube([FG_EPSILON, reduced_head, FG_FL_HEAD_HEIGHT]);
    }
}

// Matching T-shaped negative volume.
// Its bottom begins at the mounting base thickness.
module fgForgeLockChannelCavity(
    length=20,
    clearance=FG_SLIDING_CLEARANCE,
    entry_extension=0.2
) {
    assert(length > 0, "Channel length must be positive.");
    assert(clearance >= 0, "Clearance must not be negative.");

    neck_w = FG_FL_NECK_WIDTH + 2*clearance;
    head_w = FG_FL_HEAD_WIDTH + 2*clearance;
    neck_h = FG_FL_NECK_HEIGHT + clearance;
    head_h = FG_FL_HEAD_HEIGHT + clearance;

    translate([-entry_extension, -neck_w/2, FG_FL_BASE_THICKNESS])
        cube([
            length + 2*entry_extension,
            neck_w,
            neck_h + FG_EPSILON
        ]);

    translate([
        -entry_extension,
        -head_w/2,
        FG_FL_BASE_THICKNESS + neck_h
    ])
        cube([
            length + 2*entry_extension,
            head_w,
            head_h + FG_EPSILON
        ]);
}

// Complete channel housing. Bottom is exactly Z=0.
module fgForgeLockChannel(
    length=20,
    clearance=FG_SLIDING_CLEARANCE,
    block_width=FG_TEST_BLOCK_WIDTH
) {
    assert(block_width >
           FG_FL_HEAD_WIDTH + 2*clearance + 2*FG_FL_CHANNEL_SIDE_WALL,
           "Channel block is too narrow.");

    outer_height =
        FG_FL_BASE_THICKNESS +
        FG_FL_TOTAL_HEIGHT +
        2*clearance +
        FG_FL_CHANNEL_TOP_WALL;

    difference() {
        translate([0, -block_width/2, 0])
            cube([length, block_width, outer_height]);

        fgForgeLockChannelCavity(
            length=length,
            clearance=clearance,
            entry_extension=FG_EPSILON
        );
    }
}

// Standalone printable rail coupon. Bottom is exactly Z=0.
module fgForgeLockRailTestPart(
    length=20,
    label="ENG",
    block_width=FG_TEST_BLOCK_WIDTH
) {
    assert(length >= 10, "Test rail is too short.");

    tab = FG_TEST_LABEL_TAB;

    difference() {
        union() {
            translate([0, -block_width/2, 0])
                cube([length, block_width, FG_FL_BASE_THICKNESS]);

            translate([0, 0, FG_FL_BASE_THICKNESS])
                fgForgeLockRail(length=length);

            translate([0, block_width/2, 0])
                cube([length, tab, FG_FL_BASE_THICKNESS]);
        }

        translate([
            length/2,
            block_width/2 + tab/2,
            FG_FL_BASE_THICKNESS - FG_TEST_LABEL_DEPTH
        ])
            fgLabel(
                label,
                size=FG_TEST_LABEL_SIZE,
                depth=FG_TEST_LABEL_DEPTH + FG_EPSILON
            );
    }
}

// Standalone printable channel coupon. Bottom is exactly Z=0.
module fgForgeLockChannelTestPart(
    length=20,
    label="ENG",
    block_width=FG_TEST_BLOCK_WIDTH
) {
    tab = FG_TEST_LABEL_TAB;

    difference() {
        union() {
            fgForgeLockChannel(
                length=length,
                clearance=FG_SLIDING_CLEARANCE,
                block_width=block_width
            );

            translate([0, block_width/2, 0])
                cube([length, tab, FG_FL_BASE_THICKNESS]);
        }

        translate([
            length/2,
            block_width/2 + tab/2,
            FG_FL_BASE_THICKNESS - FG_TEST_LABEL_DEPTH
        ])
            fgLabel(
                label,
                size=FG_TEST_LABEL_SIZE,
                depth=FG_TEST_LABEL_DEPTH + FG_EPSILON
            );
    }
}
