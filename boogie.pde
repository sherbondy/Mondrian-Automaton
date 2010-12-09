ArrayList v_array = new ArrayList();
ArrayList h_array = new ArrayList();

ArrayList colors = new ArrayList();
colors.add(color(11, 16, 74)); // blue
colors.add(color(165, 164, 169)); // grey
colors.add(color(195, 35, 33)); // red
colors.add(color(213, 174, 49)); // yellow

color bkgd = color(202, 204, 201);
color yellow = color(213, 174, 49);

var complexity = $(document).data("complexity");
var thickness = $(document).data("thickness");

void illus() {
    var w = $(document).data("width");
    var h = $(document).data("height");
    size(w, h);
    
    v_array.clear();
    h_array.clear();
        
    background(bkgd);
    smooth();

    stroke(yellow);
    int s_w = int(w/48);
    strokeWeight(s_w);
    
    int min_squares = int(4/complexity);
    int max_squares = int(18/complexity);
    
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
            
            square_pos += int(random(2/complexity,8/complexity)*s_w);
        }
    }
    
    for (int i = 1; i < h_array.size(); i++) {
        int square_pos = 0;
        
        while (square_pos < h) {
            fill(colors.get(int(random(0,colors.size()))));
            rect(square_pos-s_w/2, h_array.get(i)-s_w/2, s_w, s_w);
            
            square_pos += int(random(2/complexity,8/complexity)*s_w);
        }
    }
    
    for (int i = 1; i < v_array.size(); i++) {
        for (int j = 1; j < h_array.size(); j++) {
            int squarify = int(random(0,4));
            
            if (squarify == 0) {
                fill(colors.get(int(random(0,colors.size()))));
                
                int left_shift = s_w/2;
                int top_shift = s_w/2;
                
                // box is wider than it is tall, so we want to have a hotdog rect inside
                
                if (v_array.get(i+1)-v_array.get(i) > h_array.get(j+1)-h_array.get(j)) {
					// max_s is the max size of the color square we will be placing
					// in our blank white space
                    int max_s = int((v_array.get(i+1)-v_array.get(i))/s_w);
					// max_si is the size of the free white space that we are putting
					// this box in
                    int max_si = max_s;
                    
                    if (max_s > 6) {
                        // don't want ridiculously wide boxes
                        max_s = int(max_s/2);
                    }
					
					// modifying max_s to change with the thickness the user prefers
					max_s = int((complexity*max_s)/2);
					
                    int num_squares = int(random(2,max_s));
                    int free_s = max_si - num_squares;
                    int height = h_array.get(j+1)-h_array.get(j)-s_w;
                    left_shift += int(random(0,free_s))*s_w;
                    
                    rect(v_array.get(i)+left_shift, h_array.get(j)+top_shift, 
                        num_squares*s_w, 
                        h_array.get(j+1)-h_array.get(j)-s_w);
                    
                    if (num_squares > 2) {
                        int sub_w_sq = int(random(1,num_squares));
                        int left_more = int(random(0, num_squares - sub_w_sq))*s_w;
                        int sub_h_sq = int(random(1,int(height/16)));
                        int top_more = int(random(0, int(height/16)-sub_h_sq))*s_w;

                        fill(colors.get(int(random(0,colors.size()))));

                        rect(v_array.get(i)+left_shift+left_more, h_array.get(j)+top_shift+top_more, 
                            sub_w_sq*s_w, sub_h_sq*s_w);
                    }
                } else {
                    // box is taller than it is wide, so we want a hamburger rect inside
                    
					// again, max_s refers to the size of the color rectangle we are creating
                    int max_s = int((h_array.get(i+1)-h_array.get(i))/s_w);
					// and max_si refers to the total available white space
                    int max_si = max_s;
                    
                    if (max_s > 5) {
                        // don't want ridiculously wide boxes
                        max_s = int(max_s/2);
                    }

					// modifying max_s to change with the thickness the user prefers
					max_s = int((complexity*max_s)/2);
					
                    int num_squares = int(random(2,max_s));
                    int free_s = max_si - num_squares;
                    int width = v_array.get(i+1)-v_array.get(i)-s_w;
                    top_shift += int(random(0,free_s))*s_w;
                    
                    rect(v_array.get(i)+left_shift, h_array.get(j)+top_shift, 
                        width, num_squares*s_w);
                    
                    if (num_squares > 2) {
                        int sub_h_sq = int(random(1,num_squares));
                        int top_more = int(random(0, num_squares - sub_h_sq))*s_w;
                        int sub_w_sq = int(random(1,int(width/16)));
                        int left_more = int(random(0, int(width/16)-sub_w_sq))*s_w;
                        
                        fill(colors.get(int(random(0,colors.size()))));
                        
                        rect(v_array.get(i)+left_shift+left_more, h_array.get(j)+top_shift+top_more, 
                            sub_w_sq*s_w, sub_h_sq*s_w);
                    }
                }
            }
        }
    }
}

void setup() {
    illus();
}