import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/data/remote/firebase_data_source.dart';

part 'firebase_data_source_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseDataSource firebaseDataSource(FirebaseDataSourceRef ref) {
  return FirebaseDataSource();
}
