import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);
  static const CachingKey USER = const CachingKey('USER');
  static const CachingKey TOKEN = const CachingKey('REAL_TOKEN');
  static const CachingKey FIRST_TIME = const CachingKey('FIRST_TIME');
}

class SharedHelper {
  late SharedPreferences _shared;

  removeData(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    _shared.remove(key.value);
  }

  clear(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    _shared.clear();
  }

  logout() async {
    _shared = await SharedPreferences.getInstance();
    await removeData(CachingKey.TOKEN);
  }

  writeData(CachingKey key, value) async {
    _shared = await SharedPreferences.getInstance();
    print("Saving >>> $value local >>> with key ${key.value}");
    if (value is String) {
      _shared.setString(key.value, value);
    } else if (value is int) {
      _shared.setInt(key.value, value);
    } else if (value is bool) {
      _shared.setBool(key.value, value);
    } else if (value is double) {
      _shared.setDouble(key.value, value);
    } else {
      return null;
    }
  }

  Future<dynamic> readBoolean(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getBool(key.value));
  }

  Future<dynamic> readDouble(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getDouble(key.value));
  }

  Future<dynamic> readInteger(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getInt(key.value));
  }

  Future<dynamic> readString(CachingKey key) async {
    _shared = await SharedPreferences.getInstance();
    return Future.value(_shared.getString(key.value));
  }
}
