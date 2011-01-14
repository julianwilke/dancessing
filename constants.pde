color COLOR = color( 180, 255, 180 );

float DEBUG = 0;

// FILE OPERATIONS
// ----
// ---- contains constants for the interaction with the operating system

 // String DATA_FOLDER = "/home/mistermatti/sketchbook/sketch_nov19a/data/";
 // String THEME_FOLDER = DATA_FOLDER + "themes" + get_delimiter();

// has to be either "windows" or "linux"
String OS = "linux";

boolean is_win_os(){
    if( OS == "windows" ){ return true; }
    return false;
}

boolean is_linux_os(){
    if( OS == "linux" ){ return true; }
    return false;
}

String get_delimiter(){

    String DELIM_LINUX = "/";
    String DELIM_WIN = "\\";
  
    if( is_linux_os() == true ){ 
        return DELIM_LINUX; 
    } else {
        return DELIM_WIN;
    }
}
