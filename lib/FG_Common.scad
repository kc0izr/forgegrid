include <FG_Config.scad>;
module fgLabel(text_value,size=3.2,depth=0.45){
  linear_extrude(height=depth)
    text(text_value,size=size,halign="center",valign="center",font="Liberation Sans:style=Bold");
}
