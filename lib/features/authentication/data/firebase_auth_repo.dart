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
      print("No user found in FirebaseAuth.");
      return null;
    }
    print("User found: ${firebaseUser.email}");
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
      print("Logout successful!");
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

      AppUser user = AppUser(
        name: name,
        email: email,
        uid: userCredential.user!.uid,
      );

      Map<String, dynamic> initialProgress = {
        "Hindi": {"LastVisitedLevel": "", "CompletedLevels": []},
        "Japanese": {"LastVisitedLevel": "", "CompletedLevels": []},
        "Marathi": {"LastVisitedLevel": "", "CompletedLevels": []},
        "English": {"LastVisitedLevel": "", "CompletedLevels": []},
        "Sanskrit": {"LastVisitedLevel": "", "CompletedLevels": []},
      };

      await firebaseFirestore.collection("users").doc(user.uid).set({
        ...user.toJson(),
        "progress": initialProgress,
      });

      print(" User registered and progress initialized!");
      return user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> saveUserProgress(
    String language,
    String lastVisitedLevel,
    List<String> completedLevels,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    if (language.isEmpty || lastVisitedLevel.isEmpty) {
      return;
    }

    print(" Saving Progress for $language:");
    print("Last Visited Level: $lastVisitedLevel");
    print("Completed Levels: $completedLevels");

    await firebaseFirestore.collection("users").doc(user.uid).set({
      "progress": {
        language: {
          "LastVisitedLevel": lastVisitedLevel,
          "CompletedLevels": completedLevels,
        },
      },
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>> getUserProgress(String language) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return {};

    final doc = await firebaseFirestore.collection("users").doc(user.uid).get();

    if (doc.exists) {
      final data = doc.data();

      return (data?["progress"]?[language] as Map<String, dynamic>?) ??
          {"LastVisitedLevel": "", "CompletedLevels": []};
    }
    return {};
  }

  // Future<Map<String, dynamic>> getQuizList(String language) async {
  //   final doc =
  //       await firebaseFirestore.collection("quizes").doc(language).get();
  //   if (doc) {}
  // }
}
