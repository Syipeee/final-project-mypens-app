import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/upload_nilai_mbkm/screens/components/custom_form.dart';

class DosenUploadNilaiMbkm extends StatefulWidget {
  const DosenUploadNilaiMbkm({super.key});

  @override
  State<DosenUploadNilaiMbkm> createState() => _DosenUploadNilaiMbkmState();
}

class _DosenUploadNilaiMbkmState extends State<DosenUploadNilaiMbkm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Nilai MBKM',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Jenis MBKM*'),
                const SizedBox(height: 8),
                CustomForm(
                  hintText: 'Jenis MBKM',
                  helperText: 'Pilih jenis MBKM',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 16),
                const Text('Bobot (%)*'),
                const SizedBox(height: 8),
                CustomForm(
                  hintText: 'Jenis MBKM',
                  helperText: 'Pilih jenis MBKM',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Tambah Nilai MBKM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
