import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/logbook_mbkm/screens/day/day_list_logbook_mbkm.dart';
import '../services/providers/logbook_constant.dart';

class WeekListLogbookMbkm extends StatefulWidget {
  const WeekListLogbookMbkm({Key? key}) : super(key: key);

  @override
  State<WeekListLogbookMbkm> createState() => _WeekListLogbookMbkmState();
}

class _WeekListLogbookMbkmState extends State<WeekListLogbookMbkm> {
  List<String> fiveDays = [
    '15-20',
    '21-25',
  ];
  List<String> weekText = ['Minggu Ke - 1', 'Minggu Ke - 2'];
  List<String> mounthyearText = ['Mar 2024', 'Mar 2024'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook Mingguan MBKM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < fiveDays.length; i++)
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fiveDays[i],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          mounthyearText[
                              i], // Ganti dengan bulan dan tahun yang diinginkan
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weekText[i],
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    // Konten (lingkaran dan tombol)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0;
                                  i < LogbookConstants.statusHari.length;
                                  i++)
                                Column(
                                  children: [
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[350],
                                      ),
                                      child: Center(
                                        child: _buildStatusIcon(
                                            LogbookConstants.statusHari[i]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      LogbookConstants.labels[i],
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DayListLogbookMbkm(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    primary: Color(0xFF0F75BC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.lock,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Container(
                                width: 80.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return CupertinoPopupSurface(
                                          child: Container(
                                            color: CupertinoColors.white,
                                            padding: EdgeInsets.all(16.0),
                                            height: 250,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Catatan Tambahan',
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                CupertinoTextField(
                                                  maxLines: 3,
                                                  onChanged: (value) {},
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 16.0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: CupertinoColors
                                                            .black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                SizedBox(height: 16.0),
                                                CupertinoButton(
                                                  onPressed: () {},
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Text(
                                                        'Approved',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  color: Color.fromARGB(
                                                      255, 44, 114, 189),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    primary: Color(0xFF0F75BC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'check':
        return Icon(
          Icons.check,
          color: Colors.black,
          size: 16.0,
        );
      case 'cross':
        return Icon(
          Icons.close,
          color: Colors.black,
          size: 16.0,
        );
      case 'empty':
        return SizedBox(); // Lingkaran kosong, Anda bisa mengganti ini sesuai kebutuhan
      default:
        return SizedBox();
    }
  }
}
