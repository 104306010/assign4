int b1 = 0;
int b2 = -640;
int n = 5;
int timer = 0;
int flame_time = 0;
float d = random(122,297);
float [] enemy1x = new float[5];
float [] enemy1y = new float[5];
float [] enemy2x = new float[5];
float [] enemy2y = new float[5];
float [] enemy3x = new float[8];
float [] enemy3y = {d,d-61,d+61,d-122,d+122,d-61,d+61,d};
float enemyx = 0;
float enemyy = 0;
float tx = random(0,590);
float ty = random(0,420);
float l = 40;
float fighterx = 590;
float fightery = 240;
float flameX = 10000;
float flameY = 10000;

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean wave1;
boolean wave2;
boolean wave3;
boolean crush1;
boolean crush2;
boolean crush3;
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start;
PImage start2;
PImage end;
PImage end2;
PImage [] flame;

  int GAME;
  final int GAME_START=0;
  final int GAME_RUN=1;
  final int GAME_OVER=2;
void setup () {
   size(640, 480) ;
   frameRate(100);
   bg2 = loadImage("img/bg2.png");
   bg1 = loadImage("img/bg1.png");
   enemy = loadImage("img/enemy.png");
   fighter = loadImage("img/fighter.png");
   hp = loadImage("img/hp.png");
   treasure = loadImage("img/treasure.png");
   start = loadImage("img/start2.png");
   start2 = loadImage("img/start1.png");
   end = loadImage("img/end2.png");
   end2 = loadImage("img/end1.png");
   flame = new PImage[n];
   for(int b = 0;b < n;b++){
   flame[b] = loadImage("img/flame"+(b+1)+".png");
   }
   
   wave1 = false;
   wave2 = false;
   wave3 = false;
   crush1 = false;
   crush2 = false;
   crush3 = false;
}

