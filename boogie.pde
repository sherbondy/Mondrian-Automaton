ArrayList v_array = new ArrayList();
ArrayList h_array = new ArrayList();

ArrayList colors = new ArrayList();
colors.add(color(11, 17, 77)); // blue
colors.add(color(165, 164, 169)); // grey
colors.add(color(195, 35, 33)); // red
colors.add(color(28,24,160)); // blue
colors.add(color(213, 174, 49)); // yellow

color bkgd = color(202, 204, 201);
color yellow = color(213, 174, 49);

void illus() {
    var w = 480;
    var h = 480;
    size(w, h);
    
    v_array.clear();
    h_array.clear();
        
    background(bkgd);
    smooth();

    stroke(yellow);
    int s_w = int(w/48);
    strokeWeight(s_w);
    
    int min_squares = 2;
    int max_squares = 14;
    
    v_array.add(0);
    h_array.add(0);

    v_array.add(int(random(1,3))*s_w);
    h_array.add(int(random(1,3))*s_w);
        
    line(v_array.get(1), 0, v_array.get(1), h);
    line(0, h_array.get(1), w, h_array.get(1));
    
    for (int i = 1; v_array.get(i) < w; i++) {
        int x_pos = v_array.get(i) + int(random(min_squares,max_squares))*s_w;
        v_array.add(x_pos);
        
        line(x_pos,0,x_pos,h);
    }
    
    for (int i = 1; h_array.get(i) < h; i++) {
        int y_pos = h_array.get(i) + int(random(min_squares,max_squares))*s_w;
        h_array.add(y_pos);
        
        line(0,y_pos,w,y_pos);
    }
    
    noStroke();
    
    for (int i = 1; i < v_array.size(); i++) {
        int square_pos = 0;
        
        while (square_pos < w) {
            fill(colors.get(int(random(0,colors.size()))));
            rect(v_array.get(i)-s_w/2, square_pos-s_w/2, s_w, s_w);
            
            square_pos += int(random(1,5))*s_w;
        }
    }
    
    for (int i = 1; i < h_array.size(); i++) {
        int square_pos = 0;
        
        while (square_pos < w) {
            fill(colors.get(int(random(0,colors.size()))));
            rect(square_pos-s_w/2, h_array.get(i)-s_w/2, s_w, s_w);
            
            square_pos += int(random(1,5))*s_w;
        }
    }
}

void setup() {
    illus();
}