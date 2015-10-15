HColorPool colors;

void setup() {
	background(0, 0, 0);
	size(900,600);
	H.init(this).background(#000000);
    smooth();

	colors = new HColorPool(#fd3bdb, #fd4a80, #b048fc, #6a45fc, #5b21b0);
	HShape svg1 = new HShape("4-04.svg");
	svg1
		.enableStyle(false)
		.loc(width/2,height/2)
		.stroke(0, 0)
		.noFill()
		.anchorAt(H.CENTER)
	;
	svg1.randomColors(colors.fillOnly());
	H.add(svg1);
		H.drawStage();
}

void draw() {
}