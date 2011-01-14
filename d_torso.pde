// provide data about the torso
// ============================

class d_Body{

    // x and y being the pivot/center
    float x, y, w, h;
    PImage sprite;
    
    float offset_x, offset_y;

    d_Body( dancer_theme theme ){
        
        // we assume that we get the main position of this thing from the global data in the main file
        // namely: POS_X, POS_Y
        x = POS_X;
        y = POS_Y;
        
        sprite = theme.torso_img;
        w = theme.torso_w;
        h = theme.torso_h;    
    }

    void moveMe( float _offset_x, float _offset_y ){
        x += offset_x;
        y += offset_y;
        
        offset_x = _offset_x;
        offset_y = _offset_y;     
    } 

    void drawMe(){
        imageMode( CENTER );
        //image( sprite, x, y );
        image( sprite, x, y );
        imageMode( CORNER );
    }
}


