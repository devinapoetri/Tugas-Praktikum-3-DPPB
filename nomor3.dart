abstract class Bottle {
  void open() {}

  factory Bottle() {
    return CokeBottle();
  }
}

class CokeBottle implements Bottle {
  @override
  void open() {
    print("Coke Bottle is opened");
  }
}

void main() {
  var bottle = Bottle();
  bottle.open();
}

