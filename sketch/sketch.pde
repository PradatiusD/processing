
public HRect rollingRect (int loc) {

  HRect rectangle = new HRect(loc);

  rectangle
    .rounding(10)
    .fill(#FF6600)
    .stroke(#000000, 150)
    .strokeWeight(6)
    .anchorAt(H.CENTER)
    .rotation(loc*7.5)
    .loc(loc*5,height / 2);

  return rectangle;
}

void setup() {
  size(1280,1280);

  H.init(this).background(#242424);
  smooth();

  for(int i=1; i<15; i++){
    H.add(rollingRect(i*15));
  }

  H.drawStage();
}

void draw() {}