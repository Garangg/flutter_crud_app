import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud_app/model/mahasiswa_model.dart';
import 'package:flutter_crud_app/model/mahasiswa_vm.dart';
import 'package:flutter_crud_app/pages/home_page.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {super.key,
      required this.id,
      required this.namaAwal,
      required this.nimAwal,
      required this.prodiAwal,
      required this.agamaAwal,
      required this.jenisKelaminAwal,
      required this.alamatAwal,
      required this.asalSekolahAwal,
      required this.tahunAwal,
      required this.tempatLahirAwal,
      required this.tanggalLahirAwal});

  final String id;
  final String namaAwal;
  final String nimAwal;
  final String prodiAwal;
  final String agamaAwal;
  final String jenisKelaminAwal;
  final String alamatAwal;
  final String asalSekolahAwal;
  final String tahunAwal;
  final String tempatLahirAwal;
  final String tanggalLahirAwal;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController prodiController;
  late TextEditingController agamaController;
  late TextEditingController jenisKelaminController;
  late TextEditingController alamatController;
  late TextEditingController asalSekolahController;
  late TextEditingController tahunController;
  late TextEditingController tempatLahirController;
  late TextEditingController tanggalLahirController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.namaAwal);
    nimController = TextEditingController(text: widget.nimAwal);
    prodiController = TextEditingController(text: widget.prodiAwal);
    agamaController = TextEditingController(text: widget.agamaAwal);
    jenisKelaminController =
        TextEditingController(text: widget.jenisKelaminAwal);
    alamatController = TextEditingController(text: widget.alamatAwal);
    asalSekolahController = TextEditingController(text: widget.asalSekolahAwal);
    tahunController = TextEditingController(text: widget.tahunAwal);
    tempatLahirController = TextEditingController(text: widget.tempatLahirAwal);
    tanggalLahirController =
        TextEditingController(text: (widget.tanggalLahirAwal));
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    prodiController.dispose();
    agamaController.dispose();
    jenisKelaminController.dispose();
    alamatController.dispose();
    asalSekolahController.dispose();
    tahunController.dispose();
    tempatLahirController.dispose();
    tanggalLahirController.dispose();
    super.dispose();
  }

  void updateMahasiswa() async {
    try {
      // Validate and convert agama
      if (!agamaValues.map.containsKey(agamaController.text)) {
        throw Exception('Invalid agama value: ${agamaController.text}');
      }
      final agama = agamaValues.map[agamaController.text]!;

      // Validate and convert jenisKelamin
      if (!jenisKelaminValues.map.containsKey(jenisKelaminController.text)) {
        throw Exception(
            'Invalid jenisKelamin value: ${jenisKelaminController.text}');
      }
      final jenisKelamin = jenisKelaminValues.map[jenisKelaminController.text]!;

      // Parse tanggalLahir
      DateTime parsedTanggalLahir =
          DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text);

      MahasiswaModel mahasiswa = MahasiswaModel(
        id: widget.id,
        nama: namaController.text,
        nim: nimController.text,
        prodi: prodiController.text,
        agama: agama,
        jenisKelamin: jenisKelamin,
        alamat: alamatController.text,
        asalSekolah: asalSekolahController.text,
        tahun: tahunController.text,
        tempatLahir: tempatLahirController.text,
        tanggalLahir: parsedTanggalLahir,
      );

      print('Request payload: ${jsonEncode({
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
            'tanggal_lahir': mahasiswa.tanggalLahir.toString(),
          })}');

      MahasiswaVM()
          .updateMahasiswa(mahasiswa, widget.id)
          .then((value) => value);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("Error updating mahasiswa: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blue[300],
        title: const Text('Edit Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Text('Nama',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('NIM',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Prodi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: prodiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Agama',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: agamaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: jenisKelaminController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Alamat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Asal Sekolah',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: asalSekolahController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Tahun Lulus',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: tahunController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Tempat Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: tempatLahirController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Tanggal Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: tanggalLahirController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
              ),
              onPressed: () {
                updateMahasiswa();
              },
              child:
                  const Text('Update', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
