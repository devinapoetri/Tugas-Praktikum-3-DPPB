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

// program tersebut menggunakan factory constructor untuk mengembalikan instance dari kelas CokeBottle yang mengimplementasikan interface Bottle.
// ketika Bottle() dipanggil, factory constructor membuat dan mengembalikan objek CokeBottle. Ini memungkinkan penggunaan pola desain factory untuk mengabstraksi pembuatan objek.
// sehingga, ketika metode open() dipanggil pada objek bottle, implementasi dari CokeBottle yang dijalankan, mencetak "Coke Bottle is opened".


