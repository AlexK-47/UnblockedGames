void setup() {
  size(window.screen.width, window.screen.height-100);
  //variables
  var playerX = 0;
  var playerY = 300;
  var loopSpeed = 10;
  var key = "";
  var stop = false;
  var originalGravity = 5;
  var gravity = 5;
  var jump = {jumping:false,falling:false,timer:0,stop:false,timeLimit:200};

  var block = function(x,y,w,h){
    rect(x,y,w,h);
    if(playerX>=x-50 && playerX<=x+w){
      if(playerY>=y-50 && playerY<=y+h){
        if(playerY>=y){
          playerY=y-50;
        }
        if(playerY<=y+h+50){
          PlayerY=y+h+50;
          console.log("done");
        }
      }
    }
  };

  var player = function(){
    // change the color of the rectangle
    fill(255,165,105)
    // draw the rectangle representing the player
    rect(playerX,playerY,50,50);

    // if player is jumping
    if(jump.jumping===true){
      // if player is going up and not falling
      if(jump.falling===false){
        gravity -= (jump.timer/jump.timeLimit);
        jump.timer++;
        playerY-=gravity;
        if(jump.timer>=jump.timeLimit){
          jump.falling=true;
          jump.timer=0;
          gravity=originalGravity;
        }
      }else{
        gravity+=(jump.timer/jump.timerLimit);
        jump.timer++;
        playerY+=gravity;
        if(jump.timer >= jump.timeLimit){
          jump.falling=false;
          jump.timer=0;
          jump.jumping=false;
          gravity=originalGravity;
        }
      }
    }else{
      playerY+=gravity;
    }
    if(key==="Right"){
      playerX++;
    }
    if(key==="Left"){
      playerX--;
    }
    if(playerY>=window.screen.height-150){
      playerY=window.screen.height-150;
    }
  };

  //check if certain keys are pressed
  $(window).keydown(function(evt) {
    if (evt.which == 39) {
      key="Right";
    }
    if(evt.which == 38) {
      jump.jumping=true;
      stop=true;
    }
    if (evt.which == 37) {
      key="Left";
    }
  }).keyup(function(evt) {
    //reset
    if(stop===false){
      key="";
    }
    stop=false;
  });

  var draw = function(){
    background(100);
    stroke(0);
    text(playerY,10,10);
    player();
    block(300,500,100,100);
    setTimeout(draw,loopSpeed);
  };

  draw();
}
