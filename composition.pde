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

void illus() {
    var w = $(window).width()-8;
    var h = $(window).height()-8;
    size(w, h);
    
    v_array.clear();
    h_array.clear();
    
    v_array.add(w);
    h_array.add(h);
    
    v_array.add(0);
    h_array.add(0);
    
    background(255,255,255);
    smooth();

    stroke(000);
    int s_w = int(random(8,16));
    int adj = ceil(s_w/2);
    strokeWeight(s_w);
    
    int min_w = int(w/12);
    int max_w = int(w/2);
    
    int min_h = int(h/12);
    int max_h = int(h/2);
    
    for (int i = 1; v_array.get(i) < w; i++) {
        int x_pos = v_array.get(i) + int(random(min_w,max_w));
        v_array.add(x_pos);
        
        line(x_pos,0,x_pos,h);
    }
    
    for (int i = 1; h_array.get(i) < h; i++) {
        int y_pos = h_array.get(i) + int(random(min_h,max_h));
        h_array.add(y_pos);
        
        line(0,y_pos,w,y_pos);
    }
    
    
    
    int max_squares = v_array.size()+h_array.size();
    int num_squares = int(random(3, max_squares));
    
    for (int i=0; i < num_squares; i++) {
        int width = max_w;
        int height = max_h;
        
        while (width >= max_w || height >= max_h) {
            int li = int(random(0,v_array.size()));
            int ti = int(random(0,h_array.size()));
        
            int left = v_array.get(li);
            int top = h_array.get(ti);
        
            v_array.remove(li);
            h_array.remove(ti);
        
            int right = v_array.get(int(random(0,v_array.size())));
            int bottom = h_array.get(int(random(0,h_array.size())));
            
            v_array.add(left);
            h_array.add(top);
    
            int width = abs(left-right);
            int height = abs(top-bottom);
                
            if (width < max_w && height < max_h) {
                noStroke();
                fill(colors.get(int(random(0,colors.size()))));
                int lefty = min(left,right) == 0 ? 0 : min(left,right)+adj-1;
                int toppy = min(top,bottom) == 0 ? 0 : min(top,bottom)+adj-1;
                int w_shift = lefty == 0 ? adj : s_w;
                int h_shift = toppy == 0 ? adj : s_w;
                rect(lefty, toppy, width-w_shift+1, height-h_shift+1);
            }
        }
    }
}

void setup() {
    illus();
    frameRate(0.5);
}

void draw() {    
    illus();
}