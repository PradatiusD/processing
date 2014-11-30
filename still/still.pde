// Hype Dependencies
HColorPool colors, grays;
HShape s1,s2;

// Output configuration
Helper helper;
boolean dev = false;          // If set to true will create file with timestamp
boolean vectorOutput = false; // If set to true will create pdf, false will create png
int pngScale = 2;             // Scale of png relative to the size()


Table table;

void setup(){

    helper = new Helper();

    size(600, 600);
    H.init(this).background(#333333);
    smooth();

    /* Begin writing visualization code */

    colors = new HColorPool(#7D4BC3,#9D7DD4,#A38CD9,#A694DB,#B7A7E2,#D2C6EC,#D8D1F0,#F3F0FA);

    grays  = new HColorPool(#929193);

    table = helper.loadData();

    int counter = 0;

    for (TableRow row : table.rows()) {
        String desc = row.getString("Age");

        String popRaw = row.getString("Population");
        String[] popArr = split(popRaw, ",");
        String popStr = join(popArr,"");
        int pop = parseInt(popStr);

        // println(desc + " "  + pop);

        s1 = new HShape("vectors.svg");

        H.add(s1);

        counter++;

        s1
            .enableStyle(false)
            .scale(pop/1500000)
            .fill(colors.getColor())
            .strokeWeight(0.05)
            .stroke(#9D7DD4)
            .loc((counter*34)-32,(height/2)+100)
            .anchorAt(H.BOTTOM)
        ;

        PFont type = createFont("font.ttf", 60);
        HText description = new HText( desc, 60,type);

        H.add(description)
            .size(10)
            .noStroke()
            .fill(#A38CD9)
            .anchorAt(H.TOP)
            .loc((counter*34)-32,(height/2)+120)

        ;
    }

    /* End writing visualization code */

    helper.save();
    noLoop();
}

void draw(){
    H.drawStage();
}