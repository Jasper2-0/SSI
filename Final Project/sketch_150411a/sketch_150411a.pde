

PVector p1, p2, p3, p4, mp;
float mx, my;
float d1, d2, d3, d4;
float md;

void setup() {
  size(250, 250);

  p1 = new PVector (50, 50);
  p2 = new PVector (200, 50);
  p3 = new PVector (50, 200);
  p4 = new PVector (200, 200);

  mp = new PVector(0, 0);
  noCursor();

  md = PVector.dist(p1, p4);
}

void update() {

  mx = map(mouseX, p1.x, p2.x, -1, 1);
  my = map(mouseY, p1.y, p3.y, -1, 1);

  mp.x = mouseX;
  mp.y = mouseY;

  d1 = PVector.dist(mp, p1);
  d2 = PVector.dist(mp, p2);
  d3 = PVector.dist(mp, p3);
  d4 = PVector.dist(mp, p4);
  
  d1 = map(d1,0,md,1,0);
  d2 = map(d2,0,md,1,0);
  d3 = map(d3,0,md,1,0);
  d4 = map(d4,0,md,1,0);
  
}

void draw() {

  update();

  background(0);
  drawPoint(p1);
  drawPoint(p2);
  drawPoint(p3);
  drawPoint(p4); 

  noFill();
  stroke(255);
  line(mouseX, mouseY, p1.x, p1.y);
  line(mouseX, mouseY, p2.x, p2.y);
  line(mouseX, mouseY, p3.x, p3.y);
  line(mouseX, mouseY, p4.x, p4.y);

  fill(255);
  textAlign(LEFT);  
  text("mouseX:"+str(mx), p1.x, 15);
  text("mouseY:"+str(my), p1.x, 30);

  text(str(d1), p1.x, p1.y);
  text(str(d2), p2.x, p2.y);
  text(str(d3), p3.x, p3.y);
  text(str(d4), p4.x, p4.y);
}


void drawPoint(PVector p) {
  pushMatrix();
  translate(p.x, p.y);
  noStroke();
  fill(255, 0, 0);
  ellipse(0, 0, 10, 10);
  popMatrix();
}

