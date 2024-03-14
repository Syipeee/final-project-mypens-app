import 'package:mypens/features/auth/services/entity/user.dart';

class Mahasiswa extends User {
  final int nrp;
  Mahasiswa({
    required this.nrp,
    required super.email,
    required super.namaUser,
    required super.nomorUser,
    required super.tipeUser,
  });
}