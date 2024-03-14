import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mypens/common/user_interface/style/my_outlined_input_decoration.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/data/repository/mata_kuliah_repository.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/status_absensi.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/component/konfirmasi_submit_dialog.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_view_model.dart';

class InputPengajuanScreen extends StatelessWidget {
  const InputPengajuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final userProvider = context.read<UserController>();
        return InputPengajuanViewModel(
          repository: MataKuliahRepository(),
          idMahasiswa: userProvider.idMahasiswa,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Input Pengajuan"),
          scrolledUnderElevation: 0,
        ),
        body: BlocBuilder<InputPengajuanViewModel, InputPengajuanUiState>(
            buildWhen: (prevState, curState) {
          return prevState.tanggal != curState.tanggal;
        }, builder: (context, state) {
          final viewModel = context.read<InputPengajuanViewModel>();
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    DropdownSearch<MataKuliah>(
                      asyncItems: viewModel.loadMataKuliah,
                      itemAsString: (matkul) => matkul.namaMatkul,
                      onChanged: (matkul) =>
                          viewModel.add(OnChangeMataKuliahDipilih(matkul!)),
                      popupProps: const PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                                  label: Text("Cari Mata Kuliah"),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.search)))),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              label: const Text("Mata Kuliah"))),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              label: const Text('Minggu ke'),
                            ),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            onChanged: (text) =>
                                viewModel.add(OnChangeMingguKe(text)),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2050),
                              ).then((value) {
                                if (value != null) {
                                  debugPrint('hai hai hai $value');
                                  viewModel.add(OnChangeTanggal(value));
                                }
                              });
                            },
                            child: InputDecorator(
                              textAlignVertical: TextAlignVertical.center,
                              isEmpty: state.tanggal == null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                label: const Text("Tanggal"),
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                              child: state.tanggal == null
                                  ? null
                                  : Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(state.tanggal!),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButtonFormField(
                        items: StatusAbsensi.values
                            .map((status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(status.toString()),
                                ))
                            .toList(),
                        value: state.statusYangDiinginkan,
                        decoration: MyOutlinedInputDecoration(
                          label: const Text('Status yang Diinginkan'),
                        ),
                        onChanged: (status) => viewModel
                            .add(OnChangeStatusYangDiinginkan(status!))),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      onChanged: (text) =>
                          viewModel.add(OnChangeUrlBuktiFile(text)),
                      decoration: MyOutlinedInputDecoration(
                        label: const Text("URL Bukti File"),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      onChanged: (text) =>
                          viewModel.add(OnChangeKeterangan(text)),
                      decoration: MyOutlinedInputDecoration(
                        label: const Text("Keterangan (Opsional)"),
                      ),
                      minLines: 3,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 48,
                ),
                child: SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        KonfirmasiSubmitDialog(
                                viewModel: viewModel, context: context)
                            .show();
                      },
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text("Submit")),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
