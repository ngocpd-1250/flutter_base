import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:base_flutter/data/data_sources/shared_preference/shared_preference_keys.dart';

@LazySingleton()
class AppPreferences {
  AppPreferences(this._sharedPreference)
      : _encryptedSharedPreferences =
            EncryptedSharedPreferences(prefs: _sharedPreference);

  final SharedPreferences _sharedPreference;
  final EncryptedSharedPreferences _encryptedSharedPreferences;

  Future<bool> saveUserToken(String? token, String? refreshToken) async {
    return await _encryptedSharedPreferences.setString(
          SharedPreferenceKeys.accessToken,
          token ?? '',
        ) &&
        await _encryptedSharedPreferences.setString(
          SharedPreferenceKeys.refreshToken,
          refreshToken ?? '',
        );
  }

  Future<bool> saveDeviceToken(String token) {
    return _sharedPreference.setString(
      SharedPreferenceKeys.deviceToken,
      token,
    );
  }

  Future<String> get accessToken {
    return _encryptedSharedPreferences
        .getString(SharedPreferenceKeys.accessToken);
  }
}
