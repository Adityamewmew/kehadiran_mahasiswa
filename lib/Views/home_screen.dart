import 'package:flutter/material.dart';
import 'package:kehadiran_mahasiswa/Models/mahasiswa.dart';
import 'package:kehadiran_mahasiswa/Providers/plan_provider.dart';
import 'package:kehadiran_mahasiswa/Models/record_mahasiswa.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mahasiswaNotif = planProvider.of(context);
    final kehadiran = planProvider.getAttendanceRecords(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: ValueListenableBuilder<List<Mahasiswa>>(
        valueListenable: mahasiswaNotif,
        builder: (context, students, _) => ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return ListTile(
              title: Text(student.Nama),
              trailing: Checkbox(
                value: student.Hadir,
                onChanged: (value) {
                  students[index] = Mahasiswa(
                    Nama: student.Nama,
                    Hadir: value ?? false,
                  );
                  mahasiswaNotif.value = List.from(students);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final presentStudents = mahasiswaNotif.value.where((s) => s.Hadir).toList();
          if (presentStudents.isNotEmpty) {
            kehadiran.value = [
              ...kehadiran.value,
              recordMahasiswa(
                date: DateTime.now().toString(),
                daftarhadir: presentStudents,
              ),
            ];
            mahasiswaNotif.value = mahasiswaNotif.value.map((s) {
              return Mahasiswa(Nama: s.Nama, Hadir: false);
            }).toList();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${presentStudents.length} siswa yang hadir disimpan!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tidak ada siswa yang hadir!')),
            );
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
