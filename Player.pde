class Player
{
  int x; 
  int y; 
  int typeOfColor = 3; 
  int health; 
  int playerPoints;
  int maxPoints;

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    health = 100;
    maxPoints = 100;
  }

  void takeDamage()
  {
    if (player.health<=1) {
      println("Gameover");
      noLoop();
    }
    for (int i =0; i<enemies.length-1; i++) {
      if (player.x==enemies[i].x && player.y==enemies[i].y) {
        enemies[i].x=50; //When collision, move enemies
        enemies[i].y=50;
        println("Player health: " + health);
        health--;
      }
    }
  }

  void getPoints()
  {

    if (playerPoints>=maxPoints-1) {
      println("You win");
      noLoop();
    }
    for (int i =0; i<points.length-1; i++) {
      if (player.x==points[i].x && player.y==points[i].y) {
        points[i].x=50; //When collision, move points
        points[i].y=50;
        println("Player points: " + playerPoints);
        playerPoints++;
      }
    }
  }
}
