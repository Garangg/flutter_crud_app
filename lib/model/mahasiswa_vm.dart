import 'package:http/http.dart' as http;
import 'dart:convert';
import './mahasiswa_model.dart';

class MahasiswaVM {
  Future<List<MahasiswaModel>> getMahasiswa() async {
    try {
      http.Response hasil = await http
          .get(Uri.parse('http://10.0.2.2/mahasiswa_api/read.php'), headers: {
        'Accept': 'application/json',
      });

      if (hasil.statusCode == 200) {
        print("Data berhasil diambil: ${hasil.body}");
        List<dynamic> jsonList = json.decode(hasil.body);
        List<MahasiswaModel> mahasiswaList =
            jsonList.map((json) => MahasiswaModel.fromJson(json)).toList();
        return mahasiswaList;
      } else {
        throw Exception('Failed to load mahasiswa');
      }
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future deleteMahasiswa(String id) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2/mahasiswa_api/delete.php'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'id': id}),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete mahasiswa');
    }
  }

Future addMahasiswa(MahasiswaModel mahasiswa) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2/mahasiswa_api/create.php'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'prodi': mahasiswa.prodi,
        'agama': mahasiswa.agama.toString().split('.').last,
        'jenis_kelamin': mahasiswa.jenisKelamin.toString().split('.').last,
        'alamat': mahasiswa.alamat,
        'asal_sekolah': mahasiswa.asalSekolah,
        'tahun': mahasiswa.tahun,
        'tempat_lahir': mahasiswa.tempatLahir,
        'tanggal_lahir': mahasiswa.tanggalLahir.toIso8601String(), // Correct date format
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to add mahasiswa');
    }
  }

  Future<String> updateMahasiswa(MahasiswaModel mahasiswa, String text) async {
    try {
      final body = jsonEncode({
        'id': mahasiswa.id,
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'prodi': mahasiswa.prodi,
        'agama': mahasiswa.agama.toString().split('.').last,
        'jenis_kelamin': mahasiswa.jenisKelamin.toString().split('.').last,
        'alamat': mahasiswa.alamat,
        'asal_sekolah': mahasiswa.asalSekolah,
        'tahun': mahasiswa.tahun,
        'tempat_lahir': mahasiswa.tempatLahir,
        'tanggal_lahir': mahasiswa.tanggalLahir.toIso8601String(),
      });

      http.Response hasil = await http.post(
        Uri.parse('http://10.0.2.2/mahasiswa_api/update.php'),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: body,
      );

      if (hasil.statusCode == 200) {
        print('Update response body: ${hasil.body}');
        return hasil.body;
      } else {
        print('Failed to update mahasiswa. Status code: ${hasil.statusCode}');
        print('Response body: ${hasil.body}');
        throw Exception(
            'Failed to update mahasiswa. Status code: ${hasil.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to update mahasiswa. Exception: $e');
    }
  }
}
