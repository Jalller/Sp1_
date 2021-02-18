class Points
{
  int x; 
  int y; 
  int typeOfColor = 1; 
  Player player;

  Points(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  //void moveAwayFromPlayer()
  //{
  // if (points.x>player.x) {
  //   points.x++;
  // }
  // if(points.x<player.x) {
  //   points.x--;
  // }
  // if (points.y>player.y) {
  //   points.y++;
  // }
  // if (points.y<player.y) {
  //   points.y--;
  // }
  //}

  void moveAwayFromPlayer()
  {
    int rnd = (int)random(4);
    int rn2 = (int)random(4);
    for (int i = 0; i< points.length-1; i++) {
      if (rn2<3) {

        if (points[i].x>player.x) {
          points[i].x++;
        }
        if (points[i].x<player.x) {
          points[i].x--;
        }
        if (points[i].y>player.y) {
          points[i].y++;
        }
        if (enemies[i].y<player.y) {
          points[i].y--;
        }
      } else {

        switch(rnd) {
        case 0: 
          points[i].x++;
          break;
        case 1: 
          points[i].y++;
          break;
        case 2:
          points[i].x--;
          break;
        case 3:
          points[i].y--;
          break;
        }
      }
    }
  }
}
