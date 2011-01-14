class d_Leg
{
  dancer_theme theme;
  
  // define the core positions of the leg
  // these are the hip-attachment and the ground
  float hip_x, hip_y;
  float ground_x, ground_y;
  
  float side_fac = 1;
  
  // variable positions, mainly the knee area so far
  // float knee_x, knee_y;
  
  // rotations for the leg
  float upper_rot, lower_rot;
  
  // difference-vector for hip and ground
  PVector dif_vec;
  
   // construct the Leg
  d_Leg( dancer_theme _theme, boolean _left ) {  
    
    theme = _theme;
    
    if( _left ){ side_fac = -1; }
    // from the info about the sprites we can get from the theme we can define the length of the leg etc.
    hip_x = POS_X + ( theme.torso_w /2 * side_fac );
    hip_y = POS_Y + theme.torso_h/2;
    
    // compute ground positions
    // the width of the images define the lenght of the according part of the leg
    println( "widthn stuff " + theme.leg_upper_right_img.width );
    ground_y = POS_Y + theme.leg_upper_right_img.width + theme.leg_lower_right_img.width + theme.torso_img.height;// + theme.leg_upper_right_img.width / 2 + theme.leg_lower_right_img.width;
    ground_x = hip_x + ( 20 * side_fac ); // make this a variable offset, TODO
    
    // init the dif_vec
    dif_vec = new PVector( ground_x - hip_x, ground_y - hip_y );
    
    // to compute the rotations we need slightly more math.
    // put into extra function for readability
    leg_calc_rotations();
    
  }
  
  void drawMe(){
  
    rect( ground_x, ground_y, 30, 10 );
    
    debugMe( "draw for leg exec" );    
    
    // calc the new dif vec between ground and hip
    // dif_vec.x = ground_x - ( hip_x + dancer.body.offset_x );
    // dif_vec.y = ground_x - ( hip_y + dancer.body.offset_y );
    
    rect( hip_x - dancer.body.offset_x, hip_y - dancer.body.offset_y, 20, 20 );
    
    dif_vec.x += 4 * sin( frameCount/10 ); 
    
    
    // recalc the rotations
    leg_calc_rotations();
    
    pushMatrix();
    
    // apply the transformations to the transformation stack
    // =====================================================
    
    // upperleg
    translate( hip_x * side_fac, hip_y );
    
    if( DEBUG == 1 ){
      rect( 0, 0, 20, 20 );
    }
    
    // translate( theme.leg_upper_right_img.height * 0.5, 0 );
    rotate( upper_rot );
    image( theme.leg_upper_right_img, 0, 0 );
    
    
    translate( theme.leg_upper_right_img.width, 0 );
    fill( 255, 0, 0 );
    ellipse( 0,0, 20, 20 );
    rotate( lower_rot );
    image( theme.leg_lower_right_img, 0, 0 );
    translate( theme.leg_foot_right_img.width, 0 );
    
    if( DEBUG == 1 ){
      rect( 0,0, theme.leg_upper_right_w, theme.leg_upper_right_h );
    }  
    popMatrix(); 
    
    // render the feet onto the canvas.
    // simply use the precalculated groundpositions for that.
    pushMatrix();
    translate( ground_x, ground_y );
    rotate( PI );
    // image( theme.leg_foot_left_img, 0, 0 );
    popMatrix();
    /*
    // lowerleg
    translate( theme.leg_upper_right_w, 0 );
    rotate( lower_rot );
    rect( 0, 0, theme.leg_lower_right_w, theme.leg_lower_right_h );
    
    
    
    // foot
    rect( 0,0, theme.leg_upper_right_w, theme.leg_upper_right_h );
    */
  
  }
  
  void leg_calc_rotations(){
    
    upper_rot = 60;
    lower_rot = 30;
    
    // rename things to make the math more readable
    float a, b, c;
    a = theme.leg_upper_right_img.width;
    b = theme.leg_lower_right_img.width;
    c = dif_vec.mag();
    // we might need to check this for min(c, a+b)
    
    float B = acos( ( b*b - a*a - c*c ) / ( -2*a*c ) ); // should be the angle opposite of b, hip_angle
    float C = acos( ( c*c - a*a - b*b ) / ( -2*a*b ) ); // should be the angle opposite of c, knee_angle
    println ( "B: " + B + "  C: " + C );
    
    upper_rot = B;
    lower_rot = C;
    
    /*
    
    // we use the law of cosine to get the first angle:
    //        c^2 = a^2 + b^2 - 2ab*cos(gamma)
    // gamma being the angle we want to compute 
    
    // a = upper leg
    // b = difference-vector between hip and ground
    // c = lower leg
    
    // rename things to make the math more readable
    float a, b, c;
    a = theme.leg_upper_right_w;
    b = dif_vec.mag();
    c = theme.leg_lower_right_w;
    
    // we need  the rotation for the upperleg, which is gamma in the above case.
    // rewrite the formula to match our requirements:
    // gamma = arccos( ( a^2+b^2-c^2 )  /  ( 2ab ) )
    upper_rot = ( sq( a ) + sq( b ) - sq( c ) ) / ( 2*a*b );
    println( "UPPER ROT: " + upper_rot );
    // if( upper_rot <= 0 ){ upper_rot = 20; } 
    
    // to get the lower rot we use the law of sines:
    // a/sin(alpha) = b/sin(beta) = c/sin(gamma)
    // beta is the angle of the knee which we still need:
    lower_rot = acos( ( sin( upper_rot )/ c ) * b );
    
    */
    
  }
}
