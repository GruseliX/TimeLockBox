//-------------------------------------------------
//
//  LockBox::ZeitschlossBox
//  rCece
//  ver.: 1.3
//
//-------------------------------------------------

use <curvedPipes/curvedPipe.scad>
include <LockBorderParams.scad>



boxBottom(vBoxBottom[0],[0,0,0]);
*boxTopDown();
*boxTopUp();
lockBody(vLockBodyDim[2],[0,0,0]);

module boxBottom(pos,rot){
  translate(pos){
    rotate(rot){
      union(){
      hull(){
        translate([
          vBoxBottom[2][0],
          vBoxBottom[2][0],
          0]){
          cylinder(h=vBoxBottom[1][2],r=vBoxBottom[2][0]);
        }
        translate([
          vBoxBottom[2][0],
          vBoxBottom[1][1]-
          vBoxBottom[2][0],
          0]){
          cylinder(h=vBoxBottom[1][2],r=vBoxBottom[2][0]);
        }
        translate([
          vBoxBottom[1][0]-
          vBoxBottom[2][0],
          vBoxBottom[1][1]-
          vBoxBottom[2][0],
          0]){
          cylinder(h=vBoxBottom[1][2],r=vBoxBottom[2][0]);
        }
        translate([
          vBoxBottom[1][0]-
          vBoxBottom[2][0],
          vBoxBottom[2][0],
          0]){
          cylinder(h=vBoxBottom[1][2],r=vBoxBottom[2][0]);
        }
      }
        boxBottomCloseBlock(
          [15,2.5,vBoxBottom[1][2]],
          [0,0,0]);
        boxBottomCloseBlock(
          [35,2.5,vBoxBottom[1][2]],
          [0,0,0]);
        boxBottomCloseBlock(
          [15,vBoxBottom[1][1]-8.5,vBoxBottom[1][2]],
          [0,0,0]);
        boxBottomCloseBlock(
          [35,vBoxBottom[1][1]-8.5,vBoxBottom[1][2]],
          [0,0,0]);
      }
    }
  }
}

module boxBottomCloseBlock(pos,rot){
  translate(pos){
    rotate(rot){
      difference(){
      hull(){
        translate([
          vCloseBlock[3]/2,
          vCloseBlock[3]/2,
          0]){
          cylinder(h=vCloseBlock[1][2]-vCloseBlock[3]/2,r=vCloseBlock[3]/2);

        }
        translate([
          vCloseBlock[3]/2,
          vCloseBlock[1][1]-
          vCloseBlock[3]/2,
          0]){
          cylinder(h=vCloseBlock[1][2]-vCloseBlock[3]/2,r=vCloseBlock[3]/2);

        }
        translate([
          vCloseBlock[1][0]-
          vCloseBlock[3]/2,
          vCloseBlock[1][1]-
          vCloseBlock[3]/2,
          0]){
          cylinder(h=vCloseBlock[1][2]-vCloseBlock[3]/2,r=vCloseBlock[3]/2);

        }
        translate([
          vCloseBlock[1][0]-vCloseBlock[3]/2,
          vCloseBlock[3]/2,
          0]){
          cylinder(h=vCloseBlock[1][2]-vCloseBlock[3]/2,r=vCloseBlock[3]/2);

        }
        translate([
          vCloseBlock[3]/2,
          vCloseBlock[3]/2,
          vCloseBlock[1][2]-vCloseBlock[3]/2]){
            sphere(r=vCloseBlock[3]/2);
        }
        translate([
          vCloseBlock[3]/2,
          vCloseBlock[1][1]-
          vCloseBlock[3]/2,
          vCloseBlock[1][2]-vCloseBlock[3]/2]){
            sphere(r=vCloseBlock[3]/2);
        }
        translate([
          vCloseBlock[1][0]-
          vCloseBlock[3]/2,
          vCloseBlock[1][1]-
          vCloseBlock[3]/2,
          vCloseBlock[1][2]-vCloseBlock[3]/2]){
            sphere(r=vCloseBlock[3]/2);
        }
        translate([
          vCloseBlock[1][0]-vCloseBlock[3]/2,
          vCloseBlock[3]/2,
          vCloseBlock[1][2]-vCloseBlock[3]/2]){
            sphere(r=vCloseBlock[3]/2);
        }
      }
      translate(
          vCloseBlock[2][1]){
            rotate(vCloseBlock[2][2]){
            cylinder(h=vCloseBlock[1][0]+0.2,r=vCloseBlock[2][0]);
        }}
      }
    }
  }

}

module boxBottomCut(){


}
  
module boxTopUp(){
  translate([vBoxTopDown[0],0,vBoxBottom[2]]){
    cube(vBoxTopDown);
    }
}

module boxTopUpCut(){}

module boxTopDown(){
  translate([0,0,vBoxBottom[1][2]]){
    cube(vBoxTopUp);
    }
}

module boxTopDownCut(){}
  
