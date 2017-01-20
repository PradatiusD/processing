// Output configuration

Utils util = new Utils();

HDrawablePool pool = new HDrawablePool(576);
HColorPool  colors = new HColorPool()
    .add(#499E16, 9)
    .add(#2EC3FF, 9)
    .add(#FFBC3D, 9)
    .add(#CC3C34, 9)
    .add(#771FB2, 9)
;

int canvasSize    = 1024;
int columns       = 5;
float columnWidth = canvasSize/columns;


void setup(){

    size(1024, 1024);
    H.init(this).background(#262626);
    smooth();

    pool.autoAddToStage()
        .add (
            new HShape("vectors.svg")
            .enableStyle(false)
            .noStroke()
        )

        .layout (
            new HGridLayout()
            .startX(-10)
            .spacing(columnWidth, columnWidth)
            .cols(columns)
        )

        .onCreate (
             new HCallback() {
                public void run(Object obj) {

                    HShape d = (HShape) obj;

                    d
                        .fill(colors.getColor())
                        .scale(0.6f)
                    ;
                }
            }
        )

        .requestAll()
    ;

    /* End writing visualization code */

    util.save();
    noLoop();
}

void draw(){
    H.drawStage();
}

// processing-java --force --sketch=/Users/dprada/GitHub/processing/still --output=/Users/dprada/GitHub/processing/still/build-tmp --run