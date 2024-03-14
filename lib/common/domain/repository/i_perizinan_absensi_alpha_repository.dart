import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/domain/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';

/// repository untuk menangani data-data perizinan absensi alpha
abstract class IPengajuanPerizinanAbsensiAlphaRepository {

  /// Mendapatkan list pengajuan absensi yang sudah ter-paginasi
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>>
    getPreviewPengajuanAbsensi_ForMahasiswa_Paginated(int pageNumber , FilterState filter);

  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>>
    getPreviewPengajuanAbsensi_ForDosen_Paginated(int pageNumber);

  Stream<ApiResponse<DetailPerizinanAbsensiForDosen>>
    getDetailPerizinanAbsensiForDosen(int pengajuanId);

  Stream<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data);
}