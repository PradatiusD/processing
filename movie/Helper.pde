public class Helper {

    void save () {
        saveFrame("frames/#########.jpg"); 
        if (frameCount == 300) {
            exit();
        }
    }

    public Helper Helper () {
        return this;
    }

}