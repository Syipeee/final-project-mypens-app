import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';

class PreviewPerizinanAbsensiForDosen {
  final String tanggalMatkul;
  final String namaMatkul;
  final String mahasiswaPengaju;
  final StatusPenerimaanPerizinan status;

  PreviewPerizinanAbsensiForDosen({
    required this.tanggalMatkul,
    required this.namaMatkul,
    required this.mahasiswaPengaju,
    required this.status,
  });
}