import 'package:flutter/material.dart';
import 'package:mypens/features/dosen/upload_nilai_mbkm/screens/mahasiswa_dosen.dart';

class ProgramMahasiswa extends StatefulWidget {
  const ProgramMahasiswa({Key? key}) : super(key: key);

  @override
  State<ProgramMahasiswa> createState() => _ProgramMahasiswaState();
}

class _ProgramMahasiswaState extends State<ProgramMahasiswa> {
  List<bool> isTileExpandedList = List.generate(6, (index) => false);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06, vertical: screenWidth * 0.12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      padding: EdgeInsets.zero,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Program MSIB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      padding: EdgeInsets.zero,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0.0, 50.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.3,
                  bottom: screenWidth * 0.08,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.06,
                            vertical: screenWidth * 0.02,
                          ),
                          child:
                              buildContentProgramMahasiswa(index, screenWidth),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                  ),
                  child: buildProgramMahasiswa(screenWidth),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgramMahasiswa(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/images/card_program.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20.0,
                left: 24.0,
                right: 24.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          '200',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.005),
                        const Text(
                          'Mahasiswa MSIB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'dari Total 1000 Mahasiswa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContentProgramMahasiswa(int index, double screenWidth) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: buildListTile(index, screenWidth),
          ),
        ),
      ],
    );
  }

  Widget buildListTile(int index, double screenWidth) {
    return Column(
      children: [
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.14,
                height: screenWidth * 0.14,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MahasiswaDosen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/logo-kampus-mengajar.png',
                    width: screenWidth * 0.14,
                    height: screenWidth * 0.14,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kampus Mengajar'),
                  Text('200 Mahasiswa'),
                ],
              ),
              const Spacer(),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                isTileExpandedList[index] = !isTileExpandedList[index];
              });
            },
            child: Container(
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  isTileExpandedList[index]
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: screenWidth * 0.04,
                ),
              ),
            ),
          ),
        ),
        if (isTileExpandedList[index]) buildExpandedContent(screenWidth),
      ],
    );
  }

  Widget buildExpandedContent(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1.0,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.001,
            ),
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Di Buka Tanggal'),
              Text('12-12-2021'),
            ],
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Di Tutup Tanggal'),
              Text('12-12-2021'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Total Mahasiswa:'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.02, 8.0, screenWidth * 0.03, 8.0),
                        child: const Text(
                          '20 Mahasiswa',
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
    );
  }
}
