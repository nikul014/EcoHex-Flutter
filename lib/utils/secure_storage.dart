import 'package:flutter_secure_storage/flutter_secure_storage.dart';

typedef StringList = List<String>;

enum EncryptedPrefKeys {
  awsCognitoUserName,
  awsCognitoUserEmail,
  awsCognitoPassword,
  awsUserRefreshToken,
  awsUserIdToken,
  awsUserData,
}

///Used for SharedPref save and get the value.
class SecureStorageUtil {
  static final SecureStorageUtil _singleton = SecureStorageUtil._internal();

  static FlutterSecureStorage? _storage = const FlutterSecureStorage(
      iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device),
      aOptions: AndroidOptions(encryptedSharedPreferences: false));

  SecureStorageUtil._internal();

  factory SecureStorageUtil() {
    return _singleton;
  }

  static initSecureStorage() async {
    _storage ??= const FlutterSecureStorage(
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
  }

  static setValue({required String key, var value}) async {
    _storage ??= const FlutterSecureStorage(
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await _storage?.write(key: key, value: value);
  }

  static getValue({required String key}) async {
    _storage ??= const FlutterSecureStorage(
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    return await _storage?.read(key: key);
  }

  static clear() async {
    _storage ??= const FlutterSecureStorage(
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await _storage?.deleteAll();
  }

  ///Remove the key value pair
  static removeKey({required String key}) async {
    _storage ??= const FlutterSecureStorage(
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await _storage?.delete(key: key);
  }
}
