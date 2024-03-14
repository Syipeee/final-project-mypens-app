import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:provider/provider.dart';
import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/common/navigation.dart';
import '../../profil_pegawai/screens/profil_pegawai.dart';
import '../../profil_pribadi/screens/profil_pribadi.dart';
import '../../../auth/screens/login.dart';

class StaffProfile extends StatefulWidget {
  const StaffProfile({Key? key}) : super(key: key);

  @override
  State<StaffProfile> createState() => _ProfileState();
}

class _ProfileState extends State<StaffProfile> {
  @override
  Widget build(BuildContext context) {
    UserController user = Provider.of<UserController>(context);
    NavigationController navigation =
        Provider.of<NavigationController>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: bluePens,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text('Profile'),
      ),
      bottomNavigationBar: const BottomNavigation(3),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 219, 219, 219),
                              spreadRadius: 4,
                              blurRadius: 10)
                        ]),
                  )),
                  Positioned(
                      child: Container(
                    margin: const EdgeInsets.only(top: 70, left: 42),
                    child: ClipRRect(
                        child: Image.asset(
                      width: 70,
                      height: 70,
                      'assets/images/logo.png',
                    )),
                  ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(children: [
                  Text(
                    user.userNama,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfilPribadi()));
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffB6D7FF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 40, left: 10),
                                    child: ClipRRect(
                                        child: Image.asset(
                                      width: 40,
                                      height: 40,
                                      'assets/images/profil_pribadi.png',
                                    )),
                                  ))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 15),
                                child: Text('Profil Pribadi'),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfilPegawai()));
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff868EAF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 40, left: 10),
                                    child: ClipRRect(
                                        child: Image.asset(
                                      width: 40,
                                      height: 40,
                                      'assets/images/profil_dosen.png',
                                    )),
                                  ))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 15),
                                child: Text('Profil Pegawai'),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            navigation.changeScreen('/');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                                (route) => false);
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffC21D44),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                  Positioned(
                                      child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 40, left: 10),
                                    child: ClipRRect(
                                        child: Image.asset(
                                      width: 40,
                                      height: 40,
                                      'assets/images/logout.png',
                                    )),
                                  ))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 15),
                                child: Text('Keluar'),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
