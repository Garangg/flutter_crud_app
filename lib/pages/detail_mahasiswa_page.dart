import 'package:flutter/material.dart';
import 'package:flutter_crud_app/model/mahasiswa_model.dart';
import 'package:flutter_crud_app/model/mahasiswa_vm.dart';
import 'package:flutter_crud_app/pages/home_page.dart';
import 'package:flutter_crud_app/pages/update_mahasiswa_page.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final MahasiswaModel dataMahasiswa;

  MahasiswaVM mahasiswaVM = MahasiswaVM();

  DetailPage({super.key, required this.dataMahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Mahasiswa'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPage(
                      namaAwal: dataMahasiswa.nama,
                      nimAwal: dataMahasiswa.nim,
                      prodiAwal: dataMahasiswa.prodi,
                      agamaAwal: dataMahasiswa.agama.name,
                      jenisKelaminAwal: dataMahasiswa.jenisKelamin.name,
                      alamatAwal: dataMahasiswa.alamat,
                      asalSekolahAwal: dataMahasiswa.asalSekolah,
                      tahunAwal: dataMahasiswa.tahun,
                      tempatLahirAwal: dataMahasiswa.tempatLahir,
                      tanggalLahirAwal: DateFormat('yyyy-MM-dd')
                          .format(dataMahasiswa.tanggalLahir),
                      id: dataMahasiswa.id,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: FutureBuilder(
          future: mahasiswaVM.getMahasiswa(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        // Menggunakan Expanded
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 227, 185),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(dataMahasiswa.nama,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700)),
                              Text(dataMahasiswa.nim,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Expanded(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Jurusan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.prodi),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Alamat',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.alamat),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Jenis Kelamin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle:
                                          Text(dataMahasiswa.jenisKelamin.name),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Agama',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.agama.name),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Tanggal Lahir',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(dataMahasiswa.tanggalLahir),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Tempat Lahir',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.tempatLahir),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Asal Sekolah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.asalSekolah),
                                    ),
                                  ),
                                  Card(
                                    color: Color.fromARGB(255, 245, 253, 255),
                                    child: ListTile(
                                      title: const Text('Tahun Lulus',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(dataMahasiswa.tahun),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red[400],
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.red[300],
                  title: const Text('Peringatan',
                      style: TextStyle(color: Colors.white)),
                  content: const Text(
                      'Apakah Anda yakin ingin menghapus data ini?',
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Batal',
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () async {
                        await mahasiswaVM.deleteMahasiswa(dataMahasiswa.id);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: const Text('Hapus',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            );
          },
          label:
              const Text('Hapus Data', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.delete, color: Colors.white),
        ));
  }
}
