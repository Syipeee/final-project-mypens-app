import 'dart:math';

import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/domain/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';
import 'package:mypens/common/domain/repository/i_perizinan_absensi_alpha_repository.dart';

class FakePerizinanAbsensiRepository extends IPengajuanPerizinanAbsensiAlphaRepository {

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>>
    getPreviewPengajuanAbsensi_ForMahasiswa_Paginated(
      int pageNumber,
      FilterState filter
    ) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (_rand.nextInt(10) < 4) {
      return ApiResponseFailed(exception: Exception('Koneksi Gagal'));
    } else {
      return ApiResponseSucceed(
        data: List.generate(20, (index) =>
          PreviewPerizinanAbsensiForMahasiswa(
            dibuatPada: "${index + 1} Januari 2023",
            namaMatkul: _getRandomListMatkul(),
            tanggalMatkul: "${index + 1} November 2021",
            mingguMatkul: 3,
            status: _getRandomStatus()
          )
        ),
        isNextDataExists: pageNumber == 3 ? false : true,
      );
    }
  }

  static final _rand = Random();

  final _listMatkul = [
    'Workshop Pemrograman Perangkat Bergerak',
    'Workshop Pengembangan Perangkat Lunak Berbasis Agile',
    'Basis Data Lanjutan',
    'Basis Data',
    'Pengenalan Teknologi Informasi'
  ];

  String _getRandomListMatkul(){
    return _listMatkul[_rand.nextInt(_listMatkul.length)];
  }

  StatusPenerimaanPerizinan _getRandomStatus(){
    switch (_rand.nextInt(3)){
      case 0:
        return StatusPenerimaanPerizinan.diterima;
      case 1:
        return StatusPenerimaanPerizinan.ditolak;
      case 2:
        return StatusPenerimaanPerizinan.menunggu;
      default:
        throw Exception("Unexpected random number");
    }
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>> getPreviewPengajuanAbsensi_ForDosen_Paginated(
    int pageNumber
  ) {
    return Future.delayed(
      const Duration(milliseconds: 1500) , () => ApiResponseSucceed(
      data: List.generate(20, (index) =>
        PreviewPerizinanAbsensiForDosen(
          tanggalMatkul: 'Senin, 31 Januari 2024',
          namaMatkul: _listMatkul[_rand.nextInt(_listMatkul.length)],
          mahasiswaPengaju: _listMahasiswa[_rand.nextInt(_listMahasiswa.length)],
          status: StatusPenerimaanPerizinan.values[_rand.nextInt(3)]
        ),
      ),
      isNextDataExists: pageNumber < 2,
    ));
  }

  final _listMahasiswa = [
    'Bagus Anggriawan',
    'Nur Wachid',
    'Hezbi Sulaiman',
    'Nuril Huda',
  ];

  @override
  Stream<ApiResponse<DetailPerizinanAbsensiForDosen>>
    getDetailPerizinanAbsensiForDosen(int pengajuanId) async* {
    yield ApiResponseLoading();
    await Future.delayed(const Duration(milliseconds: 1500));

    yield ApiResponseSucceed(
      data: DetailPerizinanAbsensiForDosen(
        dibuatPada: 'Senin, 28 Agustus 2023, 14.00 WIB',
        statusPenerimaan: StatusPenerimaanPerizinan.menunggu,
        namaMatkul: 'Workshop Pengembangan Perangkat Lunak Berbasis Agile',
        tanggalPerkuliahan: '22 April 2023',
        mingguKeMatkul: 8,
        statusYangDiinginkan: 'Izin',
        keterangan: '-',
        urlBuktiFile: 'https://drive.google.com/file/d/15JPFeYFW1ol4c-2ANZY2HzEHqlixIhyH/view?usp=sharing'
      ),
    );
  }

  @override
  Stream<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data) {
    // TODO: implement submitData
    throw UnimplementedError();
  }



}