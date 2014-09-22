// Class dependent variables
HDrawablePool pool;

// Color vars
color teal = #00BEEB;
color lighterTeal = #9BE6F8;

void setup () {
  size(640, 640);
  H.init(this).background(teal);
  smooth();

  HRect square = new HRect(100);

  H.add(square)
    .anchorAt(H.CENTER)
    .fill(lighterTeal)
    .loc(320,320)
    .stroke(lighterTeal, 10)
  ;

  new HRotate(square, 1);

  HText headerText = new HText("2urning", 100);

  headerText.fill(lighterTeal).anchorAt(H.CENTER).loc(width/2, height*0.25);

  H.add(headerText);

}

void draw() {
  H.drawStage();
}