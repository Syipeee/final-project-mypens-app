import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KonfirmasiSubmitDialog extends Alert {
  final InputPengajuanViewModel viewModel;

  KonfirmasiSubmitDialog({
    required this.viewModel,
    required super.context,
  }) : super(
          type: AlertType.warning,
          desc: "Yakin ingin mensubmit data?",
          buttons: [
            DialogButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Tidak",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            DialogButton(
              color: Colors.blue,
              onPressed: () {
                viewModel.add(OnSubmit());
              },
              child: BlocProvider.value(
                value: viewModel,
                child:
                    BlocBuilder<InputPengajuanViewModel, InputPengajuanUiState>(
                  buildWhen: (prevState, curState) =>
                      prevState.submitResponse.runtimeType !=
                      curState.submitResponse.runtimeType,
                  builder: (context, state) {
                    if (state.submitResponse is ApiResponseSucceed) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          Navigator.of(context).popUntil((route) =>
                              route.settings.name ==
                              MyPensNavRoutes.mahasiswaUrusAbsensiAlpha);
                        },
                      );
                    }

                    return state.submitResponse is ApiResponseLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            "Ya",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        );
}
