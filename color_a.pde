ArrayList v_array = new ArrayList();
ArrayList h_array = new ArrayList();

ArrayList colors = new ArrayList();
colors.add(color(148, 87, 30)); // orange
colors.add(color(156, 70, 69)); // pink
colors.add(color(96, 90, 126)); // purple

color black = color(44, 26, 12);

void illus() {
    var w = 600;
    var h = 600;
    size(w, h);
    
    v_array.clear();
    h_array.clear();
    
    v_array.add(w);
    h_array.add(h);
    
    v_array.add(0);
    h_array.add(0);
    
    background(245,245,245);
    smooth();

    stroke(255,255,255);
    
    int min_w = int(w/12);
    int max_w = int(w/6);
    
    int s_w = int(w/50);
    int min_s_h = int(w/30);
    int max_s_h = int(w/15);
    
    int[] big_rects = new int[3];
    big_rects[0] = int(random(6, 12));
    big_rects[1] = int(random(6, 12));
    big_rects[2] = int(random(6, 12));
    int small_rects = int(random(20, 30));
    
    for (int i=0; i<big_rects.length; i++)
        for (int j=0; j < big_rects[i]; j++) {
            int width = int(random(min_w,max_w));
            int height = int(random(min_w,max_w));
        
            fill(colors.get(i));
        
            int lefty = int(random(0, w-max_w/2));
            int toppy = int(random(max_w/2,h-max_w/2));
        
            rect(lefty, toppy, width, height);
        }
    }
}

void setup() {
    illus();
}