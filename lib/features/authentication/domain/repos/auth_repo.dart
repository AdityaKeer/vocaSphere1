import 'package:major_project1/features/authentication/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPass(String email, String password);
  Future<AppUser?> registerWithEmailPass(
    String name,
    String email,
    String password,
  );

  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
