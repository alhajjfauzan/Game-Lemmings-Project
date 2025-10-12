PImage img;
MenuUtama menuutama;
Gameplay gameplay;
void setup() {
  size(800, 500);
  img = loadImage("dirt.jpg");
  menuutama = new MenuUtama(); 
}
void draw() {
  image(img, 0, 0, width, height);
  menuutama.draw();
}
