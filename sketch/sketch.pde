// External Libraries
import processing.pdf.*;

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
    H.init(this).background(#272e36);
    smooth();

    colors = new HColorPool()
        .add(#00defe)
        .add(#f74987)
        .add(#ddf600)
        .add(#ff0000)
        .add(#f72967)
        .add(#5188bf)
        .add(#01a3ba)
    ;

    pool = new HDrawablePool(20);
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

    helper.save();
    noLoop();
}

void draw(){
    H.drawStage();
}