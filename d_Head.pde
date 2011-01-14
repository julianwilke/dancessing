// provide data about the head
// ===========================

class d_Head{

  float h_size, x, y;
  PImage sprite;
  
  // construction of instance
  d_Head( dancer_theme theme ){
    h_size = 1;
    
    // compute the position of the head, this is the CENTER of the image!
    // ==================================================================
    
    // take the main center as the x-coord for the head
    x = POS_X;
    
    // for y, we need to take the main y-coord of the dancer and subtract half the height of the torso
    y = POS_Y - theme.torso_h/2;
    // add offset in y.
    y = y + 5; // to be replaced by theme-based variable, TODO
  
    sprite = theme.head_img;
  }
  
  void move( float cx, float cy ){
    x = cx + dancer.body.offset_x;
    y = cy + dancer.body.offset_y;
  }
  
  void changeSize( float data ){
    //h_size = 0.03 * sin( data ) + h_size;
  }
  
  void drawMe(){
      move(x, y);
      pushMatrix();
      // scale and use the center as pivot
      translate( x, y );
      
      // well, needs some work, TODO
      if ( beat.isRange(3, 6, 3) ){// || snareHit == true || hatHit == true ){ 
        h_size*=1.05; 
      } else{ 
        h_size = 1;
      }
      
      scale( h_size, h_size );
      imageMode( CENTER );
      // draw at 0,0 as the translate above does the positioning
      image( sprite, 0, 0 );
      imageMode( CORNER );
      popMatrix();
  }
}
