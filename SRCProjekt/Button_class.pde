class Button{
  float x;
  float y;
  float w;
  float h;
  String buttonText;
  color buttonColor;
  color textButtonColor;
  float buttonTextSize;
  
  Button(float x_, float y_, float w_, float h_, String buttonText_, color buttonColor_, color textButtonColor_, float buttonTextSize_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    buttonText = buttonText_;
    buttonColor = buttonColor_;
    textButtonColor = textButtonColor_;
    buttonTextSize = buttonTextSize_;
  }
  
  void display(){
    rectMode(CENTER);
    textAlign(CENTER);
    fill(buttonColor);
    rect(x, y, w, h, 5);
    fill(textButtonColor);
    textSize(buttonTextSize);
    text(buttonText, x, (y + 7));
    rectMode(LEFT);
    textAlign(LEFT);
  }
  
  boolean isClicked(){
    if(mouseX >= (x - (w/2)) && mouseX <= (x + (w/2)) && mouseY >= (y - (h/2)) && mouseY <= (y + (h/2))){
      return true;
    } else{
      return false;
    }
  }
}
