import 'dart:convert'; // Mengimpor pustaka 'dart:convert' untuk pengolahan JSON.

void main() { // Fungsi utama yang akan dieksekusi saat program dijalankan.

  // JSON yang berisi transkrip mahasiswa.
  String transkripJson = '''
  {
    "nama": "Fidyah Salsabila Putri Sillehu",
    "NPM": "22082010047",
    "jurusan": "Sistem Informasi",
    "mata_kuliah": [
      {
        "kode": "B082",
        "nama": "E-Business",
        "sks": 3,
        "nilai": "A-"
      },
      {
        "kode": "B082",
        "nama": "Pengukuran Kinerja Teknologi Informasi",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "B082",
        "nama": "Statistik Komputasi",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "B082",
        "nama": "Kecakapan Pribadi",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "B082",
        "nama": "Pemrograman Web",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "B082",
        "nama": "Pemrograman Mobile",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "B082",
        "nama": "Manajemen Proyek Sistem Informasi",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "G461",
        "nama": "Kepemimpinan",
        "sks": 3,
        "nilai": "A"
      }
    ]
  }
  ''';

  // Konversi JSON menjadi Map.
  Map<String, dynamic> transkrip = jsonDecode(transkripJson);

  // Hitung IPK berdasarkan transkrip mahasiswa.
  double ipk = hitungIPK(transkrip);

  // Cetak IPK.
  print("IPK: $ipk\n");

  // Cetak informasi mahasiswa.
  print("Informasi Mahasiswa:");
  print("Nama: ${transkrip['nama']}");
  print("NPM: ${transkrip['NPM']}");
  print("Jurusan: ${transkrip['jurusan']}");
}

// Fungsi untuk menghitung IPK berdasarkan transkrip mahasiswa.
double hitungIPK(Map<String, dynamic> transkrip) {
  double totalSKS = 0; // Inisialisasi total SKS.
  double totalBobot = 0; // Inisialisasi total bobot.

  // Ambil daftar mata kuliah dari transkrip.
  List<dynamic> mataKuliah = transkrip['mata_kuliah'];
  // Konversi tipe data list menjadi list dari Map<String, dynamic>.
  List<Map<String, dynamic>> mataKuliahTyped =
      List<Map<String, dynamic>>.from(mataKuliah);

  // Iterasi melalui setiap mata kuliah dalam transkrip.
  for (var matkul in mataKuliahTyped) {
    int sks = matkul['sks']; // Ambil jumlah SKS dari mata kuliah.
    String nilai = matkul['nilai']; // Ambil nilai dari mata kuliah.

    double bobot;
    // Tentukan bobot sesuai dengan nilai.
    if (nilai == 'A') {
      bobot = 4.0;
    } else if (nilai == 'A-') {
      bobot = 3.7;
    } else if (nilai == 'B+') {
      bobot = 3.3;
    } else if (nilai == 'B') {
      bobot = 3.0;
    } else if (nilai == 'B-') {
      bobot = 2.7;
    } else if (nilai == 'C+') {
      bobot = 2.3;
    } else if (nilai == 'C') {
      bobot = 2.0;
    } else if (nilai == 'C-') {
      bobot = 1.7;
    } else if (nilai == 'D+') {
      bobot = 1.3;
    } else if (nilai == 'D') {
      bobot = 1.0;
    } else {
      bobot = 0.0;
    }

    // Hitung total SKS dan total bobot.
    totalSKS += sks;
    totalBobot += sks * bobot;
  }

  // Hitung IPK.
  if (totalSKS == 0) {
    return 0.0;
  } else {
    return totalBobot / totalSKS;
  }
}