import ketai.ui.*;
import processing.core.PApplet;
import android.view.KeyEvent;

class Console{
    float x;
    float y;
    String chars;
    String cursor;
    int numChars;
    boolean active;
    boolean blink;
    int font;
   
    
    Console(float x, float y, int font){
        this.x = x;
        this.y = y;
        active = false;
        blink = true;
        this.font = font;
        chars = "";
        cursor = "|";
        numChars = 0;
        
    }
        
    void display(){
        fill(0);
        stroke(0);
        //line(x,y,x,y+font);
        textSize(font);
        if(frameCount % 30 == 0 && active){
          blink = !blink;
        }
        if(active){
          if(blink){
            text(chars,x,y);
          }else{
            text(chars + cursor,x,y);
          }
        }else{
           text(chars,x,y);        
        }
        
        
    }
    
    void addChar(char c){
      chars += c;
       numChars++;
    }
    
    String readString(){
        return chars;
    }
    
    boolean isActive(){
        return active;
    }
    
    void toggle(){
      active = !active;
    
    }
    
    void activate(){
      active = true;      
    }
    
    void deactivate(){
      active = false;
    }
    
    void reset(){
        chars = "";
    }
    
    void deleteChar(){
            if (numChars > 0){        
                  chars = chars.substring(0,chars.length()-1);
                  numChars -= 1;
            }
    }}