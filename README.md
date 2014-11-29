# Processing Experiments

This is a setup that works off the [Hype Framework](http://www.hypeframework.org/), processing and [Joshua Davis'](http://www.skillshare.com/classes/design/Programming-Graphics-I-Introduction-to-Generative-Art/782118657) Skillshare course.  It is meant to quickly set up the environment.

![Latest Hype still](still/render.png)
![Latest Hype movie](movie/render.png)


## Using Bower

Given that the [HYPE Processing framework](https://github.com/hype/HYPE_Processing) is under heavy development, this has been connected via Bower.  Bower will make it easy to easily check for the latest status of the git repository.  To intstall Bower, first install [NodeJS](http://nodejs.org/) and then go to [Bower.io](http://bower.io/).  When you have both install run:

```bash
# Update HYPE docs, data, information
# Which will be stored inside the bower_components folder

bower install
```

## Creating video

Use the movie maker tool in the Processing menu under Tools.


## Why two directories

This is split into two di3rectories to make it easy to export static or dynamic.


## Helpful Processing functions

```Java

// Helpful functions
println("");

```

## Setup for still
```Java

// Output configuration
Helper helper;
boolean dev = false;          // If set to true will create file with timestamp
boolean vectorOutput = false; // If set to true will create pdf, false will create png
int pngScale = 2;             // Scale of png relative to the size()

void setup(){

    helper = new Helper();

    size(600, 600);
    H.init(this).background(#333333);
    smooth();

    /* Begin writing visualization code */

    /* End writing visualization code */

    helper.save();
    noLoop();
}

void draw(){
    H.drawStage();
}

```


## Setup for video
```Java
Helper helper;

// Output configuration
boolean saveMovie = false;  // If set to true will save 300 frames in png format

void setup() {
	helper = new Helper();
	size(640, 640);
	H.init(this).background(#000000);
	smooth();
}

void draw() {

	H.drawStage();
	helper.save();
}
```