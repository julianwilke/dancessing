// class that provides data about the theme to be used.
// meant to be used for several themes so that theme-switching gets easier

class dancer_theme
{
    String name = "";
    String path = "";

    // bodyparts
    // =========
    String head_src = "";
    PImage head_img;
    float head_w = 0;
    float head_h = 0;    
    
    String torso_src = "";
    PImage torso_img;
    float torso_w = 0;
    float torso_h = 0;    
    
    String arm_upper_left_src = "";
    PImage arm_upper_left_img;
    float arm_upper_left_w = 0;
    float arm_upper_left_h = 0; 
    
    String arm_upper_right_src = "";
    PImage arm_upper_right_img;
    float arm_upper_right_w = 0;
    float arm_upper_right_h = 0;

    String arm_lower_left_src = "";
    PImage arm_lower_left_img;
    float arm_lower_left_w = 0;
    float arm_lower_left_h = 0; 
    
    String arm_lower_right_src = "";
    PImage arm_lower_right_img;
    float arm_lower_right_w = 0;
    float arm_lower_right_h = 0;
    
    String arm_hand_left_src = "";
    PImage arm_hand_left_img;
    float arm_hand_left_w = 0;
    float arm_hand_left_h = 0; 
    
    String arm_hand_right_src = "";
    PImage arm_hand_right_img;
    float arm_hand_right_w = 0;
    float arm_hand_right_h = 0;
    
    String leg_upper_left_src = "";
    PImage leg_upper_left_img;
    float leg_upper_left_w = 0;
    float leg_upper_left_h = 0; 
    
    String leg_lower_left_src = "";
    PImage leg_lower_left_img;
    float leg_lower_left_w = 0;
    float leg_lower_left_h = 0; 
    
    String leg_upper_right_src = "";
    PImage leg_upper_right_img;
    float leg_upper_right_w = 0;
    float leg_upper_right_h = 0; 
    
    String leg_lower_right_src = "";
    PImage leg_lower_right_img;
    float leg_lower_right_w = 0;
    float leg_lower_right_h = 0; 
    
    String leg_foot_right_src = "";
    PImage leg_foot_right_img;
    float leg_foot_right_w = 0;
    float leg_foot_right_h = 0; 
    
    String leg_foot_left_src = "";
    PImage leg_foot_left_img;
    float leg_foot_left_w = 0;
    float leg_foot_left_h = 0; 

    // construct the theme with values depending on the theme-name
    dancer_theme( String _name ){
        
      name = _name;
                 
      String path = "themes" + get_delimiter() + name + get_delimiter(); // get_delimiter() + 
      
      // data for HEAD
      head_src = path + "head.tga";
      head_img = loadImage( head_src );
      head_w = head_img.width;  
      head_h = head_img.height;
      
      // data for TORSO
      torso_src = path + "torso.tga";
      torso_img = loadImage( torso_src );
      torso_w = torso_img.width;
      torso_h = torso_img.height;
      
      // data for the UPPER ARMS
      // TODO, add assert for image sources
      arm_upper_left_src = path + "aul.tga";
      arm_upper_left_img = loadImage( arm_upper_left_src );
      arm_upper_left_w = arm_upper_left_img.width;
      arm_upper_left_h = arm_upper_left_img.height;
      
      arm_upper_right_src = path + "aur.tga";
      arm_upper_right_img = loadImage( arm_upper_right_src );
      arm_upper_right_w = arm_upper_right_img.width;
      arm_upper_right_h = arm_upper_right_img.height;
      
      arm_lower_left_src = path + "all.tga";
      arm_lower_left_img = requestImage( arm_lower_left_src );
      arm_lower_left_w = arm_lower_left_img.width;
      arm_lower_left_h = arm_lower_left_img.height;
      
      arm_lower_right_src = path + "alr.tga";
      arm_lower_right_img = requestImage( arm_lower_right_src );
      arm_lower_right_w = arm_lower_right_img.width;
      arm_lower_right_h = arm_lower_right_img.height;
  
      arm_hand_left_src = path + "ahl.tga";
      arm_hand_left_img = requestImage( arm_hand_left_src );
      arm_hand_left_w = arm_hand_left_img.width;
      arm_hand_left_h = arm_hand_left_img.height;
      
      arm_hand_right_src = path + "ahr.tga";
      arm_hand_right_img = requestImage( arm_hand_right_src );
      arm_hand_right_w = arm_hand_right_img.width;
      arm_hand_right_h = arm_hand_right_img.height;
      
      leg_upper_right_src = path + "lur.tga";
      leg_upper_right_img = requestImage( leg_upper_right_src );
      leg_upper_right_w = leg_upper_right_img.width;
      leg_upper_right_h = leg_upper_right_img.height;
      
      leg_upper_left_src = path + "lul.tga";
      leg_upper_left_img = requestImage( leg_upper_left_src );
      leg_upper_left_w = leg_upper_left_img.width;
      leg_upper_left_h = leg_upper_left_img.height;
      
      leg_lower_right_src = path + "llr.tga";
      leg_lower_right_img = requestImage( leg_lower_right_src );
      leg_lower_right_w = leg_lower_right_img.width;
      leg_lower_right_h = leg_lower_right_img.height;
      
      leg_lower_left_src = path + "lll.tga";
      leg_lower_left_img = requestImage( leg_lower_left_src );
      leg_lower_left_w = leg_lower_left_img.width;
      leg_lower_left_h = leg_lower_left_img.height;

      leg_foot_right_src = path + "sr.tga";
      leg_foot_right_img = requestImage( leg_foot_right_src );
      leg_foot_right_w = leg_foot_right_img.width;
      leg_foot_right_h = leg_foot_right_img.height;
      
      leg_foot_left_src = path + "sl.tga";
      leg_foot_left_img = requestImage( leg_foot_left_src );
      leg_foot_left_w = leg_foot_left_img.width;
      leg_foot_left_h = leg_foot_left_img.height;
        
    }
}
