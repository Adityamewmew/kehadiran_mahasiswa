import 'package:flutter/material.dart';
import 'package:kehadiran_mahasiswa/Models/mahasiswa.dart';
import 'package:kehadiran_mahasiswa/Models/record_mahasiswa.dart';
import 'package:kehadiran_mahasiswa/Providers/plan_provider.dart';
import 'package:kehadiran_mahasiswa/Views/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mahasiswaNotif = ValueNotifier<List<Mahasiswa>>([
      Mahasiswa(Nama: 'Aditya',Hadir: true),
      Mahasiswa(Nama: 'Mewtwo',Hadir: false),
      Mahasiswa(Nama: 'Jihyo',Hadir: true),
    ]);

    final kehadiran = ValueNotifier<List<recordMahasiswa>>([]);

    return planProvider(
      notifier: mahasiswaNotif,
      kehadiran: kehadiran ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}