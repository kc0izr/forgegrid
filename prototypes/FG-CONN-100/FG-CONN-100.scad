/* FG-CONN-100 | ForgeGuide sliding-fit fixture | v0.2.2-alpha
   Every piece prints flat without supports or brim. Each row contains one
   labelled 45-degree rail coupon and one matching open-top V-guide receiver. */

include <../../lib/FG_Connectors.scad>;

FG_CONN_100_CLEARANCES = [0.10, 0.15, 0.20, 0.25, 0.30];
FG_CONN_100_ROW_PITCH = 24;
FG_CONN_100_PAIR_GAP = 8;

module fgConn100Row(index, clearance) {
    label = str("C", index+1, " ", clearance);
    fgForgeGuideRailBlock(clearance=clearance, label=label);
    translate([FG_FG_RAIL_LENGTH + 12 + FG_CONN_100_PAIR_GAP, 0, 0])
        fgForgeGuideChannelBlock(clearance=clearance);
}

for (i=[0:len(FG_CONN_100_CLEARANCES)-1])
    translate([0, i*FG_CONN_100_ROW_PITCH, 0])
        fgConn100Row(i, FG_CONN_100_CLEARANCES[i]);
