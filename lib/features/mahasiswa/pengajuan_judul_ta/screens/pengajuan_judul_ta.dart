import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/pengajuan_judul_ta.dart';

class PengajuanJudulTa extends StatefulWidget {
  const PengajuanJudulTa({Key? key}) : super(key: key);

  @override
  _PengajuanJudulTaState createState() => _PengajuanJudulTaState();
}

class _PengajuanJudulTaState extends State<PengajuanJudulTa> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var ta = Provider.of<PengajuanJudulTaController>(context, listen: false);
      ta.getDetail();
    });
  }

  renderLoader(hasError) {
    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    return [
      const Center(
        child: CircularProgressIndicator(
          backgroundColor: yellowPens,
          valueColor: AlwaysStoppedAnimation(bluePens),
        ),
      )
    ];
  }

  renderPengajuan(obj, isLoading, hasError) {
    if (isLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(
            backgroundColor: yellowPens,
            valueColor: AlwaysStoppedAnimation(bluePens),
          ),
        )
      ];
    }

    if (hasError != "") {
      return [
        Container(
          padding: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Center(
                  child: SelectableText(
                hasError,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ];
    }

    if (obj.data.length == 0) {
      return [
        SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Tidak ada data.')],
          ),
        )
      ];
    }

    List<Widget> result = [];
    if (obj.data.length > 0) {
      for (var element in obj.data) {
        result.add(
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tahun',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.tahun}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Semester',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.semester}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Judul',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.judul}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Pembimbing 1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (element.pembimbing1 != null) ...[
                              SelectableText("""${element.pembimbing1}"""),
                            ] else ...[
                              const SelectableText("""-"""),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Pembimbing 2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (element.pembimbing2 != null) ...[
                              SelectableText("""${element.pembimbing2}"""),
                            ] else ...[
                              const SelectableText("""-"""),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Pembimbing 3',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (element.pembimbing3 != null) ...[
                              SelectableText("""${element.pembimbing3}"""),
                            ] else ...[
                              const SelectableText("""-"""),
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Status',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText("""${element.statusPenerimaan}"""),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Diambil atau Tidak',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (element.ambil == 'Ya') ...[
                              const SelectableText("""Judul Ini Diambil"""),
                            ] else ...[
                              const SelectableText("""Tidak Diambil"""),
                            ]
                          ],
                        )),
                  ])),
        );
      }
    } else {
      result.add(const Text('Kosong'));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    PengajuanJudulTaController ta =
        Provider.of<PengajuanJudulTaController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Pengajuan Judul Tugas Akhir'),
        scrolledUnderElevation: 0.0,
      ),
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ta.detail != null
                ? renderPengajuan(ta.detail, ta.isLoading, ta.hasError)
                : renderLoader(ta.hasError),
          ),
        ),
      ),
    ));
  }
}
