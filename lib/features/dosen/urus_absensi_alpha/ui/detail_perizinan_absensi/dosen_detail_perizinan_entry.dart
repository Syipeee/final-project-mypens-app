import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/data/repository/fake_perizinan_absensi_repository.dart';
import 'package:mypens/common/user_interface/api_response_loader.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/dosen_detail_perizinan_absensi_screen.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/dosen_detail_perizinan_absensi_view_model.dart';

class DosenDetailAbsensiAlphaEntry extends StatelessWidget {
  final int _idPengajuan;
  const DosenDetailAbsensiAlphaEntry({
    required int idPengajuan,
    super.key,
  }) : _idPengajuan = idPengajuan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DosenDetailAbsensiAlphaViewModel(
        repository: FakePerizinanAbsensiRepository(),
        pengajuanId: _idPengajuan
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Perizinan'),
        ),
        body: BlocBuilder
          <DosenDetailAbsensiAlphaViewModel , DosenDetailAbsensiAlphaState>(
          builder: (context , DosenDetailAbsensiAlphaState state) {
            final viewModel = context.read<DosenDetailAbsensiAlphaViewModel>();
            return Center(
              child: ApiResponseLoader(
                apiResponse: state.detailDataAbsensi,
                onRefresh: () => 
                  viewModel.add(OnReloadDetailPerizinan()),
                childBuilder: (data) => 
                  DosenDetailPerizinanScreen(data: data), 
              ),
            );
          }
        )
      ),
    );
  }
}
