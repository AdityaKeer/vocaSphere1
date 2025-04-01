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
    print("🔍 Checking FirebaseAuth.currentUser...");

    if (firebaseUser == null) {
      print("❌ No user found in FirebaseAuth.");
      return null;
    }
    print("✅ User found: ${firebaseUser.email}");
    return AppUser(name: '', email: firebaseUser.email!, uid: firebaseUser.uid);
  }

  @override
  Future<AppUser?> loginWithEmailPass(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // Debugging print
      print("User logged in: ${userCredential.user?.email}");

      return AppUser(name: '', email: email, uid: userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}"); // Debugging
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      print("Unexpected error: $e"); // Debugging
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      print("🚪 Logging out...");
      await firebaseAuth.signOut();
      print("✅ Logout successful!");
    } catch (e) {
      print("❌ Logout error: $e");
      throw Exception("Logout failed: $e");
    }
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
      throw Exception('Registration failed : $e');
    }
  }
}
