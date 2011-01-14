import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class sketch_nov19a extends PApplet {

// dancessing v0.0.1
// -----------------


// dancer_theme theme = new dancer_theme( "default_theme" );

// DancessingDancer dancer = new DancessingDancer( theme );


// d_Arm leftArm, rightArm;

// d_Arm leftArm = new d_Arm( theme, 200, 200, 30, 5, 35, 5, 20, 40, 0 );
// d_Arm rightArm = new d_Arm( theme, 100, 200, 30, 5, 35, 5, 20, 40, 1 );
    

PImage sprite = requestImage( "/themes/default_theme/head.tga" );

public void setup()
{  
    // debugMe( "setup executed" );
    smooth();
    size( 600, 600 );
}

public void draw(){
    // debugMe( "draw executed" );
  background( 50 );
  //dancer.drawMe();

  // leftArm.drawMe();
  // rightArm.drawMe();


  image( sprite, 30, 30 );
}



public void debugMe( String output ){

    if( DEBUG == 1 ){
        println( output );
    }
}



class d_Body{

    // x and y being the pivot/center
    float x, y, w, h;

    d_Body( dancer_theme theme, float px, float py, float width, float height ){
        x = px;
        y = py;
        w = width;
        h = height;
    }

    public void moveMe( float offset_x, float offset_y ){
        x += offset_x;
        y += offset_y;
    } 

    public void drawMe(){
        rectMode( CENTER );
        rect( x, y, w, h );
        rectMode( CORNER );
    }
}



class DancessingDancer{
    d_Arm leftArm, rightArm;
    d_Arm leftLeg, rightLeg;
    d_Body body;
    d_Head head;
    
    dancer_theme theme;

    DancessingDancer( dancer_theme myTheme ){

        theme = myTheme;

        leftArm = new d_Arm( theme, 200, 200, 30, 5, 35, 5, 20, 40, 0 );
        rightArm = new d_Arm( theme, 100, 200, 30, 5, 35, 5, 20, 40, 1 );
        // leftLeg = new d_Arm( theme, 200, 400, 30, 5, 35, 5, 20, 40, 1 );
        // rightLeg = new d_Arm( theme, 100, 400, 30, 5, 35, 5, 20, 40, 0 );

        // body = new d_Body( theme, 150, 280, 100, 170 );
        // head = new d_Head( theme, 150, 150, 50, 50 );

    }
    
    public void drawMe(){
        leftArm.drawMe();
        rightArm.drawMe();
        //rightLeg.drawMe();
        //leftLeg.drawMe();
        //head.changeSize( frameCount / 10 );
        //head.drawMe();
        //body.drawMe();

    }
}


int COLOR = color( 180, 255, 180 );

float DEBUG = 0;



// FILE OPERATIONS
// ----
// ---- contains constants for the interaction with the operating system

String DATA_FOLDER = "/home/mistermatti/sketchbook/sketch_nov19a/data/";
String THEME_FOLDER = DATA_FOLDER + "themes" + get_delimiter();

// has to be either "windows" or "linux"
String OS = "linux";

String DELIM_LINUX = "/";
String DELIM_WIN = "\\";

public boolean is_win_os(){
    if( OS == "windows" ){ return true; }
    return false;
}

public boolean is_linux_os(){
    if( OS == "linux" ){ return true; }
    return false;
}

public String get_delimiter(){
    if( is_linux_os() == true ){ 
        return DELIM_LINUX; 
    } else {
        return DELIM_WIN;
    }
}
// class that gathers information about the different bits of an arm

class d_Arm
{
  // use sprite here
  
  d_Armpiece lowerArm, upperArm, hand;
  
    dancer_theme _theme;

  float ux, uy, uw, uh;
  float lx, ly, lw, lh;
  float hx, hy, hw, hh;
  
  float left;
  
  //put string in here
    d_Arm(
          dancer_theme theme,    
          float up_x, 
          float up_y, 
          float up_w, 
          float up_h, 
          float lo_w, 
          float lo_h, 
          float hand_w, 
          float hand_h,
          float leftDir )
    {  

        _theme = theme;

    ux = up_x;
    uy = up_y;
    uw = up_w;
    uh = up_h;
    
    lx = ux + uw ; 
    ly = uy;
    lw = lo_w;
    lh = lo_h;
    
    hx = ux + uw + lw;
    hy = uy;
    hw = hand_w;
    hh = hand_h;
    
    left = leftDir;

    upperArm = new d_Armpiece( _theme, "upper", ux, uy, uw, uh, leftDir );
    lowerArm = new d_Armpiece( _theme, "lower", lx, ly, lw, lh, leftDir );
    hand = new d_Armpiece( _theme, "hand", hx, hy, hw, hh, leftDir );
  }
  
  public void drawMe()
  {
  // calculate rotation
  float rotDir = 1;

    float u_rot = sin( frameCount / 5 ) * rotDir;
    float l_rot = sin( frameCount / 10 ) * rotDir; 
    float h_rot = sin( frameCount / 5 ) * rotDir;
    
    if( left == 1 ){ u_rot = 180 - u_rot; l_rot = 180 - l_rot; h_rot = 180 - h_rot; }

    // extra settings
    fill( COLOR );

    // apply transformation
    pushMatrix();
    
    // upper arm
    translate( upperArm.x, upperArm.y - ( upperArm.w * 0.5f ) );
    rotate( u_rot );
    upperArm.drawMe();
    
    // lower arm
    translate( upperArm.w, 0 );
    rotate( l_rot );
    lowerArm.drawMe();
    
    // hand
    translate( lowerArm.w, 0 );
    rotate( h_rot );
    hand.drawMe();
    
    popMatrix();  
  }
}
// class that provides an interface to interact with parts of the extremities

class d_Armpiece
{
    float left;
    float x, y, w, h;
    dancer_theme theme;
    float leftOrient;
    String type;

    PImage sprite;

    d_Armpiece(dancer_theme myTheme,
               String type_,
               float cx, 
               float cy, 
               float cw, 
               float ch,
               float leftOrient_ )
    {

        // TODO: do the left orient thing

        
        // debugMe( "called armpiece constructor" );
        dancer_theme theme = myTheme;
        
        type = type_;
        
        String source = "";

        leftOrient = leftOrient_;
        source = "";
        
        if( type == "upper" ){
            source = theme.arm_upper_right;
        }
        
        if( type == "lower" ){
            source = theme.arm_lower_right;
        }
        
        //        println( "the sprite I got is " + source );
        
        sprite = requestImage( source );

        x = cx;
        y = cy;
        w = sprite.width;
        h = sprite.height;;
    }  
        
    public String getSpriteSource(){
        debugMe( "called sprite getter" );
        String source = "";
        if( this.type == "upper" ){
            if( this.leftOrient == 0 ){
                source = theme.arm_upper_left;
            }
            else{
                source = theme.arm_upper_right;
            }
        }
        if( this.type == "lower" ){
            if( this.leftOrient == 0 ){
                source = theme.arm_lower_left;
            }
            else{
                source = theme.arm_lower_right;
            }
        }
        if( this.type == "hand" ){
            if( this.leftOrient == 0 ){
                source = theme.arm_hand_left;
            }
            else{
                source = theme.arm_hand_right;
            }
        }
        debugMe( "sprite getter" );
        return source; 
    }

    public void drawMe()
    {
        debugMe( "drawMe executed" );
        image( sprite, 0, 0 );
        
        //rect( 0, 0, 100, 5 );
    }   
}
// provide data about the head

class d_Head{

  float h_size;
  float x, y, w, h;
  float x_piv, y_piv;
  
    PImage sprite;
    
    d_Head( dancer_theme theme, float px, float py, float pw, float ph ){
    h_size = 1;
    x = px - ( pw * 0.5f );
    y = py - ( ph * 0.5f );
    x_piv = px;
    y_piv = py;
    
    String source = theme.head;
    sprite = requestImage( source );
    w = sprite.width;
    h = sprite.height;
  }
  
  public void move( float cx, float cy ){
    x = cx;
    y = cy;
  }
  
  public void changeSize( float data ){
    h_size = 0.03f * sin( data ) + h_size;
  }
  
  public void drawMe(){
      /*
      fill( COLOR );
    noStroke();
    rectMode( CENTER );
    rect( x_piv, y_piv, w * h_size, h * h_size );
    rectMode( CORNER );
      */
      pushMatrix();
      translate( x + w, y + h );
      scale( h_size, h_size );
      imageMode( CENTER );
      image( sprite, x, y );
      imageMode( CORNER );
      popMatrix();
  }
}
// class that provides data about the theme to be used.
// meant to be used for several themes so that theme-switching gets easier

class dancer_theme
{
    String name = "";
    String path = "";

    // bodyparts
    
    String head = "";
    String torso = "";
    String arm_upper_left = "";
    String arm_upper_right = "";
    String arm_lower_left = "";
    String arm_lower_right = "";
    String arm_hand_left = "";
    String arm_hand_right = "";
    String leg_upper_left = "";
    String leg_upper_right = "";
    String leg_lower_left = "";
    String leg_lower_right = "";
    String leg_foot_left = "";
    String leg_foot_right = "";

    /*

    float head_pivot_x = 0;
    float head_pivot_y = 0;
    float arm_upper_pivot_y = 0;
    float arm_upper_pivot_x = 0;
    float arm_lower_pivot_x = 0;
    float arm_lower_pivot_y = 0;
    float arm_hand_pivot_x = 0;
    float arm_hand_pivot_y = 0;
    float leg_upper_pivot_x = 0;
    float leg_upper_pivot_y = 0;
    float leg_lower_pivot_x = 0;
    float leg_lower_pivot_y = 0;
    float leg_foot_pivot_x = 0;
    float leg_foot_pivot_y = 0;

    */

    // construct the theme with values depending on the theme-name
    dancer_theme(
                 String name

                 // pivots
                 ){
        
        //path = DATA_FOLDER + "themes" + get_delimiter() + name + get_delimiter();
        
        path = "themes/default_theme/";

        head = "/themes/default_theme/head.tga";
        torso = "/themes/default_theme/torso.tga";
        arm_upper_left = "themes/default_theme/aul.tga";
        arm_upper_right = "themes/default_theme/aur.tga";
        arm_lower_left = "themes/default_theme/all.tga";
        arm_lower_right = "themes/default_theme/alr.tga";
        arm_hand_left = "themes/default_theme/ahl.tga";
        arm_hand_right = "themes/default_theme/ahr.tga";
        leg_upper_left = "themes/default_theme/lul.tga";
        leg_upper_right = "themes/default_theme/lur.tga";
        leg_lower_left = "themes/default_theme/lll.tga";
        leg_lower_right = "themes/default_theme/llr.tga";
        leg_foot_left = "themes/default_theme/lfl.tga";
        leg_foot_right = "themes/default_theme/lfr.tga";
        
    }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "sketch_nov19a" });
  }
}
