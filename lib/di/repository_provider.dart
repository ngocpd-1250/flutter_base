import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/data/repositories/app_repository_impl.dart';
import 'package:base_flutter/data/repositories/auth_repository_impl.dart';
import 'package:base_flutter/di/firebase_data_source_provider.dart';
import 'package:base_flutter/di/local_provider.dart';
import 'package:base_flutter/domain/repositories/app_repository.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    firebaseDataSource: ref.watch(firebaseDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
AppRepository appRepository(AppRepositoryRef ref) {
  return AppRepositoryImpl(
    localDataSource: ref.watch(localDataSourceProvider),
  );
}
