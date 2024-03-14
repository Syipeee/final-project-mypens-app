import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/filter_state.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/repository/i_perizinan_absensi_alpha_repository.dart';

class HistoryPengajuanViewModel extends
  Bloc<HistoryPengajuanUiEvent , HistoryPengajuanUiState> {

  final IPengajuanPerizinanAbsensiAlphaRepository _repository;

  HistoryPengajuanViewModel({
    required IPengajuanPerizinanAbsensiAlphaRepository repository,
  }) : _repository = repository,
        super(HistoryPengajuanUiState())
      {
        pagingController.addPageRequestListener(_fetchPage);
      }




  final pagingController = PagingController<int , PreviewPerizinanAbsensiForMahasiswa>(
    firstPageKey: 1
  );

  Future<void> _fetchPage(int pageNumber) async {
    final result = await _repository.getPreviewPengajuanAbsensi_ForMahasiswa_Paginated(
      pageNumber,
      state.filterState,
    );

    if (_isClosed){ return; }

    if (result is ApiResponseSucceed){
      final succeedResult = result as ApiResponseSucceed<List<PreviewPerizinanAbsensiForMahasiswa>>;
      if (succeedResult.isNextDataExists){
        pagingController.appendPage(succeedResult.data!, pageNumber + 1);
      } else {
        pagingController.appendLastPage(succeedResult.data!);
      }
    } else if (result is ApiResponseFailed) {
      pagingController.error =
        (result as ApiResponseFailed).exception ?? Exception("Unknown Error");
    }
  }


  bool _isClosed = false;

  @override
  Future<void> close() {
    _isClosed = true;
    pagingController.dispose();
    return super.close();
  }
}

class HistoryPengajuanUiState {
  final FilterState filterState;

  HistoryPengajuanUiState({
    FilterState? filterState,
  }) : filterState = filterState ?? FilterState();
}

sealed class HistoryPengajuanUiEvent{}

class RefreshPagination extends HistoryPengajuanUiEvent {
  RefreshPagination({required int pageNumber}) : super();
}