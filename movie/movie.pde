Utils movieUtils  = new Utils();
HColorPool colors = new HColorPool(#F01F1F, #F07E1F, #005D5D, #EDFEF6, #19C019, #9A0000, #007B00, #FFB475);

void setup() {

	size(1024, 1024);
	H.init(this).background(#303030);
	smooth();
	
	int starScale  = 1000;
	int starOffset = 60;
	int ranEdges   = round(random(8, 16));
	float ranDepth = random(0.2, 0.6);

	for (int i = 0; i < 15; i++) {

		HPath path = (HPath) H.add( new HPath().star(ranEdges, ranDepth) )
			.size(starScale)
			.noStroke()
			.fill( colors.getColor() )
			.anchorAt(H.CENTER)
			.loc(1024/2, 1024/2)
		;

		new HOscillator()
			.target(path)
			.property(H.ROTATION)
			.range(-30, 30)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;

		starScale -= starOffset;
	}
}

void draw() {
	movieUtils.save();
	H.drawStage();
}