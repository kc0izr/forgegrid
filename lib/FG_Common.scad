/* ForgeGrid | FG_Common.scad | v0.2.1-alpha */
include <FG_Config.scad>;
include <FG_Standards.scad>;

// 2D rounded rectangle centred on the origin.
module fgRoundedRectangle(length, width, radius=FG_FILLET_SMALL) {
    r = min(radius, min(length, width) / 2);
    hull() {
        for (x=[-length/2+r, length/2-r])
            for (y=[-width/2+r, width/2-r])
                translate([x,y]) circle(r=r);
    }
}

module fgRoundedBox(length, width, height, radius=FG_FILLET_SMALL) {
    linear_extrude(height=height) fgRoundedRectangle(length, width, radius);
}

// Subtractive pocket; starts at Z=0 and adds a tiny overcut.
module fgMagnetPocket(diameter=FG_MAGNET_6X2_D,
                      depth=FG_MAGNET_6X2_H,
                      allowance=FG_PRESS_FIT_ALLOWANCE) {
    cylinder(d=diameter + allowance, h=depth + 0.02);
}

module fgText(text_value, size=4, depth=FG_TEXT_DEPTH) {
    linear_extrude(height=depth)
        text(text_value, size=size, font=FG_FONT, halign="center", valign="center");
}
