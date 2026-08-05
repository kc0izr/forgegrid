/* FG-CONN-200 - ForgeLock engagement length test */
include <../../lib/FG_Config.scad>;
include <../../lib/FG_Standards.scad>;
include <../../lib/FG_Connectors.scad>;
engagement_lengths=[10,15,20,25,30];
row_pitch=42;
pair_gap=12;
for(i=[0:len(engagement_lengths)-1]){
  length=engagement_lengths[i];
  label=str("ENG-",length<100?"0":"",length);
  y=i*row_pitch;
  translate([0,y,0]) fgForgeLockRailTestPart(length=length,label=label);
  translate([length+pair_gap,y,0]) fgForgeLockChannelTestPart(length=length,label=label);
}
