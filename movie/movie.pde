HSwarm swarm;
HDrawablePool pool;
HTimer timer;
HColorPool colors;

Helper helper;

// Output configuration
boolean saveMovie = false;  // If set to true will save 300 frames in jpg format

void setup() {
	size(640,640);
	H.init(this).background(#fbceab);
	smooth();
	helper = new Helper();


	swarm = new HSwarm()
		.addGoal(H.mouse())
		.speed(4)
		.turnEase(random(0.0025, 0.025))
		.twitch(1)
	;

    colors = new HColorPool()
        .add(#ff4062)    // hot pink
        .add(#fe9c98, 3) // pink
        .add(#c8c9a8)
        .add(#81af9a, 5) // green
    ;

	pool = new HDrawablePool(250);
	pool.autoAddToStage()
		.add(new HShape("vectors.svg"))
		.colorist(colors.fillOnly())

		.onCreate (
            new HCallback(){
                public void run (Object obj) {
                    HShape d = (HShape) obj;
                    d
                        .enableStyle(false)
                        .strokeWeight(0)
                        .scale(random(2.5,12.5))
                    ;
                    d.randomColors(colors.fillOnly());
                    swarm.addTarget(d);
                }
            }
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive())
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