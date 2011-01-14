void debugMe( String output ){

    if( DEBUG == 1 ){
        println( output );
    }
}

class DancessingDancer{
    d_Arm leftArm, rightArm;
    d_Leg leftLeg, rightLeg;
    d_Body body;
    d_Head head;
    
    dancer_theme theme;

    DancessingDancer( dancer_theme myTheme ){

        theme = myTheme;

        body = new d_Body( theme );
        leftArm = new d_Arm( theme, true );
        rightArm = new d_Arm( theme, false );
        leftLeg = new d_Leg( theme, true );
        rightLeg = new d_Leg( theme, false );
  
        head = new d_Head( theme );
    }
    
    void drawMe(){
        body.drawMe();
        body.moveMe( 0, 1 * sin( int(frameCount / 10 ) ) );
        
        head.changeSize( frameCount / 10 );
        head.drawMe();
        
        rightArm.drawMe();
        // leftArm.drawMe();
        
        
        
        rightLeg.drawMe();
        leftLeg.drawMe();
        
    }
}


