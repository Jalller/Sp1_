class Enemy
{
  int x; 
  int y; 
  int typeOfColor = 1; 
  Player player;

  Enemy(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }


  void moveTowardsPlayer()
  {
    int rnd = (int)random(4);
    int rn2 = (int)random(4);
    for (int i = 0; i< enemies.length-1; i++) {
      if (rn2<3) {
        if (enemies[i].x<player.x) {
          enemies[i].x++;
        }
        if (enemies[i].x>player.x) {
          enemies[i].x--;
        }
        if (enemies[i].y<player.y) {
          enemies[i].y++;
        }
        if (enemies[i].y>player.y) {
          enemies[i].y--;
        }
      } else {

        switch(rnd) {
        case 0: 
          enemies[i].x++;
          break;
        case 1: 
          enemies[i].y++;
          break;
        case 2:
          enemies[i].x--;
          break;
        case 3:
          enemies[i].y--;
          break;
        }
      }
    }
  }
}
