class memo {
  PImage img;
  int size = 100;
  int a, b, c, d; // 사각형을 만들 때 사용할 변수
  IntList array;
  int leng;
  ArrayList<IntList> memoArray;
  IntList A;
  String result = "";

  void set() {
    img = loadImage("memo.png");
    img.resize(0, size);

    memoArray = new ArrayList();
  }

  void Clicked() {
    image(img, displayWidth/2 - size, 0);
    array = new IntList();
    A = new IntList();
    if (mouseClicked()) {

      leng = memoArray.size();

      a = displayWidth/3 + 40;
      b = size + 20 + (leng * 80);
      c = 200;
      d = 70;
      array.append(a);
      array.append(b);
      array.append(c);
      array.append(d); 
      if (memoArray.size() != 5) {
        memoArray.add(array);
      }
    }
    for (int i = 0; i < memoArray.size(); i ++) {
      //print("A");
      A = memoArray.get(i);
      drawMemo(A);
    }
    text(result, a, b);
  }

  boolean mouseClicked() {
    if (mousePressed && mouseX >= displayWidth/2 - size && mouseX <= displayWidth/2 && mouseY <= size) {
      return true;
    } else {
      return false;
    }
  }

  void drawMemo(IntList Array) {
    rect(Array.get(0), Array.get(1), Array.get(2), Array.get(3));
  }
  
  void keyPressed(){
    result += key;
    print("A");
  }
}
