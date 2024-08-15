import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/data/local/preferences/preferences.dart';
import 'package:base_flutter/data/local/storage/secure_storage.dart';
import 'package:base_flutter/data/local/storage/storage_keys.dart';

part 'local_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SecureStorage> secureStorage(SecureStorageRef ref) {
  return SecureStorage.getInstance(
      keys: StorageKeys.values.map((e) => e.name).toSet());
}

@Riverpod(keepAlive: true)
LocalDataSource localDataSource(LocalDataSourceRef ref) {
  return LocalDataSource(
    secureStorage: ref.watch(secureStorageProvider).requireValue,
    sharedPreferences: ref.watch(prefsProvider).requireValue,
  );
}
