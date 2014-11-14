// External Libraries
import processing.pdf.*;

// Hype Dependencies
HDrawablePool pool;
HColorPool colors;

// Output configuration
boolean vectorOutput = false;
int pngScale = 2;


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

    pool = new HDrawablePool(100);
    pool
        .autoAddToStage()
        .add(new HShape("vectors.svg"))
        .onCreate(
            new HCallback(){
                public void run (Object obj) {
                    HShape d = (HShape) obj;
                    d
                        .enableStyle(false)
                        .strokeWeight(0)
                        .stroke(#FFFFFF)
                        .fill((int)random(25,125))
                        .scale((int)random(0.5, 3))
                        .rotate((int)random(360))
                        .loc((int)random(width), (int)random(height))
                    ;

                    d.randomColors(colors.fillOnly());
                }
            }
        )
        .requestAll()
    ;


    if (vectorOutput == true) {
        saveVector();
    } else {
        saveHiRes(pngScale);
    }
    noLoop();
}

void draw(){
    H.drawStage();
}

// For saving to PNG
void saveHiRes(int scaleFactor) {
    PGraphics hiRes = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
    beginRecord(hiRes);
    hiRes.scale(scaleFactor);

    if (hiRes == null) {
        H.drawStage();
    } else {
        H.stage().paintAll(hiRes, false, 1); // PGraphics, uses3d, Alpha
    }

    hiRes.save("render.png");
}

// For saving to Vector Graphics
void saveVector() {
    PGraphics tmp = null;
    tmp = beginRecord(PDF, "render.pdf");

    if (tmp == null) {
        H.drawStage();
    } else {
        H.stage().paintAll(tmp, false, 1); // PGraphics, Uses 3d, alpha
    }

    endRecord();
}