import 'package:flutter/material.dart';

class FormLogbookMbkm extends StatefulWidget {
  const FormLogbookMbkm({Key? key}) : super(key: key);

  @override
  _FormLogbookMbkmState createState() => _FormLogbookMbkmState();
}

class _FormLogbookMbkmState extends State<FormLogbookMbkm> {
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  String? selectedAnswer;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    startTimeController.dispose();
    endTimeController.dispose();
    activityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook MBKM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: startTimeController,
                    decoration: InputDecoration(
                      labelText: 'Jam Mulai',
                      hintText: 'Masukkan jam mulai',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Spacer
                Expanded(
                  child: TextField(
                    controller: endTimeController,
                    decoration: InputDecoration(
                      labelText: 'Jam Berakhir',
                      hintText: 'Masukkan jam berakhir',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: activityController,
              maxLines: 3, // Atur jumlah baris yang diinginkan
              decoration: InputDecoration(
                labelText: 'Kegiatan/Materi',
                hintText: 'Masukkan kegiatan/materi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Apakah kegiatan yang dikerjakan/materi yang di dapat sesuai dengan mata kuliah yang di ajarkan ?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Ya',
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                ),
                Text('Ya'),
                Radio<String>(
                  value: 'Tidak',
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                ),
                Text('Tidak'),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                print('Jam Mulai: ${startTimeController.text}');
                print('Jam Berakhir: ${endTimeController.text}');
                print('Kegiatan/Materi: ${activityController.text}');
                print('Jawaban: $selectedAnswer');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                primary: Color(0xFF0F75BC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
