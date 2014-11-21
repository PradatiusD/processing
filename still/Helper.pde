public class Helper {

    void save() {
        if (vectorOutput == true) {
            saveVector();
        } else {
            saveHiRes(pngScale);
        }
    }

    String getFilePath() {

        String fileName = "render";

        if (dev == true) {
            fileName = fileName + "-"+ new java.util.Date();
        } 
        return fileName;
    }

    void saveScale(PGraphics graphic) {
        if (graphic == null) {
            H.drawStage();
        } else {
            H.stage().paintAll(graphic, false, 1); // PGraphics, uses3d, Alpha
        }       
    }

    // For saving to PNG
    void saveHiRes(int scaleFactor) {
        PGraphics hiRes = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
        beginRecord(hiRes);

        hiRes.scale(scaleFactor);

        saveScale(hiRes);

        hiRes.save(getFilePath() + ".png");
    }

    // For saving to Vector Graphics
    void saveVector() {
        PGraphics tmp = null;
        tmp = beginRecord(PDF, getFilePath() + ".pdf");
        saveScale(tmp);

        endRecord();
    }

    public Helper Helper () {
        return this;
    }

}