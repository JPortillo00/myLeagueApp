int max_h = displayHeight;
int max_w = displayWidth;
Console c;

//PGraphics pg;

void setup(){
  size(displayWidth,displayHeight);
  //size(500,600);
  //pg = createGraphics(max_h,max_w);
  orientation(PORTRAIT);
  max_h = displayHeight;
  max_w = displayWidth;  
  //rectMode(CENTER);
  //println(pg.rectMode);
  //textAlign(CENTER,CENTER);  
  c = new Console(max_w/8 + max_w/256 ,11*max_h/64,max_h/20);
  //c.deactivate();
 
  
  
  //println(c.isActive());
  //println("test");
  //println(displayHeight + " X " + displayWidth);
  //println(height/2 + " X " + width/2);
  //initChampList();

}

void draw(){ 
  
  background(0);
  for (int i = 0; i <16 ; i++){
    noFill();
    stroke(255);
    rect(i*max_w/16,0,max_w/16,max_h/16);
    rect(0,i*max_h/16,max_w/16,max_h/16);
  }
 
  searchBar();
  c.display();
  //println(c.isActive());

}

void keyPressed(){
  if (c.isActive()){
        if (keyCode >= KeyEvent.KEYCODE_A && keyCode <= KeyEvent.KEYCODE_Z || keyCode >= KeyEvent.KEYCODE_0 && keyCode <= KeyEvent.KEYCODE_9){
            c.addChar(key);
        }
        if (key == ' '){
          c.addChar(' ');
        
        }
        if (keyCode== KeyEvent.KEYCODE_DEL){
            c.deleteChar();
        }
        if (keyCode == KeyEvent.KEYCODE_ENTER){
          c.deactivate();
          KetaiKeyboard.hide(this);
        }
   }
   println(keyCode + ": " + key + " ConsoleActive: " + c.isActive());
   
}