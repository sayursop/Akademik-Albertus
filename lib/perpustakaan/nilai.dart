import 'matakuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);
}

class Transkrip {
  List<Nilai> daftarNilai;

  Transkrip(this.daftarNilai);

  double hitungIPK() {
    if (daftarNilai.isEmpty) return 0.0;
    double totalBobot = 0.0;
    int totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalBobot += nilai.nilai * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalSKS == 0 ? 0.0 : totalBobot / totalSKS;
  }

  void cetakTranskrip(String namaMahasiswa, String nim) {
    print("\n=== Transkrip Nilai ===");
    print("Nama: $namaMahasiswa");
    print("NIM: $nim");
    print("\nDaftar Nilai:");
    for (var nilai in daftarNilai) {
      print("- ${nilai.mataKuliah.kode}: ${nilai.mataKuliah.nama} (${nilai.mataKuliah.sks} SKS) - Nilai: ${nilai.nilai}");
    }
    print("IPK: ${hitungIPK().toStringAsFixed(2)}");
  }
}
