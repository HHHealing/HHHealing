class memo {
  PImage img;
  int size = 100;
  int a, b, c, d; // 사각형을 만들 때 사용할 변수
  IntList array;
  int leng;
  ArrayList<IntList> memoArray;
  IntList A;
  String result = "";
  String [] word;
  int number;
  int x, y;

  void set() {
    img = loadImage("memo.png");
    img.resize(0, size);
    word = new String[5];
    for (int i = 0; i < word.length; i ++) {
      word[i] = "";
    }
    memoArray = new ArrayList();
  }

  void Clicked() {
    image(img, displayWidth/2 - size, 0);
    array = new IntList();
    A = new IntList();
    if (mouseClick()) {

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
      A = memoArray.get(i);
      drawMemo(A);
    }
    if (mousePressed) {
      number = getMemoPoint();
    }

    showWord();

  }

  boolean mouseClick() {
    if (mousePressed && mouseX >= displayWidth/2 - size && mouseX <= displayWidth/2 && mouseY <= size) {
      return true;
    } else {
      return false;
    }
  }

  void drawMemo(IntList Array) {
    fill(255);
    rect(Array.get(0), Array.get(1), Array.get(2), Array.get(3));
    showWord();
  }

  int getMemoSize() {
    return memoArray.size();
  }

  int getMemoPoint() {
    int result = 100;

    if (mouseX >= a && mouseX <= a + c) {
      for (int i = 0; i < memoArray.size(); i ++) {  
        if (round((mouseY - 10*i - (size + 20))/70) == i) {
          if (i == 0) {
            if(mouseY >= size + 20)
            result = i;
          }
          else {
            result = i;
          }
        }
      }
    }
    return result;
  }

  void plusWord(String w) {
    if (number <= 4) {
      word[number] += w;
    }
  }

  void showWord() {
    fill(0);
    for (int i = 0; i < memoArray.size(); i ++) {
      textSize(20);
      text(word[i], memoArray.get(i).get(0) + 20, memoArray.get(i).get(1) + 40);
    }
  }

  void memoDragged(int mx, int my, int number) {
    if (number <= 4) {
      //memoArray.get(number).set(0, a);
      //memoArray.get(number).set(1, size + 20 + (number * 80));

      //x = mx - memoArray.get(number).get(0);
      //y = my - memoArray.get(number).get(1);

      memoArray.get(number).set(0, mx);
      memoArray.get(number).set(1, my);
      //print(memoArray.get(number).get(0));
    }
  }

  IntList getMemoStatus(int num) {

    return memoArray.get(num);
  }

  void memoNonFire(IntList list, int num) {
    memoArray.set(num, list);
  }
  
  ArrayList<IntList> getArrayList(){
   return memoArray;   
  }
  
  void removeMemo(int number){
    if(number <= memoArray.size()){ 
      memoArray.remove(number);
      word[number] = "";
    }

  }
}
