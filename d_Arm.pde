// class that gathers information about the different bits of an arm

// todo
// implement the left-side thang


class d_Arm
{
  d_Armpiece lowerArm, upperArm, hand;
  dancer_theme theme;
  boolean left;
  
  // rotations of the individual bits
  /*
  float u_rot = sin( frameCount / 5 ) * rotDir;
  float l_rot = sin( frameCount / 10 ) * rotDir; 
  float h_rot = sin( frameCount / 5 ) * rotDir;
  */
  
  // start values need to be something decent
  float u_rot = 50;
  float l_rot = 0;  
  float h_rot = 0;
  
  // save the dance-mode here
  float style = 0;
  float styleChangeSpeed = 100;
  
  // construct the Arm
  d_Arm( dancer_theme _theme, boolean _left )
  { 
  
  left = _left;
  theme = _theme;

  upperArm = new d_Armpiece( _theme, "upper", left );
  lowerArm = new d_Armpiece( _theme, "lower", left );
  hand = new d_Armpiece( _theme, "hand", left );
  }
  
  void exec_robo_dance(){
    // define a dance-style
    // have poses being generated randomly and switched once the change_event occurs
    // in our case the change_event is a trigger from sound
    if ( beat.isRange(3, 6, 3) ){
      // we need to define a new pose the robot can adopt
      u_rot = random( 0, 50 );
      l_rot = random( 0, 50 );
      h_rot = random( 0, 50 );
    }
  }
  
  void exec_fluent_dance( float a, float b, float c){
    // define a dance-style
    // have the dancer fluently change his dance accoring to triggers in the music
    
    u_rot += a;
    l_rot += b;
    h_rot += c;
    
  }
  
  void drawMe(){
    // implement a couple versions of dancing that we can switch between
    // void exec_robo_dance()
    // void exec_fluent_dance()
    // these just set the values that further on are used to draw the data on screen

    // every x frames we allow a change of the dance-style
    if( frameCount % styleChangeSpeed == 0 ){
      style = int( random( 2 ) );
      // println( "style is " + style );
    }
    
    if( style == 0 ){ // do the robot
      exec_robo_dance();
    }
    if( style == 1 ){ // do the fluent dance
      exec_fluent_dance( random(0.1), random(0.1), random(0.1));
    }
    // More to be added
  
    // apply transformation according to the arm-hierarchie
    // ====================================================
    pushMatrix();
    
    // upper arm
    translate( upperArm.x, upperArm.y );
    rotate( u_rot );
    if( DEBUG == 1 ){
      rect( 0,0,10,10 );
    }
    upperArm.drawMe();
    
    // lower arm
    translate( upperArm.w, 0 );
    rotate( l_rot );
    if( DEBUG == 1 ){
      rect( 0,0,10,10 );
    }
    lowerArm.drawMe();
    
    // hand
    translate( lowerArm.w, 0 );
    rotate( h_rot );
    if( DEBUG == 1 ){
      rect( 0,0,10,10 );
    }
    hand.drawMe();
    
    popMatrix();  
  }
}
