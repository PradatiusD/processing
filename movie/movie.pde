HSwarm swarm;
HDrawablePool pool;
HTimer timer;
HColorPool colors;
Helper helper;

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();
	helper = new Helper();


	swarm = new HSwarm()
		.addGoal(width/2,height/2)
		.speed(4)
		.turnEase(0.025f)
		.twitch(3)
	;

    colors = new HColorPool()
        .add(#00defe)
        .add(#f74987)
        .add(#ddf600)
        .add(#ff0000)
        .add(#f72967)
        .add(#5188bf)
        .add(#01a3ba)
    ;

	pool = new HDrawablePool(60);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
			.size(3,6)
		)

		.colorist(colors.fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.loc(random(20, 500), random(20,500))
						.anchorAt( H.CENTER )
					;

					swarm.addTarget(d);
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
	helper.save();
}