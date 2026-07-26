include <FG_Config.scad>;
module fgCube(size=[10,10,10]){cube(size,center=true);}
module fgHole(d,h){cylinder(d=d,h=h+0.02);}
module fgRoundedRectangle(l,w,r=FG_RADIUS_SMALL){
r=min(r,min(l,w)/2);
hull(){for(x=[-1,1],y=[-1,1])translate([x*(l/2-r),y*(w/2-r)])circle(r=r);}
}
module fgRoundedBox(l,w,h,r=FG_RADIUS_SMALL){linear_extrude(height=h)fgRoundedRectangle(l,w,r);}
