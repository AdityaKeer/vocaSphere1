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
      print(" No user found in FirebaseAuth.");
      return null;
    }
    print(" User found: ${firebaseUser.email}");
    return AppUser(name: '', email: firebaseUser.email!, uid: firebaseUser.uid);
  }

  @override
  Future<AppUser?> loginWithEmailPass(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      print("User logged in: ${userCredential.user?.email}");

      return AppUser(name: '', email: email, uid: userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      print("Unexpected error: $e"); // Debugging
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      print(" Logout successful!");
    } catch (e) {
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

      // await firebaseFirestore.collection("users").doc(user.uid).set({
      //   "name": name,
      //   "email": email,
      //   "Progress": {
      //     "Japanese": {
      //       "lastVisitedLevel": "JpLvl1",
      //       "completedLevels": ["JpLvl1"],
      //     },
      //     "Hindi": {
      //       "lastVisitedLevel": "HnLvl1",
      //       "completedLevels": ["HnLvl1"],
      //     },
      //     "Marathi": {
      //       "lastVisitedLevel": "MrLvl1",
      //       "completedLevels": ["MrLvl1"],
      //     },
      //     "Sanskrit": {
      //       "lastVisitedLevel": "SaLvl1",
      //       "completedLevels": ["SaLvl1"],
      //     },
      //     "English": {
      //       "lastVisitedLevel": "EnLvl1",
      //       "completedLevels": ["EnLvl1"],
      //     },
      //   },
      // });

      return user;
    } catch (e) {
      throw Exception('Registration failed : $e');
    }
  }
}
