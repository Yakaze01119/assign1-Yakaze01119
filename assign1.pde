float soldierX = 0;
float soldierY = 200;

float robotX = 160;
float robotY = 160;

float shootX = 0;
float shootY = 0;
float shootWidth = 0;
float shootWidthX = 0;
float shootIchi = 0;

PImage bg, soil, life;
PImage groundhog, robot, soldier;

void setup() {
	size(640, 480);

  // IMAGE
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  // SANSU
  soldierY = soldierY + 80 * floor(random(0,4));
  robotX += floor(random(0,400));
  robotY = robotY + 80 * floor(random(0,4));
  shootX = robotX + 25;
  shootY = robotY + 32;
}

void draw() {
  imageMode(CORNER);
  background(bg);
  colorMode(RGB);
  
  // LIFE
  image( life, 10,10);
  image( life, 80,10);
  image( life, 150,10);
  
  // SUN
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  // CHI
  image( soil, 0,160);
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
  
  // GROUNDHOG
  image( groundhog, 275,80);
  
  // ROBOT
  image( robot , robotX , robotY);
  
  // SHOOT
  fill(255,0,0);
  rect( shootX , shootY , shootWidth ,10,5);
  shootWidthX += 2;
  shootWidthX %= 180;
  shootWidth = 40*sin(radians(shootWidthX));
  shootX = max( robotX - 160 , shootX - 2 );
  
  // SOLDIER
  imageMode(CENTER);
  image( soldier , soldierX , soldierY );
  soldierX += 4;
  soldierX %= 720;
}
