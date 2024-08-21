import 'package:firebase_auth/firebase_auth.dart';

import 'package:base_flutter/data/base/data_source.dart';
import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/data/model/auth_token.dart';

class FirebaseDataSource with DataSource {
  final FirebaseAuth _firebaseAuth;
  final LocalDataSource? _localDataSource;

  FirebaseDataSource({
    FirebaseAuth? firebaseAuth,
    LocalDataSource? localDataSource,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _localDataSource = localDataSource;

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

      final token =
          AuthToken(accessToken: userCredential.user?.refreshToken ?? '');
      _localDataSource?.saveAuthTokens(token);

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
