import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:base_flutter/data/local/preferences/preferences_key.dart';
import 'package:base_flutter/data/local/storage/secure_storage.dart';
import 'package:base_flutter/data/local/storage/storage_keys.dart';
import 'package:base_flutter/data/model/auth_token.dart';
import 'package:base_flutter/data/model/user_data.dart';

class LocalDataSource {
  LocalDataSource({
    required SecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
  })  : _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences;
  final SecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  void saveAuthTokens(AuthToken token) {
    _secureStorage.set(StorageKeys.accessToken.name, token.accessToken);
    _secureStorage.set(StorageKeys.refreshToken.name, token.refreshToken ?? '');
  }

  AuthToken? getAuthTokens() {
    final accessToken = _secureStorage.get(StorageKeys.accessToken.name);
    final refreshToken = _secureStorage.get(StorageKeys.refreshToken.name);

    if (accessToken != null) {
      return AuthToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }

    return null;
  }

  void removeAuthTokens() {
    _secureStorage.remove(StorageKeys.accessToken.name);
    _secureStorage.remove(StorageKeys.refreshToken.name);
  }

  void saveUser(UserData user) {
    final raw = jsonEncode(user.toJson());
    _sharedPreferences.setString(SharedPreferencesKeys.user.name, raw);
  }

  void setOnboardingStatus(bool isDone) {
    _sharedPreferences.setBool(
        SharedPreferencesKeys.isDoneOnboarding.name, isDone);
  }

  bool getOnboardingStatus() {
    return _sharedPreferences
            .getBool(SharedPreferencesKeys.isDoneOnboarding.name) ??
        false;
  }

  void setDarkModeStatus(bool isDarkMode) {
    _sharedPreferences.setBool(
        SharedPreferencesKeys.isDarkMode.name, isDarkMode);
  }

  bool getDarkModeStatus() {
    return _sharedPreferences.getBool(SharedPreferencesKeys.isDarkMode.name) ??
        false;
  }

  void setJapaneseLanguageStatus(bool isJapanese) {
    _sharedPreferences.setBool(
        SharedPreferencesKeys.isJapanese.name, isJapanese);
  }

  bool getJapaneseLanguageStatus() {
    return _sharedPreferences.getBool(SharedPreferencesKeys.isJapanese.name) ??
        false;
  }

  void clearLocalData() {
    _secureStorage.removeAll();
    _sharedPreferences.clear();
  }
}
