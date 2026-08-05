/*
FG-CONN-000
Datum and Geometry Verification Fixture
ForgeGrid v0.3.1-alpha

Open in the slicer after export and confirm all four coupons touch Z=0.
*/

include <../../lib/FG_Config.scad>;
include <../../lib/FG_Standards.scad>;
include <../../lib/FG_Connectors.scad>;

test_length = 20;
spacing_x = 35;
spacing_y = 46;

translate([0, 0, 0])
    fgForgeLockRailTestPart(test_length, "R-A");

translate([spacing_x, 0, 0])
    fgForgeLockChannelTestPart(test_length, "C-A");

translate([0, spacing_y, 0])
    fgForgeLockRailTestPart(30, "R-B");

translate([spacing_x + 10, spacing_y, 0])
    fgForgeLockChannelTestPart(30, "C-B");
