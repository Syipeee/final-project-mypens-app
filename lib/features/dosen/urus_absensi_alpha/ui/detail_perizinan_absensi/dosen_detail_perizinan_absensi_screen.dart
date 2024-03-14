import 'package:flutter/material.dart';
import 'package:mypens/common/domain/model/detail_perizinan_absensi_for_dosen.dart';
import 'package:url_launcher/url_launcher.dart';

class DosenDetailPerizinanScreen extends StatelessWidget {
  final DetailPerizinanAbsensiForDosen data;

  const DosenDetailPerizinanScreen({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
              top: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: buildDataEntry(
                            'Dibuat pada', data.dibuatPada
                        )
                    ),
                    Expanded(
                        child: buildDataEntry(
                            'Status', data.statusPenerimaan.name
                        )
                    ),
                  ],
                ),

                const SizedBox(height: 24,),

                buildDataEntry('Mata Kuliah', data.namaMatkul),

                const SizedBox(height: 24,),

                buildDataEntry('Tanggal Perkuliahan', data.tanggalPerkuliahan),

                const SizedBox(height: 24,),

                buildDataEntry('Minggu ke', data.mingguKeMatkul.toString()),

                const SizedBox(height: 24,),

                buildDataEntry(
                    'Status Presensi yang Diinginkan',
                    data.statusYangDiinginkan
                ),

                const SizedBox(height: 24,),

                buildDataEntry(
                  'Keterangan',
                  data.keterangan ?? "-",
                ),

                const SizedBox(height: 24,),

                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    minimumSize: Size(0, 0),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse(data.urlBuktiFile)
                    );
                  },
                  child: const Text('Lihat Bukti File'),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            bottom: 48,
            right: 24,
            left: 24,
          ),
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFF0000),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: (){},
                  child: Text(
                    "Tolak",
                  ),
                ),
              ),

              const SizedBox(width: 16,),

              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2FA5BE),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: (){},
                  child: Text(
                    "Terima",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDataEntry(String label, String value){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value,),
      ],
    );
  }

}
