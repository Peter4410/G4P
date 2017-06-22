class Label {

  float x, y, w, h;
  String text;
  boolean add;

  Label(float x_, float y_, float w_, float h_, String text_, boolean add_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
    add = add_;
  }

  void show() {
    stroke(0);
    fill(0, 100, 60, 75);
    if (add)fill(128, 100, 60, 75);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
  }

  boolean mouseOver() {
    float mx = mouseX - 50;
    float my = mouseY - 50;
    boolean overX = (x<=mx && mx<=x+w);
    boolean overY = (y<=my && my<=y+h);
    return overX && overY;
  }
}