void draw() {
  image(bg2,b1,0);
  image(bg1,b2,0);
  image(fighter,fighterx,fightery);
  fill(247,7,7);
    rect(10,10,l,10);
  image(hp,0,0);
  image(treasure,tx,ty);
 
  b1+=2;
  b2+=2;
  if(upPressed){
    fightery -= 4;
  }
  if(downPressed){
    fightery += 4;
  }
  if(leftPressed){
    fighterx -= 4;
  }
  if(rightPressed){
    fighterx += 4;
  }
  if (fighterx > 590 ){
    fighterx = 590;
  }
  if (fighterx < 0){
    fighterx = 0;
  }
  if (fightery > 420){
    fightery = 420;
  }
  if (fightery < 0){
   fightery = 0;
  }
  if(b1 > 640){
    b2 = 0;
  }

 
  
  
  while(b1>640){
    b1 = -640;
  }
  while(b2>640){
    b2 = -640;
  }
    switch(GAME){
    case GAME_START:
    image(start,0,0);
    enemyx = 0;
  if( mouseX > 200 && mouseX < 440 && mouseY >360&& mouseY <420){
   image(start2,0,0);
   if(mousePressed){
   GAME = GAME_RUN;
   wave1 = true;
   enemyy = random(0,419);
   }
  }
  break;
   case GAME_RUN:
  
 
  if(wave1 == true && crush1 == false){
    for(int i = 0 ; i < enemy1x.length ; i++){
      enemy1x[i] = enemyx - (i*61);
      enemy1y[i] = enemyy;
      image(enemy,enemy1x[i], enemy1y[i]);
    }
  }
    if(wave1 == true){
    for(int i = 0 ; i < enemy1x.length ; i++){
    if(enemy1x[i]-fighterx<=61&&enemy1x[i]-fighterx>=-61&&enemy1y[i]-fightery<=61&&enemy1y[i]-fightery>=-61){
      crush1 = true;
    enemy1y[i]+=1000;
    l = l-40;
    flameX = enemy1x[i];
    flameY = enemy1y[i]-1000;
    flame_time = 0;
    }
     
     image(enemy,enemy1x[i], enemy1y[i]);
     enemy1x[i] += 3;
     }
    }
  if(wave1 == true && enemyx > 884){
  wave1 = false;
  wave2 = true;
  crush2 = false;
  enemyx = 0;
  enemyy = random(0,175);
  }
  if(wave2 == true && crush2 == false){
     for(int i = 0 ; i < enemy2x.length ; i++){
       enemy2x[i] = enemyx - (i*61);
       enemy2y[i] = enemyy + (i*61);
       image(enemy, enemy2x[i], enemy2y[i]);
     }
  }
     if(wave2 == true){
      for(int i = 0 ; i < enemy2x.length ; i++){
     if(enemy2x[i]-fighterx<=61&&enemy2x[i]-fighterx>=-61&&enemy2y[i]-fightery<=61&&enemy2y[i]-fightery>=-61){
      crush2 = true;
      enemy2y[i]+=1000;
      l = l-40;
    flameX = enemy2x[i];
    flameY =enemy2y[i]-1000;
    flame_time = 0;
     }
     image(enemy, enemy2x[i], enemy2y[i]);
     enemy2x[i] += 3;
  }
  
  } 
  if(wave2 == true && enemyx > 884){
  wave2 = false;
  wave3 = true;
  crush3 = false;
  enemyx = 0;
  }
   if(wave3 == true && crush3 == false){
     float k=0;
      for(int i = 0 ; i < enemy3x.length ; i++){
        if(enemy3y[i] > 1000){
        enemy3y[i] -= 1000;
        }
      enemy3x[i] = enemyx-ceil(k/2)*61;
      k++;
      image(enemy, enemy3x[i], enemy3y[i]);
      }
   }
    if(wave3 == true){
      for(int i = 0 ; i < enemy3x.length ; i++){
     if(enemy3x[i]-fighterx<=61&&enemy3x[i]-fighterx>=-61&&enemy3y[i]-fightery<=61&&enemy3y[i]-fightery>=-61){
      crush3 = true;
      enemy3y[i]+=1000;
      l = l-40;
    flameX = enemy3x[i];
    flameY = enemy3y[i]-1000;
    flame_time = 0;
     }
     image(enemy, enemy3x[i], enemy3y[i]);
     enemy3x[i] += 3;
  }
  
  }
  if(wave3 == true && enemyx > 890){
  wave3 = false;
  wave1 = true;
  crush1 = false;
  enemyx = 0;
  enemyy = random(0,420);
  }
  image(flame[flame_time],flameX,flameY,60,60);
  timer++;
  if(timer>10){
    flame_time++;
    timer = 0;
  }
  if(flame_time>=flame.length){
             flameX=10000;
             flameY=10000;
             flame_time=0;
           }
           if(tx-fighterx<=45&&tx-fighterx>=-45&&ty-fightery<=45&&ty-fightery>=-45){
    tx = random(0,600);
    ty = random(0,440);  
    l = l+20;
  }
  if(l > 180){
    l = 180;
  }
  if(l < 5){
  GAME = GAME_OVER;
  flameY=-10000;
  }
  enemyx+=3;
   break;
   case GAME_OVER:
  
    image(end,0,0);
    wave1 = true;
    wave2 = false;
    wave3 = false;
    crush1 = false;
    crush2 = false;
    crush3 = false;
    fighterx = 590;
    fightery = 240;
    enemyx = 0;
    enemyy = random(0,420);
    l = 40;
    b1 = 0;
    b2 = -640;
   
  if(mouseX > 200 && mouseX < 440 && mouseY >300&& mouseY <360){
   image(end2,0,0);
   if(mousePressed){
   GAME=GAME_RUN;
   }
   break;
  
  }

    }
}
void keyPressed(){
  
  
  if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
}
}
void keyReleased(){
    if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      }
      }
}
