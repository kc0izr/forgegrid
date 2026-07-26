/* ForgeGrid | FG_Hardware.scad | v0.2.0-alpha */
include <FG_Common.scad>;

module fgMagnet6x2Pocket(allowance=FG_PRESS_FIT_ALLOWANCE) {
    fgMagnetPocket(FG_MAGNET_6X2_D, FG_MAGNET_6X2_H, allowance);
}

module fgM3Clearance(depth) {
    cylinder(d=FG_M3_CLEARANCE_D, h=depth + 0.02);
}

module fgM3InsertPocket(depth=5) {
    cylinder(d=FG_M3_INSERT_D, h=depth + 0.02);
}
