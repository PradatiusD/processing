public class Helper {

    int fileCounter = 0;
    int scaleFactor = 2;

    void save () {
        if (saveMovie == true) {
            saveHiRes(scaleFactor);
            if (fileCounter == 300) {
                exit();
            }
        }
        if (keyPressed) {
            if (key == 'b') {
                saveHiRes(scaleFactor);
                exit();
            }
        }
    }

    String getFilePath() {

        String fileName = "frames/";
        fileCounter++;

        if (fileCounter < 10) {
            fileName = fileName + "0000"; // 00001
        } else if (fileCounter == 10   || fileCounter < 100) {
            fileName = fileName + "000";  // 00010
        } else if (fileCounter == 100  || fileCounter < 1000) {
            fileName = fileName + "00";   // 00100
        } else if (fileCounter == 1000 || fileCounter < 10000) {
            fileName = fileName + "0";   //  01000
        }

        fileName = fileName + fileCounter;

        return fileName;
    }

    void saveScale(PGraphics graphic) {
        H.stage().paintAll(graphic, false, 1); // PGraphics, uses3d, Alpha
    }

    // For saving to PNG
    void saveHiRes(int scaleFactor) {
        PGraphics hiRes = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
        beginRecord(hiRes);

        hiRes.scale(scaleFactor);

        saveScale(hiRes);

        hiRes.save(getFilePath() + ".png");
    }


    public Helper Helper () {
        return this;
    }
}