// class that provides an interface to interact with parts of the extremities

class d_Armpiece
{
    boolean left;
    float x, y, w, h;
    dancer_theme theme;
    String type;

    PImage sprite;

    d_Armpiece(dancer_theme myTheme,
               String _type,
               boolean _leftOrient )
    {

        dancer_theme theme = myTheme;
        
        type = _type;

        left = _leftOrient;
        
        // get the sprite and compute the according positions
        // ==================================================
        if( type == "upper" ){
          if( left == false ){ 
            sprite = theme.arm_upper_right_img;
            x = POS_X + theme.torso_w / 2;
            float offset = 25;
            if( left == true ){ offset *= -1; }
            x -= offset; // offset to be variable, TODO

          } else {
            sprite = theme.arm_upper_left_img;
            x = POS_X - theme.torso_w / 2;
          }
          y = POS_Y - theme.torso_h / 2;
          y += 25; //off set to be variable,. TODO
        }
        if( type == "lower" ){
          if( left == false ){
            sprite = theme.arm_lower_right_img;
          } else {
            sprite = theme.arm_lower_left_img;
          }
        }
        if( type == "hand" ){
          if( left == false ){
            sprite = theme.arm_hand_right_img;
          } else {
            sprite = theme.arm_hand_left_img;
          }
        }

        w = sprite.width;
        h = sprite.height;;
    } 

    void drawMe()
    {
        debugMe( "drawMe in armpiece executed" );
        image( sprite, 0, 0 );
    }   
}
