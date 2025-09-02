import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nutsacktodo/app/base/constants/preference_key_constants.dart';


class SPUtil {
  static SPUtil? _instance;

  static Future<SPUtil> get instance async {
    return await getInstance();
  }

  static SharedPreferences? _spf;

  SPUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SPUtil> getInstance() async {
    if (_instance == null) {
      _instance = SPUtil._();
      await _instance!._init();
    }
    return _instance!;
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  bool hasKey(String key) {
    Set<String>? keys = getKeys();
    return keys!.contains(key);
  }

  Set<String>? getKeys() {
    if (_beforeCheck()) return null;
    return _spf!.getKeys();
  }

  get(String key) {
    if (_beforeCheck()) return null;
    return _spf!.get(key);
  }

  getString(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getString(key);
  }

  Future<bool>? putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _spf!.setString(key, value);
  }

  bool? getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getBool(key);
  }

  Future<bool>? putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf!.setBool(key, value);
  }

  int? getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getInt(key);
  }

  Future<bool>? putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _spf!.setInt(key, value);
  }

  double? getDouble(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getDouble(key);
  }

  Future<bool>? putDouble(String key, double value) {
    if (_beforeCheck()) return null;
    return _spf!.setDouble(key, value);
  }

  List<String>? getStringList(String key) {
    return _spf!.getStringList(key);
  }

  Future<bool>? putStringList(String key, List<String> value) {
    if (_beforeCheck()) return null;
    return _spf!.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforeCheck()) return null;
    return _spf!.get(key);
  }

  Future<bool>? remove(String key) {
    if (_beforeCheck()) return null;
    return _spf!.remove(key);
  }

  Future<bool>? clear() {
    if (_beforeCheck()) return null;
    return _spf!.clear();
  }

  // Future<void> saveUserToPrefs(UserModel? user) async {
  //   final sp = await SPUtil.getInstance();
  //   try {
  //     String userJson = jsonEncode(user?.toJson());
  //     await sp.putString(PreferenceKeyConstants.prefKeyUserData, userJson);
  //     await sp.putBool(PreferenceKeyConstants.prefKeyIsLogin, true);
  //   } catch (e) {
  //     debugPrint('Error caught while saving the data in the SP =========> $e ; ============> 6A');
  //   }
  // }

  // Future<UserEntity?> getUserFromPrefs() async {
  //   final sp = await SPUtil.getInstance();
  //   String? userJson = sp.getString(PreferenceKeyConstants.prefKeyUserData);
  //   if (userJson == null) return null;
  //   return UserModel.fromJson(jsonDecode(userJson)).toEntity();
  // }
}
