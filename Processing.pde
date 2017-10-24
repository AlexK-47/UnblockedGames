void setup() {
  size(400,400);
  
  var draw = function(){
    background(100);
    setTimeout(draw,loopSpeed);
  };

  draw();
}
