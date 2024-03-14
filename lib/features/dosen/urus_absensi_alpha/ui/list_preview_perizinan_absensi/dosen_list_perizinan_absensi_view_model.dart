
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/data/repository/fake_perizinan_absensi_repository.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';

class DosenListPerizinanAbsensiViewModel {
  final _repo = FakePerizinanAbsensiRepository();

  Future<void> onRequestListPaginated({
    required int pageNumber,
    required void Function(ApiResponse<List<PreviewPerizinanAbsensiForDosen>>)
      onResult,
  }) async {
    final result = await _repo.getPreviewPengajuanAbsensi_ForDosen_Paginated(
        pageNumber
    );
    onResult(result);
  }


}
