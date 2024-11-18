import 'package:flutter/material.dart';
import 'package:kehadiran_mahasiswa/Models/mahasiswa.dart';

class mahaSiswas extends StatelessWidget{
  final Mahasiswa mahasiswa;

  mahaSiswas (this.mahasiswa);
  @override
  Widget build (BuildContext context){
    return ListTile(
      title: Text(mahasiswa.Nama),
      trailing: Checkbox(value: mahasiswa.Hadir, onChanged:(val){
        mahasiswa.Hadir = val ?? false;
      }),
    );
  }
}