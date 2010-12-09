ArrayList colors = new ArrayList();
colors.add(color(148, 87, 30)); // orange
colors.add(color(156, 70, 69)); // pink
colors.add(color(96, 90, 126)); // purple

color black = color(44, 26, 12);

int complexity = int(random(1, 4));
int thickness = int(random(1,4));

void illus() {
    var w = $(document).data("width");
    var h = $(document).data("height");
    size(w, h);
            
    background(245,245,245);
    smooth();
    
    int min_w = int((thickness*w)/16);
    int max_w = int((thickness*w)/8);
    
    int s_w = int(w/50);
    int min_s_h = int((thickness*w)/40);
    int max_s_h = int((thickness*w)/20);
    
    int[] big_rects = new int[3];
    big_rects[0] = int(random(complexity*4, complexity*7));
    big_rects[1] = int(random(complexity*4, complexity*7));
    big_rects[2] = int(random(complexity*4, complexity*7));
    
    int small_rects = int(random(complexity*10, complexity*20));
    
    for (int i=0; i<big_rects.length; i++) {
        for (int j=0; j < big_rects[i]; j++) {
            int width = int(random(min_w,max_w));
            int height = int(random(min_w,max_w));
            
            stroke(255,255,255);
            fill(colors.get(i));
        
            int lefty = int(random(0, w-max_w/2));
            int toppy = int(random(-max_w/2,h-max_w/2));
        
            rect(lefty, toppy, width, height);
            
            noStroke();
            
            if (small_rects > 0) {
                lefty = lefty + int(random(-max_w,max_w));
                toppy = toppy + int(random(-max_w,max_w));
                
                int s_h = int(random(min_s_h, max_s_h));
                int o = int(random(2));
                
                fill(black);
                
                if (o == 0) {
                    rect(lefty, toppy, s_h, s_w);
                } else {
                    rect(lefty, toppy, s_w, s_h);
                }
            
                small_rects--;
            }
        }
    }
    
    for (int i=0; i<small_rects; i++) {
        int height = int(random(min_s_h,max_s_h));
        int orientation = int(random(0,1));
    }
}

void setup() {
    illus();
}