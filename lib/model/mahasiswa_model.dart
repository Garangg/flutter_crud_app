// To parse this JSON data, do
//
//     final mahasiswaModel = mahasiswaModelFromJson(jsonString);

import 'dart:convert';

List<MahasiswaModel> mahasiswaModelFromJson(String str) =>
    List<MahasiswaModel>.from(
        json.decode(str).map((x) => MahasiswaModel.fromJson(x)));

String mahasiswaModelToJson(List<MahasiswaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MahasiswaModel {
  String id;
  String nama;
  String nim;
  String prodi;
  Agama agama;
  JenisKelamin jenisKelamin;
  String alamat;
  String asalSekolah;
  String tahun;
  String tempatLahir;
  DateTime tanggalLahir;

  MahasiswaModel({
    this.id = '',
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.agama,
    required this.jenisKelamin,
    required this.alamat,
    required this.asalSekolah,
    required this.tahun,
    required this.tempatLahir,
    required this.tanggalLahir,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
        id: json["id"],
        nama: json["nama"],
        nim: json["nim"],
        prodi: json["prodi"],
        agama: agamaValues.map[json["agama"]]!,
        jenisKelamin: jenisKelaminValues.map[json["jenis_kelamin"]]!,
        alamat: json["alamat"],
        asalSekolah: json["asal_sekolah"],
        tahun: json["tahun"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nim": nim,
        "prodi": prodi,
        "agama": agamaValues.reverse[agama],
        "jenis_kelamin": jenisKelaminValues.reverse[jenisKelamin],
        "alamat": alamat,
        "asal_sekolah": asalSekolah,
        "tahun": tahun,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
      };
}

enum Agama { Budha, Hindu, Islam, Kristen }

final agamaValues = EnumValues({
  "Budha": Agama.Budha,
  "Hindu": Agama.Hindu,
  "Islam": Agama.Islam,
  "Kristen": Agama.Kristen
});

enum JenisKelamin { Pria, Wanita }

final jenisKelaminValues =
    EnumValues({"Pria": JenisKelamin.Pria, "Wanita": JenisKelamin.Wanita});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
