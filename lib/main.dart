import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/features/dosen/upload_nilai_mbkm/screens/program_mahasiswa.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/detail_perizinan_absensi/dosen_detail_perizinan_entry.dart';
import 'package:mypens/features/dosen/urus_absensi_alpha/ui/list_preview_perizinan_absensi/dosen_list_perizinan_absensi_entry.dart';
import 'package:mypens/features/mahasiswa/logbook_mbkm/screens/week_list_logbook_mbkm.dart';
import 'package:mypens/features/mahasiswa/unggah_nilai_mbkm/presentation/mahsiswa_upload_nilai_mbkm.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/history_pengajuan/history_pengajuan_screen.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/presentation/input_pengajuan/input_pengajuan_screen.dart';
import 'package:provider/provider.dart';
import 'package:mypens/controllers/common/user_controller.dart';

import 'base/splash.dart';
import 'features/auth/screens/login.dart';
import 'features/global/news/screens/news.dart';

import 'features/mahasiswa/home/screens/home.dart';
import 'features/mahasiswa/summary/screens/summary.dart';
import 'features/mahasiswa/profile/screens/profile.dart';
import 'features/mahasiswa/revisi_sidang_sppa_ppa_pa/screens/revisi_sidang_sppa_ppa_pa.dart';
import 'features/mahasiswa/revisi_sidang_tesis/screens/revisi_sidang_tesis.dart';
import 'features/mahasiswa/revisi_sidang_kp/screens/revisi_sidang_kp.dart';
import 'features/mahasiswa/pengajuan_judul_kp/screens/pengajuan_judul_kp.dart';
import 'features/mahasiswa/pengajuan_judul_ta/screens/pengajuan_judul_ta.dart';
import 'features/mahasiswa/nilai_per_semester/screens/nilai_per_semester.dart';
import 'features/mahasiswa/jadwal_kuliah/screens/jadwal_kuliah.dart';
import 'features/mahasiswa/absen/screens/absen.dart';
import 'features/mahasiswa/presensi/screens/presensi.dart';
import 'features/mahasiswa/list_akademik/screens/list_akademik.dart';
import 'features/mahasiswa/daftar_ulang/screens/daftar_ulang.dart';

import 'features/staff/home/screens/home.dart';
import 'features/staff/rekap_absensi/screens/rekap_absensi.dart';
import 'features/staff/profil_pegawai/screens/profil_pegawai.dart';
import 'features/staff/daily_activity/screens/daily_activity.dart';
import 'features/staff/profile/screens/profile.dart';

import 'features/dosen/home/screens/home.dart';
import 'features/dosen/unggah_soal/screens/unggah_soal.dart';
import 'features/dosen/daily_activity/screens/daily_activity.dart';
import 'features/dosen/profile/screens/profile.dart';

import 'controllers/common/navigation.dart';
import 'controllers/mahasiswa/nilai_per_semester.dart';
import 'controllers/mahasiswa/jadwal_kuliah.dart';
import 'controllers/common/news.dart';
import 'controllers/mahasiswa/presensi.dart';
import 'controllers/mahasiswa/rekap_absensi.dart';
import 'controllers/mahasiswa/revisi_sidang_kp.dart';
import 'controllers/mahasiswa/revisi_sidang_sppa_ppa_pa.dart';
import 'controllers/mahasiswa/revisi_sidang_tesis.dart';
import 'controllers/mahasiswa/daftar_ulang.dart';
import 'controllers/mahasiswa/pengajuan_judul_kp.dart';
import 'controllers/mahasiswa/pengajuan_judul_ta.dart';
import 'controllers/mahasiswa/profile.dart';
import 'controllers/mahasiswa/profil_dosen.dart';
import 'controllers/staff/rekap_absensi.dart';
import 'controllers/staff/profil_pegawai.dart';
import 'controllers/staff/profil_pribadi.dart';
import 'controllers/staff/daily_activity.dart';
import 'controllers/dosen/unggah_soal.dart';
import 'controllers/dosen/rekap_absensi.dart';
import 'controllers/dosen/jadwal_kuliah.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await dotenv.load();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        // Mahasiswa
        ListenableProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ListenableProvider<UserController>(
          create: (_) => UserController(),
        ),
        ListenableProxyProvider<UserController, NilaiPerSemesterController>(
            update: (_, user, __) =>
                NilaiPerSemesterController(user.idMahasiswa)),
        ListenableProxyProvider<UserController, JadwalKuliahController>(
            update: (_, user, __) => JadwalKuliahController(user.idMahasiswa)),
        ListenableProvider<PengumumanController>(
          create: (_) => PengumumanController(),
        ),
        ListenableProxyProvider<UserController, PresensiController>(
            update: (_, user, __) => PresensiController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, RekapAbsensiController>(
            update: (_, user, __) => RekapAbsensiController(user.idMahasiswa)),
        ListenableProxyProvider<UserController, RevisiSidangKPController>(
            update: (_, user, __) =>
                RevisiSidangKPController(user.idMahasiswa)),
        ListenableProxyProvider<UserController, RevisiSppaPpaPaController>(
            update: (_, user, __) =>
                RevisiSppaPpaPaController(user.idMahasiswa)),
        ListenableProxyProvider<UserController, RevisiSidangTesisController>(
            update: (_, user, __) =>
                RevisiSidangTesisController(user.idMahasiswa)),
        ListenableProxyProvider<UserController, DaftarUlangController>(
            update: (_, user, __) => DaftarUlangController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, PengajuanJudulKpController>(
            update: (_, user, __) =>
                PengajuanJudulKpController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, PengajuanJudulTaController>(
            update: (_, user, __) =>
                PengajuanJudulTaController(user.nrpMahasiswa)),
        ListenableProxyProvider<UserController, ProfileController>(
            update: (_, user, __) => ProfileController(user.nrpMahasiswa)),
        ListenableProvider<ProfilDosenController>(
            create: (_) => ProfilDosenController()),
        // staff
        ListenableProxyProvider<UserController, StaffRekapAbsensiController>(
            update: (_, user, __) =>
                StaffRekapAbsensiController(user.userNomor)),
        ListenableProvider<ProfilPegawaiController>(
            create: (_) => ProfilPegawaiController()),
        ListenableProxyProvider<UserController, ProfilPribadiController>(
            update: (_, user, __) => ProfilPribadiController(user.userNip)),
        ListenableProxyProvider<UserController, DailyActivityController>(
            update: (_, user, __) => DailyActivityController(user.userNip)),
        // dosen
        ListenableProxyProvider<UserController, UnggahSoalController>(
            update: (_, user, __) => UnggahSoalController(user.userNip)),
        ListenableProxyProvider<UserController, DosenRekapAbsensiController>(
            update: (_, user, __) =>
                DosenRekapAbsensiController(user.userNomor)),
        ListenableProxyProvider<UserController, DosenJadwalKuliahController>(
            update: (_, user, __) => DosenJadwalKuliahController(user.userNip)),
      ],
      child: const MyPens(),
    ),
  );
}

