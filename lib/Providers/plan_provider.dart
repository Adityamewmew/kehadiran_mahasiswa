import 'package:flutter/cupertino.dart';
import 'package:kehadiran_mahasiswa/Models/mahasiswa.dart';
import 'package:kehadiran_mahasiswa/Models/record_mahasiswa.dart';

class planProvider extends InheritedNotifier<ValueNotifier<List<Mahasiswa>>> {
  final ValueNotifier<List<recordMahasiswa>> kehadiran;

  const planProvider({
    super.key,
    required Widget child,
    required ValueNotifier<List<Mahasiswa>> notifier,
    required this.kehadiran,
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<List<Mahasiswa>> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<planProvider>()!.notifier!;
  }

  static ValueNotifier<List<recordMahasiswa>> getAttendanceRecords(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<planProvider>()!.kehadiran;
  }
}