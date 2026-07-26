/* ForgeGrid | FG_Config.scad | v0.2.0-alpha
   User-adjustable printer and material settings. Units: mm. */

FG_PROJECT_VERSION = "0.2.0-alpha";
FG_BUILD_DATE = "2026-07-26";

// Target baseline: Anycubic Kobra 2 Neo, 0.4 mm nozzle.
FG_NOZZLE_DIAMETER = 0.40;
FG_LAYER_HEIGHT = 0.20;
FG_LINE_WIDTH = 0.45;
FG_PERIMETERS = 3;
FG_INFILL_PERCENT = 15;

// Tune these after calibration; standards remain in FG_Standards.scad.
FG_GENERAL_CLEARANCE = 0.20;
FG_SLIDING_CLEARANCE = 0.20;
FG_PRESS_FIT_ALLOWANCE = 0.10;

FG_FONT = "Liberation Sans:style=Bold";
FG_TEXT_DEPTH = 0.50;

$fa = 4;
$fs = 0.40;
