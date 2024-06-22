import 'package:flutter/material.dart';
import 'package:flutter_crud_app/model/mahasiswa_model.dart';
import 'package:flutter_crud_app/model/mahasiswa_vm.dart';
import 'package:flutter_crud_app/pages/home_page.dart';
import 'package:intl/intl.dart';

class AddMahasiswa extends StatefulWidget {
  const AddMahasiswa(
      {super.key,
      required this.nama,
      required this.nim,
      required this.prodi,
      required this.agama,
      required this.jenisKelamin,
      required this.alamat,
      required this.asalSekolah,
      required this.tahun,
      required this.tempatLahir,
      required this.tanggalLahir});

  final String nama;
  final String nim;
  final String prodi;
  final String agama;
  final String jenisKelamin;
  final String alamat;
  final String asalSekolah;
  final String tahun;
  final String tempatLahir;
  final String tanggalLahir;

  @override
  State<AddMahasiswa> createState() => _AddMahasiswaState();
}

class _AddMahasiswaState extends State<AddMahasiswa> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController asalSekolahController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();

  void addMahasiswa() async {
    final agama = agamaValues.map[agamaController.text]!;
    final jenisKelamin = jenisKelaminValues.map[jenisKelaminController.text]!;
    DateTime tanggalLahir =
        DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text);

    MahasiswaVM()
        .addMahasiswa(MahasiswaModel(
      nama: namaController.text,
      nim: nimController.text,
      prodi: prodiController.text,
      agama: agama,
      jenisKelamin: jenisKelamin,
      alamat: alamatController.text,
      asalSekolah: asalSekolahController.text,
      tahun: tahunController.text,
      tempatLahir: tempatLahirController.text,
      tanggalLahir: tanggalLahir,
    ))
        .then((value) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.green[300],
        title: const Text('Tambah Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
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
                hintText: "yyyy-MM-dd",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.green[300]),
              ),
              onPressed: addMahasiswa,
              child:
                  const Text('Tambah', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
