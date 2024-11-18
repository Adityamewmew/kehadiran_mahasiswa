import 'package:flutter/material.dart';
import 'package:kehadiran_mahasiswa/Models/record_mahasiswa.dart';
import 'package:kehadiran_mahasiswa/Providers/plan_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiran = planProvider.getAttendanceRecords(context);

    return Scaffold(
      appBar: AppBar(title: Text('History Absen')),
      body: ValueListenableBuilder<List<recordMahasiswa>>(
        valueListenable: kehadiran,
        builder: (context, history, _) {
          if (history.isEmpty) {
            return Center(child: Text('Tidak ada yang absen'));
          }
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (ctx, i) {
              final record = history[i];
              return ListTile(
                title: Text('Tanggal: ${record.date}'),
                subtitle: Text('Hadir: ${record.daftarhadir.map((s) => s.Nama).join(', ')}'),
              );
            },
          );
        },
      ),
    );
  }
}