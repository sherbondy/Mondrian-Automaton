var complexity = $(document).data("complexity");
var thickness = $(document).data("thickness");

void illus()
{

  ArrayList colors = new ArrayList();

  // add reds
  for (int i = 0; i < int(random(0, 4)); i++) {
    colors.add(color(175,25,25));
  }
  // add blues
  for (int i = 0; i < int(random(0, 4)); i++) {
    colors.add(color(28,24,160));
  }
  // add yellows
  for (int i = 0; i < int(random(0, 4)); i++) {
    colors.add(color(240,204,22));
  }

  	var screen_width = $(document).data("width");
  	var screen_height = $(document).data("height");
  	int stroke_weight = 0;
	if(thickness == 1){
		stroke_weight = int(random(1, 8));
	}
	else if(thickness == 2) {
		stroke_weight = int(random(8, 16));
	}
	else {
		stroke_weight = int(random(17, 28));
	}
  	ArrayList line_locations = new ArrayList();
	int horizontal_lines = 20;
  	int vertical_lines = 20;
	if(complexity == 1) {
		horizontal_lines = 4;
		vertical_lines = 4;
	}
  	int background_shade = color(237, 235, 210);
  	int min_spacing = int(6/complexity);
  	int max_spacing = int(150/complexity);

  // initiate the canvas
  size(screen_width, screen_height);
  background(background_shade);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);
  strokeWeight(stroke_weight);
  
  // initiate a pair of variables to help us keep track of
  // where we have already placed lines
  int location = 0;
  int lines = 0;
  // find a place to put each line
  // this will place lines until we run out of room
  // NOT until we've placed the right number of lines
  // We may want to change this
  
  while (lines < horizontal_lines) {
    location = location + stroke_weight + int(random(min_spacing, max_spacing));
    if (location < (height - stroke_weight - min_spacing)) {
      int[] coords = {0, location, width, location};
      line_locations.add(coords);
      lines++;
    }
    else {
      break;
    }
  }
  
  location = 0;
  lines = 0;
  
  while (lines < vertical_lines) {
    location = location + stroke_weight + int(random(min_spacing, max_spacing));
    if (location < (width - stroke_weight - min_spacing)) {
      int[] coords = {location, 0, location, height};
      line_locations.add(coords);
      lines++;
    }
    else {
      break;
    }
  }

  while (line_locations.size() > 0) {
    int choice = int(random(0, line_locations.size()));
    int[] coords = line_locations.get(choice);
    stroke(colors.get(int(random(colors.size()))));
    line(coords[0], coords[1], coords[2], coords[3]);
    line_locations.remove(choice);
  }
}

void draw(){
  illus()
}
