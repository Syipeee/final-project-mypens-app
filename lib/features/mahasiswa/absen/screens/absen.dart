import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/absen/services/absen.dart';
import 'package:provider/provider.dart';
// import 'package:pluto_grid/pluto_grid.dart';
import "package:collection/collection.dart";
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/mahasiswa/rekap_absensi.dart';

class Absen extends StatefulWidget {
  const Absen({Key? key}) : super(key: key);

  @override
  AbsenState createState() => AbsenState();
}

class AbsenState extends State<Absen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var absensiController = Provider.of<RekapAbsensiController>(context, listen: false);
      absensiController.generateYearList();
    });
  }

  // renderLoader(String hasError) {
  //   if (hasError != "") {
  //     return Container(
  //       padding: const EdgeInsets.only(top: 60),
  //       height: MediaQuery.of(context).size.height - 300,
  //       child: Column(
  //         children: [
  //           Center(
  //               child: SelectableText(
  //             hasError,
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(
  //                 color: Colors.red, fontWeight: FontWeight.bold),
  //           ))
  //         ],
  //       ),
  //     );
  //   }
  //
  //   return const Center(
  //     child: CircularProgressIndicator(
  //       backgroundColor: yellowPens,
  //       valueColor: AlwaysStoppedAnimation(bluePens),
  //     ),
  //   );
  // }
  //
  // renderRekapAbsensi(
  //   RekapAbsensi datas,
  //   bool isLoading,
  //   String hasError
  // ) {
  //   if (isLoading) {
  //     return const Center(
  //       child: CircularProgressIndicator(
  //         backgroundColor: yellowPens,
  //         valueColor: AlwaysStoppedAnimation(bluePens),
  //       ),
  //     );
  //   }
  //
  //   if (hasError != "") {
  //     return Container(
  //       padding: const EdgeInsets.only(top: 60),
  //       height: MediaQuery.of(context).size.height - 300,
  //       child: Column(
  //         children: [
  //           Center(
  //               child: SelectableText(
  //             hasError,
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(
  //                 color: Colors.red, fontWeight: FontWeight.bold),
  //           ))
  //         ],
  //       ),
  //     );
  //   }
  //
  //   if (datas.data.isEmpty) {
  //     return const Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [Center(child: Text('Tidak ada data.'))],
  //     );
  //   }
  //
  //   List<PlutoColumn> columns = <PlutoColumn>[
  //     PlutoColumn(
  //       title: 'Mata Kuliah',
  //       field: 'matakuliah',
  //       type: PlutoColumnType.text(),
  //       readOnly: true,
  //       frozen: PlutoColumnFrozen.start,
  //       enableColumnDrag: false,
  //       enableRowDrag: false,
  //       enableRowChecked: false,
  //       enableSorting: false,
  //       enableAutoEditing: false,
  //       enableEditingMode: false,
  //     ),
  //     PlutoColumn(
  //         title: '1',
  //         field: 'm1',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '2',
  //         field: 'm2',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '3',
  //         field: 'm3',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '4',
  //         field: 'm4',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '5',
  //         field: 'm5',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '6',
  //         field: 'm6',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '7/UTS',
  //         field: 'm7',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '8',
  //         field: 'm8',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '9',
  //         field: 'm9',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '10',
  //         field: 'm10',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '11',
  //         field: 'm11',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '12',
  //         field: 'm12',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '13',
  //         field: 'm13',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '14/UAS',
  //         field: 'm14',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '15',
  //         field: 'm15',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //     PlutoColumn(
  //         title: '16',
  //         field: 'm16',
  //         type: PlutoColumnType.text(),
  //         readOnly: true,
  //         enableColumnDrag: false,
  //         enableRowDrag: false,
  //         enableRowChecked: false,
  //         enableSorting: false,
  //         enableAutoEditing: false,
  //         enableEditingMode: false,
  //         textAlign: PlutoColumnTextAlign.center,
  //         titleTextAlign: PlutoColumnTextAlign.center,
  //         width: 120),
  //   ];
  //
  //   List<PlutoRow> rows = [];
  //
  //   List<Map<String, String>> iterable = [];
  //   for (var element in datas.data) {
  //     var formating = {
  //       "MAHASISWA": element.mahasiswa.toString(),
  //       "NRP": element.nrp.toString(),
  //       "NAMA": element.nama.toString(),
  //       "KODE": element.kode.toString(),
  //       "MATAKULIAH": element.matakuliah.toString(),
  //       "JAM": element.jam.toString(),
  //       "TAHUN": element.tahun.toString(),
  //       "SEMESTER": element.semester.toString(),
  //       "TANGGAL": element.tanggal.toString(),
  //       "MINGGU": element.minggu.toString(),
  //       "STATUS": element.status.toString(),
  //       "PROSEN_KEHADIRAN": element.prosenKehadiran.toString()
  //     };
  //     iterable.add(formating);
  //   }
  //
  //   Map<dynamic, List<Map<String, String>>> groups =
  //       groupBy(iterable, (Map obj) => obj['MATAKULIAH']);
  //
  //   Map<String, PlutoCell> res = {};
  //
  //
  //   groups.forEach(
  //     (key, value) {
  //       res.addAll({'matakuliah': PlutoCell(value: key)});
  //
  //       // week
  //       for (var i = 0; i < 16; i++) {
  //         int counter = 0;
  //         String statusTemp = "";
  //         // iterate week over list of map
  //         print('-----------------------------');
  //         print("Total data: ${value.length}");
  //         print("Minggu ke: $i");
  //
  //         for (var y = 0; y < value.length; y++) {
  //           // print(y);
  //           if (value[y]['MINGGU'] == (i + 1).toString()) {
  //             print("Counter: $counter");
  //             if (counter < 2) {
  //               if (statusTemp == '') {
  //                 print("empty -> ${value[y]['TANGGAL']}");
  //                 statusTemp = value[y]['STATUS']!;
  //               } else {
  //                 print("exist -> ${value[y]['TANGGAL']}");
  //                 statusTemp = "$statusTemp;${value[y]['STATUS']!}";
  //               }
  //               counter++;
  //               continue;
  //             } else {
  //               break;
  //             }
  //           } else {
  //             continue;
  //           }
  //         }
  //
  //         if (i < value.length) print("Matakuliah: ${value[i]['MATAKULIAH']}");
  //         print("Brp x: $counter");
  //         print("Result: $statusTemp");
  //         print("End Counter: $counter");
  //         // after iterate ended
  //         switch (counter) {
  //           case 0:
  //             res.addAll({'m${i + 1}': PlutoCell(value: '-')});
  //             break;
  //           case 1:
  //             res.addAll({'m${i + 1}': PlutoCell(value: statusTemp)});
  //             break;
  //           case 2: //2 in week detected
  //             res.addAll({
  //               'm${i + 1}': PlutoCell(
  //                   value:
  //                       '${statusTemp.split(";")[0]} ${statusTemp.split(";")[1]}')
  //             });
  //             break;
  //         }
  //         counter = 0;
  //         statusTemp = '';
  //       }
  //       rows.add(PlutoRow(cells: res));
  //
  //       res = {};
  //     },
  //   );
  //
  //   /// columnGroups that can group columns can be omitted.
  //   final List<PlutoColumnGroup> columnGroups = [
  //     PlutoColumnGroup(title: 'Minggu', fields: [
  //       'm1',
  //       'm2',
  //       'm3',
  //       'm4',
  //       'm5',
  //       'm6',
  //       'm7',
  //       'm8',
  //       'm9',
  //       'm10',
  //       'm11',
  //       'm12',
  //       'm13',
  //       'm14',
  //       'm15',
  //       'm16'
  //     ]),
  //   ];
  //
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height,
  //     child: PlutoGrid(
  //       columns: columns,
  //       rows: rows,
  //       columnGroups: columnGroups,
  //       onLoaded: (PlutoGridOnLoadedEvent event) {
  //         // stateManager = event.stateManager;
  //         // stateManager.setShowColumnFilter(true);
  //       },
  //       onChanged: (PlutoGridOnChangedEvent event) {
  //         // print(event);
  //       },
  //       configuration: const PlutoGridConfiguration(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // RekapAbsensiController absensiController = Provider.of<RekapAbsensiController>(context);
    // absensiController.absensi != null ? absensiController.getTotalMataKuliah() : '';
    //
    // return SafeArea(
    //     child: Scaffold(
    //   appBar: AppBar(
    //     systemOverlayStyle: const SystemUiOverlayStyle(
    //       statusBarColor: bluePens,
    //       statusBarIconBrightness: Brightness.light,
    //       statusBarBrightness: Brightness.light,
    //     ),
    //     title: const Text('Rekap Absensi'),
    //     scrolledUnderElevation: 0.0,
    //   ),
    //   backgroundColor: const Color(0xfff3f3f3),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(20),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.only(right: 40),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     const Text(
    //                       'Tahun Ajaran',
    //                       style: TextStyle(fontWeight: FontWeight.w900),
    //                     ),
    //                     const SizedBox(
    //                       height: 10,
    //                     ),
    //                     absensiController.selectedYear != ''
    //                         ? DecoratedBox(
    //                             decoration: BoxDecoration(
    //                                 color: whiteColor,
    //                                 borderRadius: BorderRadius.circular(5),
    //                                 boxShadow: const [
    //                                   BoxShadow(
    //                                       color: Color.fromRGBO(0, 0, 0, 0.5),
    //                                       blurRadius: 1,
    //                                       blurStyle: BlurStyle.outer)
    //                                 ]),
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   right: 10, left: 20),
    //                               child: Consumer<RekapAbsensiController>(
    //                                   builder: (BuildContext context,
    //                                       RekapAbsensiController nilai,
    //                                       Widget? child) {
    //                                 return DropdownButton<String>(
    //                                   underline: Container(),
    //                                   dropdownColor: whiteColor,
    //                                   items: absensiController.yearList.map((String value) {
    //                                     return DropdownMenuItem(
    //                                       value: value,
    //                                       child: Text(value),
    //                                     );
    //                                   }).toList(),
    //                                   onChanged: (newValue) {
    //                                     absensiController.setSelectedYear(
    //                                         newValue as String);
    //                                     absensiController.getRekapAbsensi();
    //                                     absensiController.isLoading = true;
    //                                   },
    //                                   value: absensiController.selectedYear,
    //                                 );
    //                               }),
    //                             ),
    //                           )
    //                         : const Text('wait')
    //                   ],
    //                 ),
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   const Text(
    //                     'Semester',
    //                     style: TextStyle(fontWeight: FontWeight.w900),
    //                   ),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   absensiController.selectedSemester != ''
    //                       ? DecoratedBox(
    //                           decoration: BoxDecoration(
    //                               color: whiteColor,
    //                               borderRadius: BorderRadius.circular(5),
    //                               boxShadow: const [
    //                                 BoxShadow(
    //                                     color: Color.fromRGBO(0, 0, 0, 0.5),
    //                                     blurRadius: 1,
    //                                     blurStyle: BlurStyle.outer)
    //                               ]),
    //                           child: Padding(
    //                             padding:
    //                                 const EdgeInsets.only(right: 10, left: 20),
    //                             child: Consumer<RekapAbsensiController>(builder:
    //                                 (BuildContext context,
    //                                     RekapAbsensiController nilai,
    //                                     Widget? child) {
    //                               return DropdownButton<String>(
    //                                 underline: Container(),
    //                                 dropdownColor: whiteColor,
    //                                 items:
    //                                     absensiController.semesterList.map((String value) {
    //                                   return DropdownMenuItem(
    //                                     value: value,
    //                                     child: Text(value),
    //                                   );
    //                                 }).toList(),
    //                                 onChanged: (newValue) {
    //                                   absensiController.setSelectedSemester(
    //                                       newValue as String);
    //                                   absensiController.getRekapAbsensi();
    //                                   absensiController.isLoading = true;
    //                                 },
    //                                 value: absensiController.selectedSemester,
    //                               );
    //                             }),
    //                           ),
    //                         )
    //                       : const Text('wait')
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: const [
    //               Text('Ket :'),
    //               Text('H = Hadir, HH = Hadir 2X seminggu'),
    //               Text('A = Tidak Masuk Tanpa Keterangan'),
    //               Text('I = Tidak Masuk dengan Izin'),
    //               Text('S = Tidak Masuk karena Sakit'),
    //               Text('- = Tidak Terselenggara Perkuliahan'),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(15),
    //           child: absensiController.absensi != null
    //               ? renderRekapAbsensi(
    //                   absensiController.absensi!, absensiController.isLoading, absensiController.hasError)
    //               : renderLoader(absensiController.hasError),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
  }
}
