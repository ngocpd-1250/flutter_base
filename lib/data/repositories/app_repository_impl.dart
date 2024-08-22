import 'package:base_flutter/data/local/local_data_source.dart';
import 'package:base_flutter/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LocalDataSource _localDataSource;

  AppRepositoryImpl({
    required LocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  void setOnboardingComplete() {
    _localDataSource.setOnboardingStatus(true);
  }

  @override
  bool getOnboardingStatus() {
    return _localDataSource.getOnboardingStatus();
  }

  @override
  void setDarkModeStatus(bool isDarkMode) {
    _localDataSource.setDarkModeStatus(isDarkMode);
  }

  @override
  bool getDarkModeStatus() {
    return _localDataSource.getDarkModeStatus();
  }

  @override
  void setJapaneseLanguageStatus(bool isJapanese) {
    _localDataSource.setJapaneseLanguageStatus(isJapanese);
  }

  @override
  bool getJapaneseLanguageStatus() {
    return _localDataSource.getJapaneseLanguageStatus();
  }
}
