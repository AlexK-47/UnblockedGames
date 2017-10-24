void setup() {
  //set size of window
  size(400,400);
  var loopSpeed = 2;
  var x = 0;
  var draw = function(){
    rect(x,x,x,x);
    x++;
    //makes it infinite loop
    setTimeout(draw,loopSpeed);
  };
  //start the infinte loop chain
  draw();
}
