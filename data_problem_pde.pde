import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
  

Graph g1;
Graph g2;


int size = 50;
int frameSize = 1000;
int interval = frameSize / size;
List<int[]> pointOne;
List<int[]> pointTwo;
double midx;
double midy;
double radius;
int True = 0;
int False = 0;
List<Double> radii = new ArrayList<>();
List<Double> dist = new ArrayList<>();
List<Double> set_radii= new ArrayList<>();
List<Double> num_radii= new ArrayList<>();

void setup(){
  size(1000, 1000);
  frameRate(10);
  createList();
  allCombos();
  // ^-- attributes() is called
  g1 = new Graph(dist, radii, 1, 2);
  g2 = new Graph(set_radii, num_radii, 2, 2);
};

void draw(){
  //draw graph(s)
  g1.get_dimentions();
  g1.draw_axis();
  g1.pot_points();
  g2.get_dimentions();
  g2.draw_axis();
  g2.pot_points();
};

public void createList() {
   pointOne = new ArrayList<>();
   pointTwo = new ArrayList<>();
   for (int x = 0; x < size; x++){
      for (int y = 0; y < size; y++){
        pointOne.add(new int[]{x, y});
        pointTwo.add(new int[]{x, y});
      }
   }  
}

public void allCombos() {
  //all of the combinations of two points between lists 1 and 2
  for (int[] one : pointOne) {
    for (int[] two : pointTwo) {
       attributes(one, two);  
    }
  }  
}

public void attributes( int[] one, int[] two) {
  //finds the midpoint and half of the distance between the points in order of the circle
  midx = (one[0] + two[0]) / 2;
  midy = (one[1] + two[1]) / 2;
  radius = Math.sqrt((one[0] - two[0])*(one[0] - two[0]) + (one[1] - two[1])*(one[1] - two[1]));
  double min_dist = midy;
  if (midx < min_dist) {
    min_dist = midx;
  }
  else if ((size-midx)<min_dist){
    min_dist = (size-midx);
  }
  else if ((size-midy)<min_dist){
    min_dist = (size-midy);
  }  
  //add attributes to data lists
  radii.add(radius);
  dist.add(min_dist);
  if (set_radii.contains(radius)) {
    // Get the index of the radius in set_radii
    int index = set_radii.indexOf(radius);
    
    // Update the corresponding count in num_radii
    num_radii.set(index, num_radii.get(index) + 1);
  } 
  else {
    // Add the new radius to set_radii
    set_radii.add(radius);
    
    // Add a new entry in num_radii with a count of 1 (since it's the first occurrence)
    double temp = 1;
    num_radii.add(temp);
  }
}
