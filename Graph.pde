import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

class Graph{
  List<Double> xAxis;
  List<Double> yAxis;
  int graph_num;
  int number_of_graphs;
  int originX;
  int originY;
  int graph_width;
 
  Graph(List<Double> tempx, List<Double> tempy, int graph_no, int no_of_graphs) { //constructor
    xAxis = tempx;
    yAxis = tempy;
    graph_num = graph_no;
    number_of_graphs = no_of_graphs;
  }
  void get_dimentions() {
    graph_width = (1000-30) / number_of_graphs;
    originX = (10 * graph_num) + (graph_width * (graph_num - 1));
    originY = 10;
  }
  void draw_axis() {
    stroke(0);
    fill(0);
    line(originX, 500-originY, (originX + graph_width), 500-originY);
    line(originX, 500-originY, originX, (500-originY - graph_width));
    if (graph_num == 1) {
      stroke(255, 0, 0);
      line(originX, 500-originY, (originX + graph_width), (500-originY - graph_width));
    }
  }
  void pot_points() {
    //scale points to the width of the graph
    double bigx = 0;
    double smallx = 100000000;
    double bigy = 0;
    double smally = 100000000;
    //find range of xcoords and the scale factor
    //find the range of ycoords and the scale factor
    for (int i = 0; i < xAxis.size(); i++) {
      if (xAxis.get(i) > bigx) {
        bigx = xAxis.get(i);
      }
      if (xAxis.get(i) < smallx) {
        smallx = xAxis.get(i);
      }
      if (yAxis.get(i) > bigy) {
        bigy = yAxis.get(i);
      }
      if (yAxis.get(i) < smally) {
        smally = yAxis.get(i);
      }
    }
    double xScale = graph_width / (bigx - smallx);
    double yScale = graph_width / (bigy - smally);
    if (graph_num == 2) {
      print(xScale);  
    }
    //pot points
    for (int i = 0; i < xAxis.size(); i++) {
      double x = originX + (xAxis.get(i) * xScale);
      double y = originY + (yAxis.get(i) * yScale);
      float float_x = (float) x;
      float float_y = (float) y;
      stroke(30,144,255);
      fill(30,144,255);
      circle(float_x, 500-float_y, 2);
    }
  }
}
