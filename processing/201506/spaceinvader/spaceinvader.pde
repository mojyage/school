PFont myFont;
//-----------player-----
int playerX = 240;
int playerY = 400;
int playerSize = 20;
//shot
int shotPx = playerX;
int shotPy = playerY;
int shotPVy = -5;
int shotPr = 7;
//flag
boolean playerFlag = true;
boolean moveLeft = false;
boolean moveRight = false;
boolean shotPFlag = false;

//-----------enemy-------
PImage img;
int enemyX = 40;
int enemyY = 30;
int enemyR = 40;
int moveEVx = 10;
int moveEVy = 30;
int moveCount = 0;
boolean enemyFlag = true;



///
int enemyX1 = 90;
int enemyY1 = 30;
int moveEVx1 = 10;
boolean enemyFlag1 = true;
///



//shot
int shotEx = enemyX;
int shotEy = enemyY;
int shotEr = 7;
int shotEVx = 0;
int shotEVy = 5;
int shotECount = 0;
boolean shotEFlag = false;


///
int shotEx1 = enemyX1;
int shotEy1 = enemyY1;
boolean shotEFlag1 = false;
///


void setup(){
    size(480,480);
    background(0);
    fill(0, 0, 0);
    smooth();
    noStroke();
    frameRate(50);
    myFont = createFont("MS Gothic", 24, true);
    img = loadImage("enemy.png");
}

//------------------------
boolean collisionCheck(int myX, int myY, int myR, int youX, int youY, int youR) {
    return (pow(myX - youX, 2) + pow(myY - youY, 2)) <= pow(myR / 2 + youR / 2, 2);
}

//-----------PLAYER--------------------------------
void playerMove(){
    if(playerFlag){
        if(moveLeft)
            playerX -= 7;
        if(moveRight)
            playerX += 7; 
        fill(255);
        ellipse(playerX, playerY, playerSize, playerSize);
    }
}

void playerShot(){
    fill(255, 0, 0);
    if(shotPFlag){
        shotPy += shotPVy;
        // atarihantei
        if(collisionCheck(shotPx, shotPy, shotPr, enemyX, enemyY, enemyR)){
            shotPFlag = false;
            enemyFlag = false;  
            shotEFlag = false;
        }
        
        
        ///
        if(collisionCheck(shotPx, shotPy, shotPr, enemyX1, enemyY1, enemyR)){
            shotPFlag = false;
            enemyFlag1 = false;  
            shotEFlag = false;
        }
        ///
        
        
        if(shotPy < 0)
            shotPFlag = false;
        ellipse(shotPx, shotPy, shotPr, shotPr);  
    }
} 
//----------------------------------------------

//-------------------ENEMY------------------------
void enemyMove() {
    if(enemyFlag){
        if (moveCount % 10 == 0) {
            enemyX += moveEVx;
            if (enemyX < 20 || 460 < enemyX){
                enemyY += moveEVy;
                enemyX -= moveEVx;
                moveEVx *= -1;
            }     
        }
        fill(0, 255, 0);
        image(img, enemyX - (enemyR / 2), enemyY - enemyR / 2, enemyR, enemyR);
    }
    
    
    ///
    if(enemyFlag1){
        if (moveCount % 10 == 0) {
            enemyX1 += moveEVx1;
            if (enemyX1 < 20 || 460 < enemyX1){
                enemyY1 += moveEVy;
                enemyX1 -= moveEVx1;
                moveEVx1 *= -1;
            }     
        }
        fill(0, 255, 0);
        image(img, enemyX1 - (enemyR / 2), enemyY1 - enemyR / 2, enemyR, enemyR);
    }
    ///
    
    
    
    if(enemyFlag || enemyFlag1){
      moveCount++;
    }
}

void enemyShot() {
    if ((shotECount = ++shotECount % 35) == 0 && enemyFlag && !shotEFlag) {
        shotEFlag = true;
        shotEx = enemyX;
        shotEy = enemyY;

    }
    
    
    ///
    if ((shotECount = ++shotECount % 35) == 0 && enemyFlag1 && !shotEFlag1) {
        shotEFlag1 = true;
        shotEx1 = enemyX1;
        shotEy1 = enemyY1;

    }
    ///
    
    
    if (shotEFlag){
        shotEy += shotEVy;
        if (collisionCheck(shotEx, shotEy, shotEr, playerX, playerY, playerSize)){
            playerFlag = false;
            shotEFlag = false;
            shotPFlag = false;
        }
        if (shotEy > 480)
            shotEFlag = false;
        ellipse(shotEx, shotEy, shotEr, shotEr);
    }
    
    
    
    ///
    if (shotEFlag1){
        shotEy1 += shotEVy;
        if (collisionCheck(shotEx1, shotEy1, shotEr, playerX, playerY, playerSize)){
            playerFlag = false;
            shotEFlag1 = false;
            shotPFlag = false;
        }
        if (shotEy1 > 480)
            shotEFlag1 = false;
        ellipse(shotEx1, shotEy1, shotEr, shotEr);
    }
    ///
}
//------------------------------------------------------

void draw(){
    background(0);
    playerMove();
    playerShot();
    enemyMove();
    enemyShot();
}

void keyPressed(){
    if(key == 'a' || keyCode == LEFT)
      moveLeft = true;
    if(key == 'd' || keyCode == RIGHT)
      moveRight = true;
    
    if(!shotPFlag && playerFlag){
      if(key == 'f' || keyCode == UP)
        shotPFlag = true;
        shotPx = playerX;
        shotPy = playerY;
    }
}

void keyReleased(){
    if(key == 'a' || keyCode == LEFT)
      moveLeft = false;
    if(key == 'd' || keyCode == RIGHT)
      moveRight = false;
}

