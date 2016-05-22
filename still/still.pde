// Output configuration

Utils util = new Utils();

HDrawablePool pool = new HDrawablePool(576);
HColorPool colors  = new HColorPool()
    .add(#28ABE3, 9)
    .add(#1FDA9A, 9)
    .add(#E8B71A, 9)
    .add(#DB3340, 3)
;

int canvasSize    = 1024;
int columns       = 10;
float columnWidth = canvasSize/columns;


void setup(){

    size(1024, 1024);
    H.init(this).background(#F7EAC8);
    smooth();

    /* Begin writing visualization code */

    pool.autoAddToStage()
        .add (
            new HShape("vectors.svg")
            .enableStyle(false)
            .noStroke()
        )

        .layout (
            new HGridLayout()
            .startX(25)
            .spacing(columnWidth, columnWidth)
            .cols(columns)
        )

        .onCreate (
             new HCallback() {
                public void run(Object obj) {

                    HDrawable d = (HDrawable) obj;

                    d
                        .fill(colors.getColor())
                        .scale(0.3f)
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