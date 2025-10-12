// a.
// class Mahasiswa {
//   String? nama;
//   int? nim;
//   String? jurusan;
//   // Method untuk menampilkan data
//   void tampilkanData() {
//     print("Nama : $nama");
//     print("NIM : $nim");
//     print("Jurusan : $jurusan");
//   }
// }

// void main() {
//   var m1 = Mahasiswa();
//   m1.nama = "Budi";
//   m1.nim = 12345;
//   m1.jurusan = "SIKC";
//   // Memanggil method untuk print
//   m1.tampilkanData();
// }

// b. 
class Mahasiswa {
  String nama;
  int nim;
  String jurusan;
  Mahasiswa(this.nama, this.nim, this.jurusan);
  void tampilkanData() {
    print("Nama : $nama");
    print("NIM : $nim");
    print("Jurusan : $jurusan");
  }
}

void main() {
  var m1 = Mahasiswa("Budi", 12345, "SIKC");
  m1.tampilkanData();
  print("-------------");
  var m2 = Mahasiswa("Andi", 54321, "SIKC");
  m2.tampilkanData();
}

// b. Kedua kode sama-sama menampilkan data mahasiswa, tapi kode B lebih praktis karena menggunakan constructor untuk langsung mengisi nilai lewat parameter, tapi constructor di dart tidak mendukung overloading

// d. Constructor lebih efisien karena membuat kode menjadi lebih singkat, rapi, dan mudah dikelola
