/* FG-CONN-100 | ForgeLock Gen 1 clearance calibration fixture | v0.2.0-alpha
   Print all geometry in one job. Each row contains a rail (left) and a receiver
   channel (right). Test matching labels only. */

include <../../lib/FG_Connectors.scad>;
include <../../lib/FG_Version.scad>;

FG_CONN_100_CLEARANCES = [0.10, 0.15, 0.20, 0.25, 0.30];
FG_CONN_100_ROW_PITCH = 26;
FG_CONN_100_PAIR_GAP = 9;

module fgConn100Row(index, clearance) {
    label = str("C", index+1, " ", clearance);
    fgForgeLockRailBlock(clearance=clearance, label=label);
    translate([FG_FL_RAIL_LENGTH + 12 + FG_CONN_100_PAIR_GAP, 0, 0])
        fgForgeLockChannelBlock(clearance=clearance, label=label);
}

for (i=[0:len(FG_CONN_100_CLEARANCES)-1])
    translate([0, i*FG_CONN_100_ROW_PITCH, 0])
        fgConn100Row(i, FG_CONN_100_CLEARANCES[i]);
