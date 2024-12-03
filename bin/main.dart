import 'dart:io';
import '../lib/perpustakaan/mahasiswa.dart';
import '../lib/perpustakaan/matakuliah.dart';
import '../lib/perpustakaan/krs.dart';
import '../lib/perpustakaan/nilai.dart';

void main() {
  Mahasiswa? mahasiswa; // Mahasiswa awal kosong, akan diisi melalui input
  List<MataKuliah> daftarMataKuliah = [
    MataKuliah("MK001", "Matematika", 3),
    MataKuliah("MK002", "Pemrograman", 4),
    MataKuliah("MK003", "Fisika", 2),
  ];

  KRS? krs;
  List<Nilai> daftarNilai = [];
  var transkrip = Transkrip(daftarNilai);

  while (true) {
    print("\n=== Sistem Akademik ===");
    print("1. Input Data Mahasiswa");
    print("2. Cetak KRS");
    print("3. Input Nilai Mahasiswa");
    print("4. Lihat Transkrip Nilai");
    print("5. Keluar");
    stdout.write("Pilih menu: ");
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case "1":
        print("\n=== Input Data Mahasiswa ===");
        stdout.write("Masukkan NIM: ");
        String nim = stdin.readLineSync()!;
        stdout.write("Masukkan Nama: ");
        String nama = stdin.readLineSync()!;
        stdout.write("Masukkan Semester: ");
        int semester = int.parse(stdin.readLineSync()!);

        mahasiswa = Mahasiswa(nim, nama, semester);
        krs = KRS(mahasiswa, daftarMataKuliah); // Perbarui KRS setelah mahasiswa diinput
        print("Data mahasiswa berhasil disimpan!");
        break;

      case "2":
        if (krs == null) {
          print("Data mahasiswa belum diinput. Harap input data mahasiswa terlebih dahulu.");
        } else {
          krs.cetakKRS();
        }
        break;

      case "3":
        if (mahasiswa == null) {
          print("Data mahasiswa belum diinput. Harap input data mahasiswa terlebih dahulu.");
          break;
        }

        print("\n=== Input Nilai Mahasiswa ===");
        for (int i = 0; i < daftarMataKuliah.length; i++) {
          print("${i + 1}. ${daftarMataKuliah[i].kode} - ${daftarMataKuliah[i].nama}");
        }
        stdout.write("Pilih mata kuliah (nomor): ");
        int pilihanMK = int.parse(stdin.readLineSync()!) - 1;

        if (pilihanMK < 0 || pilihanMK >= daftarMataKuliah.length) {
          print("Pilihan tidak valid.");
          break;
        }

        stdout.write("Masukkan nilai: ");
        double nilai = double.parse(stdin.readLineSync()!);

        daftarNilai.add(Nilai(daftarMataKuliah[pilihanMK], nilai));
        print("Nilai berhasil ditambahkan.");
        break;

      case "4":
        if (mahasiswa == null) {
          print("Data mahasiswa belum diinput. Harap input data mahasiswa terlebih dahulu.");
          break;
        }

        transkrip.cetakTranskrip(mahasiswa.nama, mahasiswa.nim);
        break;

      case "5":
        print("Sistem ditutup. Terima kasih!");
        exit(0);

      default:
        print("Pilihan tidak valid. Coba lagi.");
    }
  }
}
