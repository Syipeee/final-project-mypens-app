import 'package:flutter/material.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_dosen.dart';
import 'package:mypens/common/user_interface/utils/status_pengajuan_color_picker.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';

class DosenListPerizinanCard extends StatelessWidget {
  final PreviewPerizinanAbsensiForDosen data;
  final colorPicker = StatusPerizinanAbsensiColorPicker();

  DosenListPerizinanCard({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorPicker.getBackgroundColorBy(data.status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.namaMatkul,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.tanggalMatkul,
              ),
              drawStatusCard(),
            ],
          ),

          const SizedBox(height: 16,),

          Row(
            children: [
              const Text(
                'Oleh : ',
              ),
              Expanded(
                child: Text(
                  data.mahasiswaPengaju,
                )
              ),

              const SizedBox(width: 6,),

              OutlinedButton(
                onPressed: (){
                  Navigator.of(context)
                    .pushNamed(
                      MyPensNavRoutes.dosenDetailPerizinanAbsensi,
                      arguments: 1,
                    );
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  )
                ),
                child: const Text(
                  'Lihat Detail',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget drawStatusCard(){
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: colorPicker.getCardColorBy(data.status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        data.status.name,
        style: TextStyle(
          fontSize: 10,
          color: colorPicker.getCardTextColorBy(data.status)
        ),
      ),
    );
  }


}
