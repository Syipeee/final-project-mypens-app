

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/domain/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/domain/repository/i_perizinan_absensi_alpha_repository.dart';

class DosenDetailAbsensiAlphaViewModel extends
  Bloc<DosenDetailAbsensiAlphaEvent , DosenDetailAbsensiAlphaState> {

  final IPengajuanPerizinanAbsensiAlphaRepository _repository;
  final int _pengajuanId;

  DosenDetailAbsensiAlphaViewModel({
    required IPengajuanPerizinanAbsensiAlphaRepository repository,
    required int pengajuanId,
  }) : _repository = repository,
      _pengajuanId = pengajuanId,
      super(
        DosenDetailAbsensiAlphaState(
          detailDataAbsensi: ApiResponseLoading()
        )
      ){
        on(_onReloadDetailPerizinan);

        add(OnReloadDetailPerizinan());
      }
  
  void _onReloadDetailPerizinan(
    OnReloadDetailPerizinan event,
    Emitter<DosenDetailAbsensiAlphaState> emit,
  ) async {
    await _repository.getDetailPerizinanAbsensiForDosen(_pengajuanId).forEach(
      (apiResponse) {
        emit(state.copy(detailDataAbsensi: apiResponse));
      }
    );
  }



}

class DosenDetailAbsensiAlphaState {
  final ApiResponse<DetailPerizinanAbsensiForDosen> detailDataAbsensi;
  final DetailAbsensiShowDialog showDialog;

  DosenDetailAbsensiAlphaState({
    required this.detailDataAbsensi,
    this.showDialog = DetailAbsensiShowDialog.none,
  });

  DosenDetailAbsensiAlphaState copy({
    ApiResponse<DetailPerizinanAbsensiForDosen>? detailDataAbsensi,
    DetailAbsensiShowDialog? showDialog,
  }){
    return DosenDetailAbsensiAlphaState(
      detailDataAbsensi: detailDataAbsensi ?? this.detailDataAbsensi,
      showDialog: showDialog ?? this.showDialog,
    );
  }
}

enum DetailAbsensiShowDialog {
  none, reject, accept
}

sealed class DosenDetailAbsensiAlphaEvent {}
class OnReloadDetailPerizinan extends DosenDetailAbsensiAlphaEvent {}
