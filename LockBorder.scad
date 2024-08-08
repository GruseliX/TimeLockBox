include <BOSL2/std.scad>

$fn=360;
$fa=64;

/*[ Show ]*/

show_base = true;
show_bottom = true;
show_inlet = true;
show_top = true;
show_lock = true;

case();

module case(show_box,show_cover_lock, show_insert, show_lock){
  difference(){
    if(show_base){
      box();
    }
    else{
      box();
    }
    
    inner_cut_box();
    
    if(show_base && show_top){
      box_outer_cut("bottom");
    }
    
    if(show_base && show_bottom){
    box_outer_cut("top");
    }
    
  }
  if(show_inlet){
    insert();
  }
  if(show_lock){
    lock();
  }
}
  
module box(a){
  translate([5,0,0]){
    cuboid([100,60,32],chamfer=2);
  }
  
}

// TODO Verschraubung überdenken
module inner_cut_box(){
  union(){
    // cut for the lock
    translate([21.5,0,-0.6]){
      cuboid([43.5,47,19.5]);
    }
    // cut for the plug
    translate([53,0,-0.6]){
      cuboid([20,15,40]);
    }
    // cut for Key Lock
    translate([31.5,0,9]){
      cylinder(h=10,r=1.5);
    }
    // cut for Key M
    translate([31.5,12,9]){
      cylinder(h=10,r=1.5);
    }
    // cut for Key H
    translate([31.5,-12,9]){
      cylinder(h=10,r=1.5);
    }
    //cut for display
    translate([13.5,0,13]){
      cuboid([10,30,8]);
    }
    // cut for cover
    translate([-45/2,0,7.5]){
        cuboid([45.01,60.01,17.01],
          chamfer=2,
          edges=[
            TOP+LEFT,
            TOP+BACK,
            TOP+FRONT,
            FRONT+LEFT,
            BACK+LEFT
            ]);
    }
    // cut for slider   
    translate([-20,0,0]){
      cuboid([50.01,46.01,2.01],
        chamfer=2,
        edges=[
          BOTTOM+FRONT,
          BOTTOM+BACK
          ]);
    }
    // cut for the open handle
    translate([-23,0,0]){
        rotate([0,0,-90]){
          rotate_extrude(angle=180,convexity=2){
            translate([-46/2+7,0,0]){
             circle(r=5.1);
            }
          }
        }
      }
    //Schackel right
    translate([1,46/2-5.5,0.5]){
        rotate([0,-90,0]){
          linear_extrude(height=29,center=false){
            circle(r=3);
          }
        }
      }
    //Schackel left
    translate([1,-46/2+5.5,0.5]){
        rotate([0,-90,0]){
          linear_extrude(height=29,center=false){
            circle(r=3);
          }
        }
      }
    // Schaft inlet
    translate([3,0,-3.5]){
      cuboid([75,28,21],
        rounding=10,
        teardrop=true,
        edges=[
          BOTTOM+LEFT,
          FRONT+LEFT,
          BACK+LEFT
        ]);
    }
    // Screw 1
    translate([-15,0,-16.1]){
      cylinder(h=2.2,r1=1.5,r2=3);
    }
    // Screw 2
    translate([13,0,-16.1]){
      cylinder(h=2.2,r1=1.5,r2=3);
    }  
   }
}
module inner_cut_insert(){
}
module box_outer_cut(a){
  union(){
    if(a == "bottom"){
      translate([0,-31,0]){
        cube([56,62,17],center=false);
      }
      translate([49,17,-19]){
        cylinder(h=15,r=3.25,center=false);
      }
      translate([49,17,-6.9]){
        cylinder(h=7,r=1.25,center=false);
      }
      translate([49,-17,-19]){
        cylinder(h=15,r=3.25);
      }
      translate([49,-17,-6.9]){
        cylinder(h=7,r=1.25,center=false);
      }
      translate([20,-26.5,-19]){
        cylinder(h=15,r=3);
      }
      translate([20,-26.5,-6.9]){
        cylinder(h=7,r=1.25,center=false);
      }
      translate([20,26.5,-19]){
        cylinder(h=15,r=3);
      }
      translate([20,26.5,-6.9]){
        cylinder(h=7,r=1.25,center=false);
      }
    }
    if(a == "top"){
      translate([-45.5,-31,-17]){
        cube([150,62,17],center=false);
      }
      // TODO Löcher gleiche tiefe
      translate([49,17,0]){
        cylinder(h=9,r=1,center=false);
      }
      translate([49,-17,0]){
        cylinder(h=9,r=1,center=false);
      }
      translate([20,-26.5,-6.9]){
        cylinder(h=9,r=1,center=false);
      }
      translate([20,26.5,0]){
        cylinder(h=9,r=1,center=false);
      }
      translate([0,26.5,10]){
        sphere(r=1.25);
      }
      translate([0,-26.5,10]){
        sphere(r=1.25);
      }
      
    }
  }
}
module lock(){
  union(){
    translate([0,-23,-10]){
      cube([43,46,18]);
    }
    button("M",false,[31.5,46/2-11,7.5],[0,0,90]);
    button("H",false,[31.5,-46/2+11,7.5],[0,0,90]);
    button("\U0F033E",true,[31.5,0,7.5],[0,0,90]);
    display([8.5,15,7.1],[0,0,-90]);
    handle(false,[-0,0,0],[0,-90,0],[0,0,0]);
  }
}

