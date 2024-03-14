import 'package:mypens/features/auth/services/user_type_enum.dart';

abstract class User {
  final String email;
  /// Primary key dari user
  final int nomorUser;
  final String namaUser;
  final UserType tipeUser;

  User({
    required this.email,
    required this.nomorUser,
    required this.namaUser,
    required this.tipeUser,
  });
}