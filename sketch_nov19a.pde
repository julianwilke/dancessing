// dancessing v0.0.1
// -----------------

int APP_SIZE_X = 800;
int APP_SIZE_Y = 800;

float POS_X = APP_SIZE_X / 2;
float POS_Y = APP_SIZE_Y / 2;

// sound detection stuff, copied from examples provided by the developer of minim
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;


boolean kickHit, snareHit, hatHit;

DancessingDancer dancer;

void setup()
{  
    debugMe( "setup executed" );
   
    // init soundsupport
    minim = new Minim(this);
    song = minim.loadFile("md01.mp3", 2048);
    song.play();
    beat = new BeatDetect( song.bufferSize(), song.sampleRate() );
    // apply damp if necessary, default is 10
    beat.setSensitivity( 10 );
    kickHit = snareHit = hatHit = false;
    bl = new BeatListener(beat, song);

    // init our dancer
    dancer_theme theme = new dancer_theme( "default_theme" );
    dancer = new DancessingDancer( theme );
   
    // init environment
    smooth();
    size( APP_SIZE_X, APP_SIZE_Y );
}

void draw()
{  
  debugMe( "draw executed" );
  background( 50 );
  
  // sound stuff
  beat.detect(song.mix);
  if ( beat.isKick() ) kickHit = true;
  if ( beat.isSnare() ) snareHit = true;
  if ( beat.isHat() ) hatHit = true;

  // draw dancer
  // this basically just passes the drawMe-callback to all of the elements the dancer is made of.
  dancer.drawMe();
  
  // render a rectangle at the center of the dancer for debug purposes
  if( DEBUG == 1 ){
    rectMode( CENTER );
    rect( POS_X, POS_Y, 10, 10 );
  }
}


void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
}
