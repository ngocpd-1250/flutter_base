import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LocalDataSource _localDataSource;

  AppRepositoryImpl({
    required LocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  void setOnboardingComplete() {
    _localDataSource.saveOnboardingStatus(true);
  }
}
