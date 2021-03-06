float soldierX = 0;
float soldierY = 200;

float robotX = 160;
float robotY = 160;

float shootX;
float shootY;
float shootP = 0;
float shootWidth = 40;
float shootSpeed = 2;

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
  imageMode(CORNERS);
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
  rect( shootX , shootY , shootP ,10,5);
  shootX -= shootSpeed;
  shootP += shootSpeed;
  if(shootP >= shootWidth){
    shootP = shootWidth;
  }
  if(shootX < robotX - 160 + 25){
    shootX = robotX + 25;
    shootP = 0;
  }

  
  // SOLDIER
  imageMode(CENTER);
  image( soldier , soldierX , soldierY );
  soldierX += 4;
  soldierX %= 720;
}
