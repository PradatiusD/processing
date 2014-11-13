HShape s;
HColorPool colors;


void setup(){
	size(600, 600);
	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool()
		.add(#FFFFFF)
		.add(#F7F7F7)
		.add(#ECECEC)
		.add(#333333)
		.add(#0095a8)
		.add(#00616f)
		.add(#ff3300)
		.add(#ff6600)
	;

	for (int i = 0; i < 100; ++i) {
		s = new HShape("vectors.svg");
		s
			.enableStyle(false)
			.strokeWeight(0)
			.fill(colors.getColor())
			.size((int)random(25,125))
			.rotate((int)random(360))
			.loc((int)random(width), (int)random(height))
			.anchorAt(H.CENTER)
		;
		H.add(s);
	}
	H.drawStage();
	saveFrame("render.png");
}