class MyPens extends StatelessWidget {
  const MyPens({super.key});

  @override
  Widget build(BuildContext context) {
    final targetEnv = dotenv.env['TARGET_ENVIRONMENT'];
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'MyPENS',
      initialRoute: targetEnv == 'debug_dosen'
          ? MyPensNavRoutes.dosenBeranda
          : targetEnv == 'debug_mahasiswa'
              ? MyPensNavRoutes.mahasiswaBeranda
              : MyPensNavRoutes.splashScreen,
      routes: {
        MyPensNavRoutes.splashScreen: (context) => const SplashScreen(),
        MyPensNavRoutes.login: (context) => const Login(),
        '/berita': (context) => const News(),
        MyPensNavRoutes.mahasiswaBeranda: (context) => const MahasiswaHome(),
        '/mahasiswa/pencapaian': (context) => const Summary(),
        '/mahasiswa/profil': (context) => const MahasiswaProfile(),
        '/mahasiswa/list_akademik': (context) => const ListAkademik(),
        '/mahasiswa/nilai_per_semester': (context) => const NilaiPerSemester(),
        '/mahasiswa/rekap_absensi': (context) => const Absen(),
        '/mahasiswa/jadwal_kuliah': (context) => const JadwalKuliah(),
        '/mahasiswa/pens_attendance': (context) => const Presensi(),
        MyPensNavRoutes.revisiSidangKp: (context) => const RevisiSidangKp(),
        MyPensNavRoutes.revisiSidangSppaPpaPa: (context) =>
            const RevisiSppaPpaPa(),
        MyPensNavRoutes.revisiSidangTesis: (context) =>
            const RevisiSidangTesis(),
        MyPensNavRoutes.pengajuanTempatKp: (context) =>
            const PengajuanJudulKp(),
        MyPensNavRoutes.pengajuanJudulTa: (context) => const PengajuanJudulTa(),
        MyPensNavRoutes.mahasiswaUrusAbsensiAlpha: (context) =>
            const HistoryPengajuanScreen(),
        MyPensNavRoutes.mahasiswaUploadNilaiMBKM: (context) =>
            const MahasiswaUploadNilaiMBKM(),
        MyPensNavRoutes.entryLogbook: (context) => const WeekListLogbookMbkm(),
        MyPensNavRoutes.mahasiswaInputPengajuanAbsensi: (context) =>
            const InputPengajuanScreen(),
        '/mahasiswa/daftar_ulang': (context) => const DaftarUlang(),
        '/staff/beranda': (context) => const StaffHome(),
        '/staff/rekap_absensi': (context) => const StaffRekapAbsensi(),
        '/staff/profil_pegawai': (context) => const ProfilPegawai(),
        '/staff/daily_activity': (context) => const StaffDailyActivity(),
        '/staff/profil': (context) => const StaffProfile(),
        MyPensNavRoutes.dosenBeranda: (context) => const DosenHome(),
        '/dosen/unggah_soal': (context) => const UnggahSoal(),
        '/dosen/daily_activity': (context) => const DosenDailyActivity(),
        '/dosen/profil': (context) => const DosenProfile(),
        MyPensNavRoutes.dosenListPerizinanAbsensi: (context) =>
            const DosenListPerizinanAbsensiEntry(),
        MyPensNavRoutes.dosenDetailPerizinanAbsensi: (context) =>
            DosenDetailAbsensiAlphaEntry(
              idPengajuan:
                  ModalRoute.of(context)?.settings.arguments as int? ?? -1,
            ),
        MyPensNavRoutes.programMahasiswa: (context) => const ProgramMahasiswa(),
      },
    );
  }
}
