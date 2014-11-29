Helper helper;
float otherCounter = 640;
float counter = 0;
HColorPool colors;
color shapeFill, shapeStroke;

// Output configuration
boolean saveMovie = true;  // If set to true will save 300 frames in png format

void setup() {
	helper = new Helper();
	size(640, 640);
	H.init(this).background(#000000);
	smooth();

	float opacity = 0.1;

	int a = parseInt(0.8*255);

	colors = new HColorPool(
		 color(102,187,62,  a)
		,color(199,217,140, a)
		,color(193,115,68,  a)
		,color(51,38,115,   a)
		,color(124,106,205, a)
		,color(186,207,232, a)
		,color(133,182,214, a)
		,color(19,57,54,    a)
	);
}

void draw() {

	shapeFill = colors.getColor();
	shapeStroke = colors.getColor();

	boolean x = true;


	if (counter < 100) {

		counter++;

		HPath s = new HPath().star(5, 5);

		s
			.anchorAt(H.CENTER)
			.fill(shapeFill)
			.stroke(shapeStroke)
			.rotate(counter*3)
			.strokeWeight(3)
			.scale(counter/8)
			.loc(height/2,width/2)
		;

		x = false;

		H.add(s);


	} else {

		otherCounter = otherCounter / 1.1;

		HRect s = new HRect((otherCounter) % 600).rounding(300);

		s
			.anchorAt(H.CENTER)
			.fill(shapeFill)
			.stroke(shapeStroke)
			.strokeWeight(3)
			.rotate(otherCounter*2)
			.loc(height/2,width/2)
		;

		H.add(s);

	}


	H.drawStage();
	helper.save();
}