module lockBody(pos,rot){
  translate(pos){
    rotate(rot){
      union(){
        //lock main body
        hull(){
          translate([
            vLockBodyDim[1][0],
            vLockBodyDim[1][0],
            0
            ]){
              cylinder(h=vLockBodyDim[0][2],r=vLockBodyDim[1][0]);
            }
          translate([
            vLockBodyDim[1][0],
            -vLockBodyDim[1][0]+vLockBodyDim[0][1],
            0
            ]){
              cylinder(h=vLockBodyDim[0][2],r=vLockBodyDim[1][0]);
            }
          translate([
            -vLockBodyDim[1][0]+vLockBodyDim[0][0],
            -vLockBodyDim[1][0]+vLockBodyDim[0][1],
            0
            ]){
              cylinder(h=vLockBodyDim[0][2],r=vLockBodyDim[1][0]);
            }
          translate([
            -vLockBodyDim[1][0]+vLockBodyDim[0][0],
            vLockBodyDim[1][0],
            0
            ]){
              cylinder(h=vLockBodyDim[0][2],r=vLockBodyDim[1][0]);
            }
          }
          lockShackle([vLockBodyDim[0][0],
                        vLockBodyDim[0][1]/2,
                        vLockBodyDim[0][2]/2],[0,0,0]);
          lockButton(vButton[1][0],"oval",
          vButton[4],
            [0,0,-90]);
          lockButton(vButton[1][2],"oval",
          vButton[6],
          [0,0,-90]);
          lockButton(vButton[1][1],"round",
          vButton[5],
          [0,0,-90]);
          lockDisplay(vDisplay[0],[0,0,-90]);

      }
    }
  }
}

module lockButton(char,shape,pos,rot){
  if(shape == "oval"){
    translate(pos){
      rotate(rot){
        difference(){
          hull(){
            translate([-vButton[2][1]/2+vButton[2][0]/2,0,0]){
              cylinder(h=vButton[2][2],r=vButton[2][0]/2);
            }
            translate([vButton[2][1]/2-vButton[2][0]/2,0,0]){
                cylinder(h=vButton[2][2],r=vButton[2][0]/2);
            }
          }
          color("Fuchsia",1.0){
            translate([-1.5,-1.5,vButton[2][2]]) {
              linear_extrude(height=0.2,center=true){
                text(char, size = 3, font = "Liberation Sans");
              }
            }
          }
        }
      }
    }
  }
  if(shape == "round"){
    translate(pos){
      rotate(rot){
        difference(){
          translate([0,0,0]){
            cylinder(h=vButton[3][2],r=vButton[3][0]/2);
            }
          color("Fuchsia",1.0){
            translate([-1.6,-1.1,vButton[3][2]]) {
              linear_extrude(height=0.2,center=true){
                text(char, size = 3.5, font = "Symbols Nerd Font");
              }
            }
          }
        }
      }
    }
  }
}

module lockDisplay(pos,rot){
  translate(pos){
    rotate(rot){
      color("darkgray",1.0){
        hull(){
          translate([
            vDisplay[3][0]/2,
            vDisplay[3][0]/2,
            0]){
            cylinder(h=vDisplay[2][2],r=vDisplay[3][0]/2);
          }
          translate([
            vDisplay[3][0]/2,
            vDisplay[2][1]-vDisplay[3][0]/2,
            0]){
            cylinder(h=vDisplay[2][2],r=vDisplay[3][0]/2);
          }
          translate([
            vDisplay[2][0]-vDisplay[3][0]/2,
            vDisplay[2][1]-vDisplay[3][0]/2,
            0]){
            cylinder(h=vDisplay[2][2],r=vDisplay[3][0]/2);
          }
          translate([
            vDisplay[2][0]-vDisplay[3][0]/2,
            vDisplay[3][0]/2,
            0]){
            cylinder(h=vDisplay[2][2],r=vDisplay[3][0]/2);
          }
        }
      }
    color("Lightgray",1.0){
      translate([
        -(vDisplay[1][0]
        -vDisplay[2][0])/2,
        -(vDisplay[1][1]
        -vDisplay[2][1])/2,
        0]){
        cube(vDisplay[1]);
      }
    }
  }
  }
}

module lockShackle(pos,rot){
  translate(pos){
    rotate(rot){
  curvedPipe(
    [ 
      [-10,
      vLockShackleDim[vShackleOpen][1]/2,
      0],
      [vLockShackleDim[vShackleOpen][0]+
      vLockShackleDim[vShackleOpen][2]/2,
      vLockShackleDim[vShackleOpen][1]/2,
      0],
      [vLockShackleDim[vShackleOpen][0]+
      vLockShackleDim[vShackleOpen][2]/2,
      -vLockShackleDim[vShackleOpen][1]/2,
      0],
      [vLockShackleOffset[vShackleOpen],
      -vLockShackleDim[vShackleOpen][1]/2,
      0],
    ],
    3,
		[17.5,17.5],
		5,
		2);
    }
  }
}

module pocket(){
  union(){
    translate([0,0,0]){
      cube([1,1,1]);
      }
    }
  }



