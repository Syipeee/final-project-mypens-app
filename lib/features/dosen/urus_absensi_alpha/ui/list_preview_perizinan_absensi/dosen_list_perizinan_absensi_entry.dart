import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_screen.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_view_model.dart';
import 'package:provider/provider.dart';

class DosenListPerizinanAbsensiEntry extends StatelessWidget {
  const DosenListPerizinanAbsensiEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => DosenListPerizinanAbsensiViewModel(),
      child: const DosenListPerizinanAbsensiScreen(),
    );
  }
}
