void setup() {
    size(400, 400); 
    
}

var x = 0;
var y = 0;
var Delay = [0,0];
var blockStuff = [];
var elements = [["Sand","Fall"],["Gravel","Fall"],["Stone","NoFall"],["Player","Control"],["Fire","Disapear"]];
var idSelect = 0;
var lag = 0;

var estimateLag = function(){
    lag = blockStuff.length/9;
    text(round((lag/3)*2)+"%",60,10);
};

var block = function(){
    for(var i = 0;i<blockStuff.length;i++){
        if(blockStuff[i][3]==="Fall"){
            if(blockStuff[i][1]<=390){ 
                blockStuff[i][1]+=3;
            }
            if(blockStuff[i][1]>390){
                blockStuff[i][1]=390;
            }
            if(blockStuff[i][2]==="Sand"){
                fill(193, 227, 25);
                noStroke();
                rect(blockStuff[i][0],blockStuff[i][1],10,10);
                stroke(0,0,0);
            }
            if(blockStuff[i][2]==="Gravel"){
                fill(150, 158, 112);
                noStroke();
                rect(blockStuff[i][0],blockStuff[i][1],10,10);
                stroke(0,0,0);
            }
            
            
        }
        
        if(blockStuff[i][3]==="NoFall"){
            if(blockStuff[i][2]==="Stone"){
                fill(63, 64, 56);
                noStroke();
                rect(blockStuff[i][0],blockStuff[i][1],10,10);
                stroke(0,0,0);
            }
        }
        
        if(blockStuff[i][3]==="Control"){
            if(blockStuff[i][2]==="Player"){
                if(blockStuff[i][1]<=390){ 
                    blockStuff[i][1]+=3;
                }
                if(blockStuff[i][1]>390){
                    blockStuff[i][1]=390;
                }
                fill(207, 207, 35);
                noStroke();
                rect(blockStuff[i][0],blockStuff[i][1],10,10);
                stroke(0,0,0);
                if(keyIsPressed){
                    if(keyCode===UP){
                        blockStuff[i][1]-=5;
                    }
                    if(keyCode===LEFT){
                        blockStuff[i][0]-=2;
                    }
                    if(keyCode===RIGHT){
                        blockStuff[i][0]+=2;
                    }
                }
            }
        }
        
        if(blockStuff[i][3]==="Disapear"){
            fill(255, random(100,255), 0);
            rect(blockStuff[i][0],blockStuff[i][1],10,10);
        }
        // check if this block is supported by another block
        for(var j = 0;j<blockStuff.length;j++){
                
                if(j!==i && blockStuff[j][0]+9>=blockStuff[i][0] && blockStuff[j][0]<=blockStuff[i][0]+9 && blockStuff[i][1]<blockStuff[j][1] && blockStuff[j][1]<=blockStuff[i][1]+10){
                    blockStuff[i][1] = min(blockStuff[i][1], blockStuff[j][1]-10);
                }
            }
    }
};

void draw() {
    background(200);
    background(8, 8, 8);
    
    if(Delay[0]>=10){
        if(mouseIsPressed){
            blockStuff.push([(round(mouseX/10)*10),(round(mouseY/10)*10),elements[idSelect][0],elements[idSelect][1],0]);
            Delay[0]=0;
        }
    }
    Delay[0]++;
    block();
    fill(0, 255, 13);
    if(idSelect<elements.length){
        
    }
    if(keyIsPressed){
        if(keyCode===RIGHT && Delay[1]>=20 && idSelect<elements.length-1){
            idSelect++;
            Delay[1]=0;
        }
        if(keyCode===LEFT && Delay[1]>=20 && idSelect>0){
            idSelect--;
            Delay[1]=0;
        }
    }
    text(elements[idSelect][0],10,10);
    estimateLag();
    Delay[1]++;
}

void mousePressed() {
    
}
