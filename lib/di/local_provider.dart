import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/data/local/storage/secure_storage.dart';

part 'local_provider.g.dart';

@Riverpod(keepAlive: true)
SecureStorage secureStorage(SecureStorageRef ref) {
  return throw UnimplementedError();
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
LocalDataSource localDataSource(LocalDataSourceRef ref) {
  return LocalDataSource(
    secureStorage: ref.watch(secureStorageProvider),
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  );
}
