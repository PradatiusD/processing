Utils movieUtils  = new Utils();
HColorPool colors = new HColorPool(#DC2F39, #A0798C, #AF6677, #829EB5, #918BA0);

void setup() {

	size(1024, 1024);
	H.init(this).background(#DFDFDF);
	smooth();
	
	int starScale  = 1800;
	int starOffset = 100;
	int ranEdges   = round(random(8, 16));
	float ranDepth = random(0.2, 0.6);

	for (int i = 1; i <= 6; i++) {

    HShape shape = new HShape("nestedstars-0"+i+".svg");

    shape
      .enableStyle(false)
      .noStroke()
      .fill(colors.getColor())
      .anchorAt(H.CENTER)
      .loc(1024/2, 1024/2)
    ;

		HShape path = (HShape) H.add(shape);

		new HOscillator()
			.target(path)
			.property(H.ROTATION)
			.range(-30, 30)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;
	}
}

void draw() {
	movieUtils.save();
	H.drawStage();
}