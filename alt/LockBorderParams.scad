//------------------------------------------------
//
//  LockBox::ZeitschlossBox
//  rCece
//  ver.:1.3
//
//-------------------------------------------------


//-------------------------------------------------
// Variables
//-------------------------------------------------
/*[Increments]*/
$fa = $preview ? 32 : 64;
$fs = 0.01;
$fn = 64;

/*[Box]*/
vBoxBottom = [
  [0,0,0],//pos
  [110,70,15],//dim
  [5]//radius
];

vCloseBlock = [
  [0,0,0],//pos
  [15,6,8],//dim
  [1.1,[-0.1,3,4.5],[0,90,0]],//hole rad,pos[x,y,z],rot[x,y,z]
  1//fase
];
vBoxTopUp = [
  55,
  70,
  15
];

vBoxTopDown = [
  55,
  70,
  15
]; 

vBorder = [
  11,
  11,
  8
 ];

/*[Bottom cut]*/  
// Lock Dimensions
// no buttons, no shackle
vLockBodyDim = [
  [42.55,45.55,18.3],
  [7], //corner radius
  vBorder // pos
];

// Dimensions Shackle
vLockShackleDim = [
  [40,35,5],// open
  [30,35,5],// close press
  [31.5,35,5] // close lose
];

vLockShackleOffset = [
   3, // open
  -8,// press
  -7 // lose
];

// Show Shackle open/closed
vOpen=true;

vShackleOpen = vOpen ? 0 : 1;

// Buttons
vButton = [
  [2],
  ["M","\U0F033E","H"], 
// "\U0F033E" "SymbolsNerdFont-Regular" "Icon-Home"
  [4.4,9,0.5],//oval button 
  [7,7,0.5], // round button
  [11,vLockBodyDim[0][1]/2-10,vLockBodyDim[0][2]], //pos b1
  [11,vLockBodyDim[0][1]/2,vLockBodyDim[0][2]], // pos b2
  [11,vLockBodyDim[0][1]/2 +10,vLockBodyDim[0][2]]// pos b3

];

// Display
vDisplay = [
  [21.5,vLockBodyDim[0][1]-2.5,vLockBodyDim[0][2]-0.9],     // position
  [30,10,1.1],   // size view
  [40,16,1], // size border
  [2]          // border radius
];

// Plug
vPlug = [
  [0,0,0], //position
  [[-3,1],[3,2],[3,-0.5],[2.75,-1],[-2.75,-1],[-3,-0.5]], // points
  [6],      //deep
  [12.5,10,6.5] // dim handle
];


// Offset
off = 0.5;

/*[Pocket Dim]*/
vPocket=[
  [35,29,23],
  [31,25,20]
];

