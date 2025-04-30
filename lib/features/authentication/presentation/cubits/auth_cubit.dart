import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/authentication/domain/entities/app_user.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_states.dart';
import 'package:major_project1/features/authentication/domain/repos/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check if user is already authenticated
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(UnAuthenticated());
    }
  }

  //get current user
  AppUser? get currentUser => _currentUser;

  //login with email + pw
  Future<void> login(String email, String pass) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPass(email, pass);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError('Login failed: $e'));
    }
  }

  //register with email + pass
  Future<void> register(String name, String email, String pass) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailPass(name, email, pass);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  //logout
  Future<void> logOut() async {
    try {
      await authRepo.logout();
      _currentUser = null;
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError('Logout failed: $e'));
    }
  }
}
