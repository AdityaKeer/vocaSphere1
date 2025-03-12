import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:major_project1/features/authentication/domain/entities/app_user.dart';
import 'package:major_project1/features/authentication/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return null;
    }

    return AppUser(name: '', email: firebaseUser.email!, uid: firebaseUser.uid);
  }

  @override
  Future<AppUser?> loginWithEmailPass(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(
        name: '',
        email: email,
        uid: userCredential.user!.uid,
      );
      return user;
    } catch (e) {
      throw Exception('Login failed : $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> registerWithEmailPass(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(
        name: name,
        email: email,
        uid: userCredential.user!.uid,
      );

      //save user data in fireStore
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());

      return user;
    } catch (e) {
      print('Registration failed : $e');
      throw Exception('Registration failed : $e');
    }
  }
}
