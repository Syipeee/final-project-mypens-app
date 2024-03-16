import 'package:flutter/material.dart';
import 'package:mypens/features/mahasiswa/logbook_mbkm/screens/form_logbook_mbkm.dart';
import '../../services/providers/logbook_constant.dart';

class DayListLogbookMbkm extends StatefulWidget {
  const DayListLogbookMbkm({Key? key}) : super(key: key);

  @override
  State<DayListLogbookMbkm> createState() => _DayListLogbookMbkmState();
}

class _DayListLogbookMbkmState extends State<DayListLogbookMbkm> {
  List<String> daysOfWeek = [
    'Senin',
    'Selasa',
    'Rabu',
  ];
  List<String> dateMounthYearOfWeek = [
    '15 Mar 2024',
    '16 Mar 2024',
    '17 Mar 2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook Harian MBKM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < LogbookConstants.statusHari.length; i++)
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
                          child:
                              _buildStatusIcon(LogbookConstants.statusHari[i]),
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
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < daysOfWeek.length; i++)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              daysOfWeek[i],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dateMounthYearOfWeek[i],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormLogbookMbkm(),
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
                          child: Text(
                            'Lengkapi',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
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
        return SizedBox();
      default:
        return SizedBox();
    }
  }
}
