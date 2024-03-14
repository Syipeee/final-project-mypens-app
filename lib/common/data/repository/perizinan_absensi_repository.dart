import 'dart:convert';

import 'package:mypens/common/data/api_client/perizinan_absensi_api_client.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/domain/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/common/domain/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/repository/i_perizinan_absensi_alpha_repository.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';

class PerizinanAbsensiRepository implements IPengajuanPerizinanAbsensiAlphaRepository{
  final _apiClient = PerizinanAbsensiApiClient();
  @override
  Stream<ApiResponse<DetailPerizinanAbsensiForDosen>> getDetailPerizinanAbsensiForDosen(int pengajuanId) {
    // TODO: implement getDetailPerizinanAbsensiForDosen
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForDosen>>> getPreviewPengajuanAbsensi_ForDosen_Paginated(int pageNumber) {
    // TODO: implement getPreviewPengajuanAbsensi_ForDosen_Paginated
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<PreviewPerizinanAbsensiForMahasiswa>>> getPreviewPengajuanAbsensi_ForMahasiswa_Paginated(int pageNumber, FilterState filter) {
    // TODO: implement getPreviewPengajuanAbsensi_ForMahasiswa_Paginated
    throw UnimplementedError();
  }

  @override
  Stream<ApiResponse<SubmitDataPerizinanDto>> submitData(SubmitDataPerizinanDto data) async*{
    yield ApiResponseLoading();
    try {
      final response = await _apiClient.submitData(data);
      final jsonBody = jsonDecode(response.body);
      yield jsonBody['status'] == 'sukses' ?
          ApiResponseSucceed() : throw Exception(response.body);
    } on Exception catch(e) {
      yield ApiResponseFailed(exception: e);
    }
  }

}