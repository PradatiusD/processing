// Hype Dependencies
HDrawablePool pool;
HColorPool colors;
Helper helper;

// Output configuration
boolean dev = false;          // If set to true will create file with timestamp
boolean vectorOutput = false; // If set to true will create pdf, false will create png
int pngScale = 2;             // Scale of png relative to the size()


void setup(){

    helper = new Helper();

    size(600, 600);
    H.init(this).background(#fbceab);
    smooth();

    colors = new HColorPool()
        .add(#ff4062)    // hot pink
        .add(#fe9c98, 3) // pink
        .add(#c8c9a8)
        .add(#81af9a, 6) // green
    ;

    pool = new HDrawablePool(1000);
    pool
        .autoAddToStage()
        .add(new HShape("vectors.svg"))
        .layout (
            new HGridLayout()
            .startX(21)
            .startY(21)
            .spacing(26,26)
            .cols(24)
        )
        .onCreate(
            new HCallback(){
                public void run (Object obj) {
                    HShape d = (HShape) obj;
                    d
                        .enableStyle(false)
                        .strokeWeight(0)
                        .scale(2.5)
                    ;
                    d.randomColors(colors.fillOnly());
                }
            }
        )
        .requestAll()
    ;

    helper.save();
    noLoop();
}

void draw(){
    H.drawStage();
}