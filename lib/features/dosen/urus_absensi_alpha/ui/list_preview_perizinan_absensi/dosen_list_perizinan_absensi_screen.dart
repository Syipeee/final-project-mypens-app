import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_view_model.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/ui_components/dosen_list_perizinan_card.dart';

class DosenListPerizinanAbsensiScreen extends StatefulWidget {
  const DosenListPerizinanAbsensiScreen({super.key});

  @override
  State<DosenListPerizinanAbsensiScreen> createState() => 
      _DosenListPerizinanAbsensiScreenState();
}

class _DosenListPerizinanAbsensiScreenState extends State<DosenListPerizinanAbsensiScreen> {

  late final _viewModel = DosenListPerizinanAbsensiViewModel();

  final _pagingController =
    PagingController<int , PreviewPerizinanAbsensiForDosen>(firstPageKey: 1);

  Future<void>? _pageRequestProcess;


  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageNumber) {
      _pageRequestProcess = _viewModel.onRequestListPaginated(
        pageNumber: pageNumber,
        onResult: (apiResponse){
          switch(apiResponse){
            case ApiResponseSucceed():
              final data = apiResponse.data!;
              if (apiResponse.isNextDataExists) {
                _pagingController.appendPage(data, pageNumber + 1);
              } else {
                _pagingController.appendLastPage(data);
              }
            case ApiResponseFailed():
              _pagingController.error(apiResponse.exception);
            case ApiResponseLoading():
              throw Exception("Invalid type");
          }
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perizinan Absensi"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.filter_list)
          ),
        ],
      ),
      body: PagedListView.separated(
        padding: const EdgeInsets.all(24),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<PreviewPerizinanAbsensiForDosen>(
          itemBuilder: (context , item ,index) =>
            DosenListPerizinanCard(data: item),
        ),
        separatorBuilder: (context , index) =>
          const SizedBox(height: 24,),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }
}
