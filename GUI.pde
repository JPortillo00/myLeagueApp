
 void searchBar(){
    fill(255);
    rect(max_w/8,max_h/8,6*max_w/8,max_h/16);
 
    }
void mousePressed(){
  //Searchbar interactivity
    if (mouseX >= max_w/8 && mouseX<= 7*max_w/8 && mouseY >= max_h/8 && mouseY <= 3*max_h/16){
      KetaiKeyboard.toggle(this);
      c.toggle();
    }else{
      KetaiKeyboard.hide(this);
      c.deactivate();
    }
  
}