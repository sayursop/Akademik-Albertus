import 'mahasiswa.dart';
import 'matakuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS(this.mahasiswa, this.daftarMataKuliah);

  void cetakKRS() {
    print("\n=== KRS Mahasiswa ===");
    print("Nama: ${mahasiswa.nama}");
    print("NIM: ${mahasiswa.nim}");
    print("Semester: ${mahasiswa.semester}");
    print("\nMata Kuliah yang Diambil:");
    for (var mk in daftarMataKuliah) {
      print("- ${mk.kode}: ${mk.nama} (${mk.sks} SKS)");
    }
  }
}
  