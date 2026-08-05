/*
FG-CONN-200
ForgeLock Gen1 Engagement Length Test
ForgeGrid v0.3.1-alpha

Every standalone part is generated with its bottom at Z=0.
*/

include <../../lib/FG_Config.scad>;
include <../../lib/FG_Standards.scad>;
include <../../lib/FG_Connectors.scad>;

engagement_lengths = [10, 15, 20, 25, 30];

for (i = [0 : len(engagement_lengths)-1]) {
    length = engagement_lengths[i];
    label = str(
        "ENG-",
        length < 10 ? "00" :
        length < 100 ? "0" : "",
        length
    );

    y = i * FG_TEST_ROW_PITCH;

    translate([0, y, 0])
        fgForgeLockRailTestPart(
            length=length,
            label=label
        );

    translate([length + FG_TEST_PAIR_GAP, y, 0])
        fgForgeLockChannelTestPart(
            length=length,
            label=label
        );
}
