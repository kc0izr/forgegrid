/* ForgeGrid | FG_Standards.scad | v0.2.2-alpha
   Engineering constants. Change only through a documented specification update. */

include <FG_Config.scad>;

FG_MIN_WALL = 2.0;
FG_WALL_NORMAL = 2.4;
FG_FILLET_SMALL = 2.0;
FG_FILLET_MEDIUM = 4.0;

FG_MAGNET_6X2_D = 6.0;
FG_MAGNET_6X2_H = 2.0;
FG_M3_CLEARANCE_D = 3.4;
FG_M3_INSERT_D = 4.6;

FG_STANDARD_CARD_W = 63.5;
FG_STANDARD_CARD_H = 88.9;
FG_DOUBLE_SLEEVE_CARD_W = 69.0;
FG_DOUBLE_SLEEVE_CARD_H = 94.0;

// ForgeLock Gen 1 test profile: rail slides along X.
FG_FL_RAIL_LENGTH = 30;
FG_FL_STEM_WIDTH = 6.0;
FG_FL_HEAD_WIDTH = 11.0;
FG_FL_STEM_HEIGHT = 3.0;
FG_FL_HEAD_HEIGHT = 2.5;
// The rail stem starts directly on the mating floor.  A base below the stem
// would collide with the channel floor and prevent sliding.
FG_FL_BASE_HEIGHT = 0;
FG_FL_CHANNEL_FLOOR = 1.2;

// ForgeGuide v0 profile: self-supporting 45-degree guide used for fit testing.
FG_FG_RAIL_LENGTH = 30;
FG_FG_BOTTOM_WIDTH = 4.0;
FG_FG_TOP_WIDTH = 10.0;
FG_FG_HEIGHT = 3.0;
FG_FG_CHANNEL_FLOOR = 1.2;
FG_FG_HOUSING_WIDTH = 18.0;
FG_FG_WALL = 2.4;
FG_FL_HOUSING_WIDTH = 18.0;
FG_FL_HOUSING_HEIGHT = 9.0;
FG_FL_STOP_WIDTH = 2.0;
