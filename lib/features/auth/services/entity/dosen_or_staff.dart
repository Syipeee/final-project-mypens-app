import 'package:mypens/features/auth/services/entity/user.dart';

class DosenOrStaff extends User {
  /// Nomor induk pegawai
  final String nip;
  DosenOrStaff({
    required this.nip,
    required super.email,
    required super.namaUser,
    required super.nomorUser,
    required super.tipeUser,
  });
}