import 'package:flutter/material.dart';
import 'package:mypens/common/domain/model/preview_perizinan_absensi_for_mahasiswa.dart';
import 'package:mypens/common/domain/model/status_penerimaan_perizinan.dart';

class KartuPreviewPengajuan extends StatelessWidget {
  final PreviewPerizinanAbsensiForMahasiswa data;

  const KartuPreviewPengajuan({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: _getContainerColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Dibuat pada:"),
          Text(data.dibuatPada),

          const SizedBox(height: 24,),
          
          Text(
            data.namaMatkul,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text("*) ${data.tanggalMatkul}, Minggu ke-${data.mingguMatkul}"),
        ],
      ),
    );
  }

  Color _getContainerColor(){
    switch(data.status){
      case StatusPenerimaanPerizinan.menunggu:
        return const Color(0xFFFFF9BE);
      case StatusPenerimaanPerizinan.ditolak:
        return const Color(0xFFFFBEBE);
      case StatusPenerimaanPerizinan.diterima:
        return const Color(0xFFE0FFE2);
    }
  }
}
