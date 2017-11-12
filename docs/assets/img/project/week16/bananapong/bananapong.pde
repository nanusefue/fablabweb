int size = 15; 
float xpos, ypos; // Position  Balls 
float xspeed = random(5,6); //  Balls speed X
float yspeed = random(0,4); // Balls speed Y
int player1=0;
int player2=0;
int playerpos1;
int playerpos2;
PFont f;                           // STEP 1 Declare PFont variable


void setup()
{
     size(640, 400);
     noStroke();
     frameRate(30);
     smooth();
     playerpos1 =height/2;
     playerpos2 =height/2;
     xpos = 45;
     ypos = playerpos1;
    f = createFont("Arial",16,true); // STEP 2 Create Font
 }
 
void draw()
 {
   
      
   
  
 
    background(80);
      textFont(f,46);                  // STEP 3 Specify font to be used
             text(player2+"|"+player1,(width/2)-50,50); 
     xspeed *= 1.001;
     xpos += xspeed;
     ypos += yspeed;
    

 if (ypos > height-size/2 || ypos < 0+size/2) 
 {
     yspeed *= -1;
 }
 
 if ( xpos <= 30+size/2) {
     if (ypos > playerpos1-50 && ypos < playerpos1+50){
         xspeed *= -1;
         yspeed += (ypos-playerpos1)/5;
     }
 }
 
 if (xpos <= 0){
       player1 += 1;
       if (player1 <= 6){
             xpos = 50;
             ypos = playerpos1;
             xspeed = random(5,6);
             //xspeed *= -1;
             yspeed = 0; 
             textFont(f,46);                  // STEP 3 Specify font to be used
             text(player2+"|"+player1,(width/2)-50,50); 
       }
      
 }

 if ( xpos >= width-30-size/2) {
     if (ypos > playerpos2-50 && ypos < playerpos2+50){
         xspeed *= -1;
         yspeed += (ypos-playerpos2)/5;
     }
 }
 
 if (xpos >= width){
 player2 +=1 ;
 if (player2 <= 6){
 xpos = width-50;
 ypos = playerpos2;
 xspeed = -random(5,6);
 yspeed = 0; 
       textFont(f,46);                  // STEP 3 Specify font to be used
             text(player2+"|"+player1,(width/2)-50,50); 
 }
 
 }

 
 ellipse(xpos, ypos, size, size);
 rect (10, playerpos1-50,20,100);
 rect (width-30, playerpos2-50,20,100);
 
 if (keyPressed) {
       if (keyCode == LEFT) {
           if (playerpos1 >=50)
                 playerpos1 = playerpos1 - 8;
       }
       if (keyCode == RIGHT)
       {
          if (playerpos1 <=height-50)
                 playerpos1 = playerpos1 + 8;
       }
 }
 if (keyPressed) {
         if (keyCode == UP) 
        {
         if (playerpos2 >=50)
             playerpos2 = playerpos2 - 8;
         }
         if (keyCode == DOWN){
             if (playerpos2 <=height-50)
                   playerpos2 = playerpos2 + 8;
             }
         }
if (player1 >=6) {
    player1=5;
        background(80);

    textFont(f,46);                  // STEP 3 Specify font to be used
   text(player2+"|"+str(player1),(width/2)-50,50); 
   delay(10000);
       player1=0;
       player2=0;
 }
 if (player2 >=6) {
 player2=5;
     background(80);

        textFont(f,46);                  // STEP 3 Specify font to be used
             text(str(player2)+"|"+player1,(width/2)-50,50); 
   delay(10000);
   player1=0;
   player2=0;

 }  
         }