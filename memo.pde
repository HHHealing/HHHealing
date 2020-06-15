class memo {
  PImage img;
  int size = 100;
  int a, b, c, d; // 사각형을 만들 때 사용할 변수
  IntList array;
  int leng;
  ArrayList<IntList> memoArray;

  void set() {
    img = loadImage("memo.png");
    img.resize(0, size);
    
    memoArray = new ArrayList();
  }

  void Clicked() {
    image(img, displayWidth/2 - size, 0);
    array = new IntList();
    
    if (mouseClicked()) {

      leng = memoArray.size();
      
      a = displayWidth/2 + 20;
      b = size + 20 + (leng * 20);
      c = 50;
      d = 30;
      array.append(a);
      array.append(b);
      array.append(c);
      array.append(d);      
      memoArray.add(array);
      
    }
  }

  boolean mouseClicked() {
    if (mousePressed && mouseX >= displayWidth/2 - size && mouseX <= displayWidth/2 && mouseY <= size) {
      return true;
    } else {
      return false;
    }
  }

  void drawMemo() {
    
  }
}
