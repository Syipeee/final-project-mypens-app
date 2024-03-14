import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';

class DetailPerizinanAbsensiForDosen {
  final String dibuatPada;
  final StatusPenerimaanPerizinan statusPenerimaan;
  final String namaMatkul;
  final String tanggalPerkuliahan;
  final int mingguKeMatkul;
  final String statusYangDiinginkan;
  final String? keterangan;
  final String urlBuktiFile;

  DetailPerizinanAbsensiForDosen({
    required this.dibuatPada,
    required this.statusPenerimaan,
    required this.namaMatkul,
    required this.tanggalPerkuliahan,
    required this.mingguKeMatkul,
    required this.statusYangDiinginkan,
    required this.keterangan,
    required this.urlBuktiFile,
  });
}