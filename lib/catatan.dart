class Catatan {
  String judul;
  String isi;

  Catatan(
    this.judul,
    this.isi,
  );

  static List<Catatan> dataDummy = [
    Catatan(
      "25 Oktober 2023",
      "Hari ini ada tugas mata kuliah Pemrograman Perangkat Bergerak, membuat aplikasi catatan.",
    ),
  ];
}
