import 'package:firebase_auth/firebase_auth.dart';

import 'package:base_flutter/data/base/data_source.dart';

class FirebaseDataSource with DataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseDataSource({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await excuse(() async {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    });

    return response;
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    final response = await excuse(() async {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    });
    return response;
  }
}
