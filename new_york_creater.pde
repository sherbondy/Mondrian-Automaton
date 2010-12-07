ArrayList colors = new ArrayList();

// adding color options to the colors array
colors.add(color(175,25,25)); // red
colors.add(color(28,24,160)); // blue
colors.add(color(240,204,22)); // yellow
colors.add(color(240,204,22)); // yellow
colors.add(color(240,204,22)); // yellow

void illus()
{
  var screen_width = 600;
  var screen_height = 400;
  int stroke_weight = int(random(0, 20));  
  ArrayList line_locations = new ArrayList();
  int horizontal_lines = 20;
  int vertical_lines = 20;
  int background_shade = 125;
  // the min and max spacing includes spacing between the walls.
  // we may want to provide two more variables to control this particular case later
  int min_spacing = 5;
  int max_spacing = 100;

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
      /*ArrayList coords = new ArrayList();
      coords.add(0);
      coords.add(location);
      coords.add(width);
      coords.add(location);*/
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
      /*ArrayList coords = new ArrayList();
      coords.add(location);
      coords.add(0);
      coords.add(location);
      coords.add(height);*/
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

/*
  for(int i; i < line_locations.size(); i++) {
    int[] coords = line_locations.get(i);
    stroke(colors.get(int(random(colors.size()))));
    line(coords[0], coords[1], coords[2], coords[3]);
  } */
}

void draw(){
  illus()
}
