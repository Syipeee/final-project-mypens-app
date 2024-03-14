import 'package:flutter/material.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:mypens/features/auth/services/user_type_enum.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../controllers/common/navigation.dart';

class BottomNavigation extends StatelessWidget {
  final int activeButtonIndex;

  const BottomNavigation(this.activeButtonIndex, {super.key});

  renderCondition(
      UserType userType,
      int index,
      NavigationController navigation,
      BuildContext context
  ) {
    if (userType == UserType.mahasiswa) {
      switch (index) {
        case 0:
          navigation.changeScreen('/');
          Navigator.pushNamed(context, '/mahasiswa/beranda');
          break;
        case 1:
          navigation.changeScreen('/news');
          Navigator.pushNamed(context, '/berita');
          break;
        case 2:
          navigation.changeScreen('/pens_attendance');
          Navigator.pushNamed(context, '/mahasiswa/pens_attendance');
          break;
        case 3:
          navigation.changeScreen('/profile');
          Navigator.pushNamed(context, '/mahasiswa/profil');
          break;
      }
    } else if (userType == UserType.staff) {
      switch (index) {
        case 0:
          navigation.changeScreen('/');
          Navigator.pushNamed(context, '/staff/beranda');
          break;
        case 1:
          navigation.changeScreen('/news');
          Navigator.pushNamed(context, '/berita');
          break;
        case 2:
          navigation.changeScreen('/rekapabsen');
          Navigator.pushNamed(context, '/staff/rekap_absensi');
          break;
        case 3:
          navigation.changeScreen('/profile');
          Navigator.pushNamed(context, '/staff/profil');
          break;
      }
    } else if (userType == UserType.dosen) {
      switch (index) {
        case 0:
          navigation.changeScreen('/');
          Navigator.pushNamed(context, '/dosen/beranda');
          break;
        case 1:
          navigation.changeScreen('/news');
          Navigator.pushNamed(context, '/berita');
          break;
        case 2:
          navigation.changeScreen('/unggahsoal');
          Navigator.pushNamed(context, '/dosen/unggah_soal');
          break;
        case 3:
          navigation.changeScreen('/profile');
          Navigator.pushNamed(context, '/dosen/profil');
          break;
      }
    } else {
      switch (index) {
        case 0:
          navigation.changeScreen('/');
          break;
        case 1:
          navigation.changeScreen('/news');
          break;
        case 2:
          navigation.changeScreen('/summary');
          break;
        case 3:
          navigation.changeScreen('/profile');
          break;
      }
    }
  }

  renderUI(UserType userType) {
    if (userType == UserType.mahasiswa) {
      return [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper), label: 'Berita'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'PENS Attendance'),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      ];
    } else if (userType == UserType.staff) {
      return [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper), label: 'Berita'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar), label: 'Rekap Absen'),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      ];
    } else if (userType == UserType.dosen) {
      return [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper), label: 'Berita'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.upload_file_sharp), label: 'Unggah Soal'),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      ];
    } else {
      return [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper), label: 'News'),
        const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Summary'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Account'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context, listen: false);
    final userController = context.read<UserController>();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: BottomNavigationBar(
          currentIndex: activeButtonIndex,
          onTap: ((buttonIndex) {
            renderCondition(userController.userType, buttonIndex, navigation, context);
          }),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          backgroundColor: yellowPens,
          unselectedItemColor: bluePens.withOpacity(0.5),
          selectedItemColor: bluePens,
          unselectedLabelStyle: TextStyle(
              color: whiteColor.withOpacity(0.5), fontWeight: FontWeight.w900),
          selectedLabelStyle:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.w900),
          items: renderUI(userController.userType)),
    );
  }
}
