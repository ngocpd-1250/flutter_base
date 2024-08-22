import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/data/remote/firebase_data_source.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseDataSource _firebaseDataSource;
  final LocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required FirebaseDataSource firebaseDataSource,
    required LocalDataSource localDataSource,
  })  : _firebaseDataSource = firebaseDataSource,
        _localDataSource = localDataSource;

  @override
  Future login(String username, String password) async {
    await _firebaseDataSource.signIn(email: username, password: password);
  }

  @override
  Future register(String username, String password) async {
    await _firebaseDataSource.signUp(email: username, password: password);
  }

  @override
  Future logout() async {
    _localDataSource.removeAuthTokens();
  }
}
