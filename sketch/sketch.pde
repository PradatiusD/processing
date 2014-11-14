// External Libraries
import processing.pdf.*;

// Hype Dependencies
HDrawablePool pool;
HColorPool colors;

// Output configuration
boolean vectorOutput = false;
int pngScale = 2;
boolean dev = false;  // If set to true will create file with timestamp

void setup(){
    size(600, 600);
    H.init(this).background(#272e36);
    smooth();

    // Start doing stuff here
    colors = new HColorPool()
        .add(#00defe)
        .add(#f74987)
        .add(#ddf600)
        .add(#ff0000)
        .add(#f72967)
        .add(#5188bf)
        .add(#01a3ba)
    ;

    HEllipse hitObj = new HEllipse(200);

    H.add(hitObj)
        .size(400)
        .noStroke()
        .fill(#237D26)
        .anchorAt(H.CENTER)
        .locAt(H.CENTER)
        .visibility(false)
    ;

    HShapeLayout hsl = new HShapeLayout().target(hitObj);
    
    pool = new HDrawablePool(300);
    pool.autoAddToStage()
        .add (
            new HRect().rounding(5)
        )
        .layout(hsl)
        .onCreate (
            new HCallback() {
                public void run(Object obj) {
                    HDrawable d = (HDrawable) obj;
                    d
                        .noStroke()
                        .fill(colors.getColor())
                        .size(8+((int)random(5)*5))
                        .anchorAt(H.CENTER)
                        .rotation(45)
                    ;
                }
            }
        )
        .requestAll()
    ;

    // Stop doing stuff here

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

    String fileName;

    if (dev == true) {
        fileName = "render-"+ new java.util.Date() +".png";
    } else {
        fileName = "render.png";
    }

    hiRes.save(fileName);
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