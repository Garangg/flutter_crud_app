import 'package:flutter/material.dart';
import 'package:flutter_crud_app/model/mahasiswa_vm.dart';
import 'package:flutter_crud_app/model/mahasiswa_model.dart';
import 'package:flutter_crud_app/pages/add_mahasiswa_page.dart';

import 'detail_mahasiswa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MahasiswaModel> dataMahasiswa = [];
  MahasiswaVM mahasiswaVM = MahasiswaVM();

  void getDataMahasiswa() async {
    try {
      List<MahasiswaModel> mahasiswa = await mahasiswaVM.getMahasiswa();
      setState(() {
        dataMahasiswa = mahasiswa;
      });
    } catch (e) {
      print("Error getting data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getDataMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 192, 242, 255),
        title: const Text('Data Mahasiswa'),
      ),
      body: dataMahasiswa.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder(
              future: mahasiswaVM.getMahasiswa(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: dataMahasiswa.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        dataMahasiswa: dataMahasiswa[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: const Color.fromARGB(255, 245, 253, 255),
                                  child: ListTile(
                                    title: Text(dataMahasiswa[index].nama),
                                    subtitle: Text(dataMahasiswa[index].nim),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[400],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMahasiswa(
                nama: '',
                nim: '',
                prodi: '',
                agama: '',
                jenisKelamin: '',
                alamat: '',
                asalSekolah: '',
                tahun: '',
                tempatLahir: '',
                tanggalLahir: '',
              ),
            ),
          );
        },
        label: const Text('Tambah Data', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
