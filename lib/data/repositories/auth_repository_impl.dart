import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/data/model/user_data.dart';
import 'package:base_flutter/data/remote/auth_remote_data_source.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required LocalDataSource localDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future login(String username, String password) async {
    final authToken = await _authRemoteDataSource.login(username, password);
    _localDataSource.saveAuthTokens(authToken);
    _localDataSource.saveUser(UserData(id: 1, name: username));
  }

  @override
  Future logout() async {
    _localDataSource.clearLocalData();
  }
}
