import 'dart:convert';

import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah.dart';

class MataKuliahMapper {
  List<MataKuliah> getListMataKuliahFromBody(String body){
    final jsonBody = jsonDecode(body);
    final listData = jsonBody['data'];

    return listData.map((item) =>
      MataKuliah(
        idMatkul: item['KODE'],
        namaMatkul: item['MATAKULIAH'],
      ),
    ).cast<MataKuliah>().toList();
  }
}