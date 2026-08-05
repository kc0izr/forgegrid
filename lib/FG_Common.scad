/*
ForgeGrid common utilities.
Version: 0.3.1-alpha
*/

include <FG_Config.scad>;

module fgLabel(text_value, size=3.0, depth=0.45) {
    assert(depth > 0, "Label depth must be positive.");

    linear_extrude(height=depth)
        text(
            text_value,
            size=size,
            halign="center",
            valign="center",
            font="Liberation Sans:style=Bold"
        );
}