// TODO: Auslagern innercut Inlet
// TODO: Schließung überdenken
module insert(){
  union(){
    difference(){
      union(){
        // Cover
        translate([-45/2,0,7.5]){
          cuboid([45,60,17],
            chamfer=2,
            edges=[
              TOP+LEFT,
              TOP+BACK,
              TOP+FRONT,
              FRONT+LEFT,
              BACK+LEFT
              ]);
        }
        union(){
        // Slide
        translate([-20,0,0]){
          cuboid([50,46,1.5],
            chamfer=1,
            edges=[
              BOTTOM+FRONT,
              BOTTOM+BACK
              ]);
        }
        // Pocket
        translate([1,0,-5]){
          cuboid([65,27,18],
            chamfer=10,
            edges=[
              BOTTOM+LEFT,
              FRONT+LEFT,
              BACK+LEFT
            ]);
        }
      }
    }
    // Pocket cut bottom
    translate([1,-0,-1]){
      cuboid([60,24,24],
        chamfer=10,
        edges=[
          BOTTOM+LEFT,
          FRONT+LEFT,
          BACK+LEFT
          ]);
    }
    // Pocket cut top
    translate([-39,-25,4]){
      cube([40,50,8],center=false);
      }
    //Insert Lock cut
    translate([0,-31,-10]){
      cube([50,65,30],center=false);
    }
    handle(false,[-0,0,0],[0,-90,0],[0,0,0]);
    // Cut to look
    //translate([-50,-31,-15]){
    //  cube([100,31,31],center=false);
    //  }
    rotate([0,0,90]){
    translate([-15,15,16]) {
      
      linear_extrude(height=0.2,center=true){
        
        #text("rCece", size = 8, font = "Liberation Sans");
      }
    }
    }
  }
  translate([0,26.5,10]){
    sphere(r=1.2);
  }
  translate([0,-26.5,10]){
    sphere(r=1.2);
  }
  }
}
    
module button(a,b,pos,rot){
    echo(a,b,pos,rot);
    if(b != true )
    {
      translate(pos){
       rotate(rot){
         difference(){
           union(){
             translate([-4.75+2.5,0,0]){
               cylinder(h=1,r=2.5,center=false);
             }
               translate([4.75-2.5,0,0]){
                 cylinder(h=1,r=2.5,center=false);
               }
               translate([-2,-2.5,0]){
                 cube([4,5,1]);
               }
             }
             color("Fuchsia",1.0){
               translate([-1.7, -1.4,1]) {
                 linear_extrude(height=0.2,center=true){
                   text(a, size = 3, font = "Liberation Sans");
                }
              }
            }
          }
        }
      }
    }
    if(b == true){
      translate(pos){
        rotate(rot){
          difference(){
            union(){
              translate([0,0,0]){
                cylinder(h=1,r=4,center=false);
              }
            }
            color("Fuchsia",1.0){
              translate([-1.9,-1.4,1]) {
                linear_extrude(height=0.2,center=true){
                  text(a, size = 4, font = "Symbols Nerd Font");
                }
              }
            }
          }
        }
      }
    }
}

module handle(open,pos,rot,step){
  translate(pos){
    union(){
      translate([1,46/2-5.5,0]){
        rotate(rot){
          linear_extrude(height=24,center=false){
            circle(r=2.6);
          }
        }
      }
      translate([1,-46/2+5.5,0]){
        rotate(rot){
          linear_extrude(height=23,center=false){
            circle(r=2.6);
          }
        }
      }
      translate([-21,0,0]){
        rotate([0,0,-90]){
          rotate_extrude(angle=180,convexity=2){
            translate([-46/2+5.5,0,0]){
              circle(r=2.6);
            }
          }
        }
      }
    }
  }
}
module display(pos,rot){
  translate(pos){
    rotate(rot){
      color("gray",1.0){
      linear_extrude(height=1){
          square([30,10]);
        }
       }
      
     }
    }
  }