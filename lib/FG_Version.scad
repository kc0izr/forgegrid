/* ForgeGrid | FG_Version.scad | v0.2.0-alpha */
include <FG_Common.scad>;

function fgVersionString() = FG_PROJECT_VERSION;

module fgVersionMark(module_id, size=3.0, depth=FG_TEXT_DEPTH) {
    fgText(str(module_id, " ", fgVersionString()), size=size, depth=depth);
}
