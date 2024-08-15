import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/data/remote/auth_remote_data_source.dart';

part 'remote_data_source_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource();
}
