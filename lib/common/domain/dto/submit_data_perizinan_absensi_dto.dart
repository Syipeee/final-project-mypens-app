import 'package:intl/intl.dart';
import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';

class SubmitDataPerizinanDto {
  final int nomorMahasiswa;
  final String nomorKuliah;
  final int minggu;
  final DateTime tanggal;
  final String statusYangDiinginkan;
  final String linkBuktiFile;
  final String keterangan;
  SubmitDataPerizinanDto({
    required this.nomorMahasiswa,
    required this.nomorKuliah,
    required this.minggu,
    required this.tanggal,
    required this.statusYangDiinginkan,
    required this.linkBuktiFile,
    required this.keterangan,
  });

  Map<String , dynamic> toJson(){
    return {
      'mahasiswa' : nomorMahasiswa,
      'kuliah' : nomorKuliah,
      'status_penerimaan' : StatusPenerimaanPerizinan.menunggu.id,
      'minggu' : minggu,
      'tanggal' : {
        'type' : 'date',
        'value' : DateFormat('yyyy-MM-dd').format(tanggal)
      },
      'status_yang_diinginkan' : statusYangDiinginkan,
      'link_bukti_file' : linkBuktiFile,
      'keterangan' : keterangan,
    };
  }

}