import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';

class PreviewPerizinanAbsensiForMahasiswa {
  final String dibuatPada;
  final String namaMatkul;
  final String tanggalMatkul;
  final int mingguMatkul;
  final StatusPenerimaanPerizinan status;

  PreviewPerizinanAbsensiForMahasiswa({
    required this.dibuatPada,
    required this.namaMatkul,
    required this.tanggalMatkul,
    required this.mingguMatkul,
    required this.status,
  });
}