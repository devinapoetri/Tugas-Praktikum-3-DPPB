class Mobil {
  String merk;
  String warna;
  int kecepatan;

  Mobil(this.merk, this.warna, this.kecepatan);

  void jalan() {
    print("Mobil $merk melaju dengan kecepatan $kecepatan km/jam");
  }

  void ubahKecepatan(int nilai) {
    if (nilai >= 0) {
      kecepatan = nilai;
      print("Kecepatan mobil diubah menjadi $kecepatan km/jam");
    } else {
      print("Error: Kecepatan tidak boleh negatif!");
    }
  }

  void berhenti() {
    print("Mobil $merk berhenti");
  }
}

void main() {
  var mobil1 = Mobil("Toyota", "Merah", 120);
  mobil1.jalan();
  mobil1.ubahKecepatan(100);
  mobil1.ubahKecepatan(-10);
  mobil1.berhenti();

  print("-------------");

  var mobil2 = Mobil("Honda", "Hitam", 100);
  mobil2.jalan();
  mobil2.ubahKecepatan(70);
  mobil2.ubahKecepatan(-20);
  mobil2.berhenti();
}

// program di atas mendefinisikan kelas Mobil dengan atribut merk, warna, dan kecepatan serta metode untuk mengatur perilaku mobil seperti jalan, ubahKecepatan, dan berhenti. 
// Metode ubahKecepatan memeriksa apakah nilai kecepatan yang diberikan negatif dan menampilkan pesan error jika demikian.
// Di dalam fungsi main, dua objek Mobil dibuat dengan merk, warna, dan kecepatan yang berbeda

