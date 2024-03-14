import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/common/data/repository/fake_perizinan_absensi_repository.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/component/kartu_preview_pengajuan.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/history_pengajuan_view_model.dart';

class HistoryPengajuanScreen extends StatelessWidget {
  const HistoryPengajuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryPengajuanViewModel(repository: FakePerizinanAbsensiRepository()),
      child: BlocBuilder<HistoryPengajuanViewModel , HistoryPengajuanUiState>(
        builder: (context , state) {
          final viewModel = context.read<HistoryPengajuanViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: const Text("Urus Absensi Alpha"),
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: (){},
                )
              ],
            ),
            body: PagedListView<int , PreviewPerizinanAbsensiForMahasiswa>.separated(
              padding: const EdgeInsets.all(24),
              pagingController: viewModel.pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context , item , index){
                  return KartuPreviewPengajuan(data: item);
                }
              ),
              separatorBuilder: (context , index){
                return const SizedBox(height: 24,);
              }
            ),
            floatingActionButton: FloatingActionButton(
              key: const ValueKey("urus_absensi_fab"),
              child: const Icon(Icons.add),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  MyPensNavRoutes.mahasiswaInputPengajuanAbsensi
                );
              }
            ),
          );
        }
      ),
    );
  }
}
