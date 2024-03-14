import 'package:flutter/material.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/features/auth/services/user_type_enum.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../services/email_user_type_checker.dart';
import '../services/login_action.dart';
import '../../../constants/login_screen.dart';
import '../../../constants/colors.dart';
import '../../../controllers/common/user_controller.dart';
import '../../staff/home/screens/home.dart';
import '../../dosen/home/screens/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  bool passwordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Keluar Aplikasi'),
              content: const Text('Yakinn kamu mau keluar? 🥺️🥺️😔️'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text('Ngga Jadi')),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Keluar'),
                ),
              ],
            ),
          ) ??
          false;
    }

    UserController userController =
        Provider.of<UserController>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: bluePens,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
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
                    ),
                    ClipRRect(
                        child: Image.asset(
                      width: 70,
                      height: 70,
                      'assets/images/logo.png',
                    )),
                  ],
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Text(greetings,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 23)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      instruction,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 202, 202, 202)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            hintText: emailHintText,
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              hintText: passwordHintText,
                              hintStyle: const TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: !passwordVisible,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        final emailUserType = checkEmailUserType(email);
                        switch (emailUserType) {
                          case UserType.unknown:
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const AlertDialog(
                                      content: Text(
                                          'Periksa kembali email dan password anda!'),
                                    ));
                          case UserType.mahasiswa:
                            dynamic result = await LoginAction.doLoginStudent(
                                email, password);
                            if (result['response'] == 'success') {
                              userController.setEmail(email);
                              userController
                                  .setNrp(int.parse(result['userNrp']));
                              userController.setType(UserType.mahasiswa);
                              if (!mounted) return;
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  MyPensNavRoutes.mahasiswaBeranda,
                                  (route) => false);
                            } else if (result['response'] == 'error') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Upsss! Periksa jaringan internet kamu atau server kami yang sedang bermasalah. Coba lagi beberapa saat (⁠ʘ⁠ᴗ⁠ʘ⁠✿⁠)'),
                                      ));
                            } else if (result['response'] == 'failed') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Periksa kembali email dan password anda!'),
                                      ));
                            }
                          case UserType.staff:
                            dynamic result =
                                await LoginAction.doLoginStaffAndDosen(
                                    email, password, 1);
                            if (result['response'] == 'success') {
                              userController.setEmail(email);
                              userController.setNip(result['userNip']);
                              userController.setType(UserType.staff);
                              if (!mounted) return;
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const StaffHome()),
                                  (route) => false);
                            } else if (result['response'] == 'error') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Upsss! Periksa jaringan internet kamu atau server kami yang sedang bermasalah. Coba lagi beberapa saat (⁠ʘ⁠ᴗ⁠ʘ⁠✿⁠)'),
                                      ));
                            } else if (result['response'] == 'failed') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Periksa kembali email dan password anda!'),
                                      ));
                            }
                          case UserType.dosen:
                            dynamic result =
                                await LoginAction.doLoginStaffAndDosen(
                                    email, password, 2);
                            if (result['response'] == 'success') {
                              userController.setEmail(email);
                              userController.setNip(result['userNip']);
                              userController.setType(UserType.dosen);
                              if (!mounted) return;
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const DosenHome()),
                                  (route) => false);
                            } else if (result['response'] == 'error') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Upsss! Periksa jaringan internet kamu atau server kami yang sedang bermasalah. Coba lagi beberapa saat (⁠ʘ⁠ᴗ⁠ʘ⁠✿⁠)'),
                                      ));
                            } else if (result['response'] == 'failed') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        content: Text(
                                            'Periksa kembali email dan password anda!'),
                                      ));
                            }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      icon: isLoading
                          ? const CircularProgressIndicator(
                              backgroundColor: yellowPens,
                              valueColor: AlwaysStoppedAnimation(whiteColor),
                            )
                          : const Icon(Icons.login),
                      label: isLoading
                          ? const Text('')
                          : const Text(textButtonLogin),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: bluePens,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
