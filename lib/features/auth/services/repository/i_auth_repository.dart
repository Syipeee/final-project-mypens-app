import 'package:mypens/features/auth/services/entity/user.dart';

abstract class IAuthRepository {
  Future<User> login({
    required String email,
    required String password,
  });
}