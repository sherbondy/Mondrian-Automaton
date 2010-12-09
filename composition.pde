ArrayList v_array = new ArrayList();
ArrayList h_array = new ArrayList();

ArrayList colors = new ArrayList();
colors.add(color(175,25,25)); // red
colors.add(color(175,25,25)); // red
colors.add(color(28,24,160)); // blue
colors.add(color(28,24,160)); // blue
colors.add(color(240,204,22)); // yellow
colors.add(color(240,204,22)); // yellow
colors.add(color(18, 13, 10)); // black
colors.add(color(187, 189, 194)); // grey
colors.add(color(255,255,255)); // white

int complexity = int(random(1, 4));
int thickness = int(random(1,4));

void illus() {
    //var w = $(document).data("width");
    //var h = $(document).data("height");
    var w = 480;
    var h = 480;
    size(480, 480);
    
    v_array.clear();
    h_array.clear();
    
    v_array.add(0);
    h_array.add(0);
    
    background(255,255,255);
    smooth();

    stroke(000);
    int s_w = int(random(int((thickness*w)/125),int((thickness*w)/75)));
    int adj = int(s_w/2);
    strokeWeight(s_w);
    
    int min_w = int((complexity*w)/14);
    int max_w = int((complexity*w)/6);
    
    int min_h = int((complexity*h)/14);
    int max_h = int((complexity*h)/6);
    
    //adding lines to v_array and h_array
    
    //first we add a line that can be close to the left side b/c it is possible for this to happen on the right
    int x_pos = int(random(s_w, max_w));
    v_array.add(x_pos);
    line(x_pos, 0, x_pos, h);
    while (true) {
      x_pos = x_pos + int(random(min_w, max_w));
      if (x_pos < w) {
        v_array.add(x_pos);
      
        line(x_pos, 0, x_pos, h);
      }
      else {
        break;
      }
    }
    
    //we do the same thing here b/c lines can be close to the bottom
    int y_pos = int(random(s_w, max_w));
    h_array.add(y_pos);
    line(0, y_pos, w, y_pos);
    while (true) {
      y_pos = y_pos + int(random(min_h, max_h));
      if (y_pos < h) {
        h_array.add(y_pos);
      
        line(0, y_pos, w, y_pos);
      }
      else {
        break;
      }
    }
    
    // adding the right-most and bottom-most bounds
    v_array.add(w);
    h_array.add(h);


    //creating an arraylist to store the {x1,y1,x2,y2} coords of each rectangle
    ArrayList spaces = new ArrayList();
    // finding all the locations for rectangles
    for (int y = 0; y < (h_array.size() - 1); y++){ // for every line in h_array except the last
      for (int x = 0; x < (v_array.size() - 1); x++) { // for ever line in v_array except the last
        int[] dimensions = {v_array.get(x), h_array.get(y), v_array.get(x + 1), h_array.get(y + 1)};
        spaces.add(dimensions);
      }
    }
    
    int max_squares = v_array.size()+h_array.size();
    int num_squares = int(random(3, max_squares));
    int painted_squares = 0;
    ArrayList occupied = new ArrayList();
    occupied.add(-1);
    boolean moved_left = false;
    boolean moved_right = false;

    while(painted_squares < num_squares) {
      int index = -1;
      while(occupied.contains(index)) {
        index = int(random(0, spaces.size()));
      }
      int[] dimensions = spaces.get(index);
      occupied.add(index);
      painted_squares = painted_squares + 1;
      //moving right
      if(painted_squares < num_squares && !((index + 1) % (v_array.size() - 1) == 0) && !(occupied.contains(index + 1)) ) {
        if (int(random(0, 2))==1) {
          dimensions[2] = spaces.get(index + 1)[2];
          painted_squares = painted_squares + 1;
          occupied.add(index + 1);
          moved_right = true;
        }
      }
      //moving left
      if(painted_squares < num_squares && !((index) % (v_array.size() - 1) == 0) && !(occupied.contains(index - 1)) ) {
        if (int(random(0, 2))==1) {
          dimensions[0] = spaces.get(index - 1)[0];
          painted_squares = painted_squares + 1;
          occupied.add(index - 1);
          moved_left = true;
        }
      }
      //moving down
      if(painted_squares < num_squares && !(occupied.contains(index + v_array.size() - 1)) && (index + v_array.size() - 1) < spaces.size()) {
        if(!(moved_right && occupied.contains(index+v_array.size()))
          && !(moved_left && occupied.contains(index + v_array.size() - 2)) && int(random(0, 2)) == 1) {
          dimensions[3] = spaces.get(index + v_array.size() - 1)[3];
          painted_squares = painted_squares + 1;
          occupied.add(index + v_array.size() - 1);
          if(moved_right) {
            occupied.add(index+v_array.size());
            painted_squares = painted_squares + 1;
          }
          if(moved_left) {
            occupied.add(index+v_array.size()-2);
            painted_squares = painted_squares + 1;
          }
        }
      }
      //moving up
      if(painted_squares < num_squares && !(occupied.contains(index - v_array.size() + 1)) && (index - v_array.size() + 1) >= 0) {
        if(!(moved_right && occupied.contains(index - v_array.size() + 2))
          && !(moved_left && occupied.contains(index - v_array.size())) && int(random(0, 2)) == 1) {
          dimensions[1] = spaces.get(index - v_array.size() + 1)[1];
          painted_squares = painted_squares + 1;
          occupied.add(index - v_array.size() + 1);
          if(moved_right) {
            occupied.add(index - v_array.size() + 2);
            painted_squares = painted_squares + 1;
          }
          if(moved_left) {
            occupied.add(index - v_array.size());
            painted_squares = painted_squares + 1;
          }
        }
      }
      
      
      // adjusting the dimensions to compensate for the thickness of the lines
      if(dimensions[0] != 0) {
        dimensions[0] = dimensions[0] + adj;
      }
      if(dimensions[1] != 0) {
        dimensions[1] = dimensions[1] + adj;
      }
      if(dimensions[2] != w) {
        dimensions[2] = dimensions[2] - adj;
      }
      if(dimensions[3] != h) {
        dimensions[3] = dimensions[3] - adj;
      }
      noStroke();
      fill(colors.get(int(random(0, colors.size()))));
      rect(dimensions[0], dimensions[1], (dimensions[2]-dimensions[0]), (dimensions[3]-dimensions[1]));
    }
}

void setup() {
    illus();
}