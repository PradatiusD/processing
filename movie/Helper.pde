public class Helper {

    void save () {
        if (saveMovie == true) {
            saveFrame("frames/#########.jpg"); 
            if (frameCount == 300) {
                exit();
            }
        }
        if (keyPressed) {
            if (key == 'b') {
               saveFrame("render.png"); 
                exit();
            }
        }
    }

    public Helper Helper () {
        return this;
    }
}