int size = 40;
int[][] grid = new int[25][25];
PFont font;
Player player;
int numberOfEnemies = 6;
int numberOfPoints = 6;

Enemy[] enemies = new Enemy[numberOfEnemies];
Points[] points = new Points[numberOfPoints];


void setup()
{
  frameRate(5);
  size(1001, 1001);
  player = new Player(5, 4);
  for (int i =0; i<enemies.length-1; i++) { 
    enemies[i] = new Enemy(3+i, 3+i, player);
  }

  for (int i =0; i<points.length-1; i++) { 
    points[i] = new Points(5+i, 5+i, player);
  }
}

void draw()
{
  
  //startScreen();
  clearBoard();
  updateEntities();
  drawBoard();
  
}

void clearBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}

void drawBoard()
{

  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      if (player.health<=numberOfEnemies) {
        printGameover();
        gameOverScreen();
      }
      if (player.playerPoints>=player.maxPoints) {
        printWhoWins();
      }
      fill(255);
      font = createFont("Arial", 20, true);
      textFont(font, 20);
      text("Points: "+player.playerPoints, 20, 45);
      text("Health: "+player.health, 20, 25); 
      stroke(0);
      fill(getColorFromType(grid[x][y]));
      rect(x * size, y * size, size, size);
    }
  }
}

void updateEntities()
{
  noOutOfBoundsPlayer();
  grid[player.x][player.y] = player.typeOfColor;
  player.takeDamage();
  player.getPoints();


  for (int i =0; i<points.length-2; i++) {
    noOutOfBoundsPoints();
    grid[points[i].x][points[i].y] = points[i].typeOfColor;
    points[i].moveAwayFromPlayer();
  }

  for (int i =0; i<enemies.length-2; i++) {
    noOutOfBoundsEnemy();
    grid[enemies[i].x][enemies[i].y] = enemies[i].typeOfColor;
    enemies[i].moveTowardsPlayer();
  }
}



color getColorFromType(int typeOfColor) 
{
  color c = color(255);

  switch(typeOfColor)
  {
  case 0: 
    c = color(127);
    break;
  case 1: 
    c = color(255, 0, 0);
    break;
  case 2: 
    c = color(0, 255, 0);
    break;
  case 3: 
    c = color(0, 0, 255);
    break;
  case 4: 
    c = color (0, 255, 255);
    break;
  }    

  return c;
}

void noOutOfBoundsPlayer() {
  if (player.x<=0) {
    player.x=0;
  }
  if (player.x>=grid.length) {
    player.x=grid.length-1;
  }
  if (player.y<=0) {
    player.y=0;
  }
  if (player.y>=grid.length) {
    player.y=grid.length-1;
  }
}

void noOutOfBoundsEnemy() {
  for (int i = 0; i<enemies.length-1; i++) {
    if (enemies[i].x<=0) {
      enemies[i].x=i;
    }
    if (enemies[i].x>=grid.length) {
      enemies[i].x=grid.length-1;
    }
    if (enemies[i].y<=0) {
      enemies[i].y=i;
    }
    if (enemies[i].y>=grid.length) {
      enemies[i].y=grid.length-1;
    }
  }
}

void noOutOfBoundsPoints() {
  for (int i = 0; i<points.length-1; i++) {
    if (points[i].x<=0) {
      points[i].x=0;
    }
    if (points[i].x>=grid.length) {
      points[i].x=grid.length-1;
    }
    if (points[i].y<=0) {
      points[i].y=0;
    }
    if (points[i].y>=grid.length) {
      points[i].y=grid.length-1;
    }
  }
}


void keyPressed()
{
  if (key == 'w')
  {
    player.y--;
  }
  if (key == 'a')
  {
    player.x--;
  }
  if (key == 's')
  {
    player.y++;
  }
  if (key == 'd')
  {
    player.x++;
  }
}
void printGameover() {
  fill(255);
  font = createFont("Arial", 50, true);
  textFont(font, 50);
  text("Gameover: ", 100, 100);
  println("Gameover");
}
void printWhoWins() {
  fill(255);
  font = createFont("Arial", 50, true);
  textFont(font, 50);
  text("You Win: ", 100, 100);
  println("You Win");
}

void gameOverScreen() {
  background(255, 0, 0);
  fill(255);
  font = createFont("Arial", 50, true);
  textFont(font, 50);
  text("Gameover: ", 100, 100);
}
void startScreen() {
  background(0,255,0);
  font = createFont("Arial", 50, true);
  textFont(font,50);
  text("Welcome: press enter to start game",0,height/2);
}
