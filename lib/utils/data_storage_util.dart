import 'package:shared_preferences/shared_preferences.dart';

const String boolConst = 'bool';
const String stringConst = 'string';
const String listConst = 'list';
const String intConst = 'int';
const String doubleConst = 'double';
const String delConst = 'del';

setStorageSui(String type, String key, value) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  switch (type) {
    case boolConst:
      store.setBool(key, value);
      break;
    case stringConst:
      store.setString(key, value);
      break;
    case listConst:
      store.setStringList(key, value);
      break;
    case intConst:
      store.setInt(key, value);
      break;
    case doubleConst:
      store.setDouble(key, value);
      break;
    case delConst:
      store.remove(key);
      break;
  }
}

getStorageSui(String type, String key) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  switch (type) {
    case boolConst:
      if (store.getBool(key) == null) store.setBool(key, false);
      return store.getBool(key) ?? false;
    case stringConst:
      if (store.getString(key) == null) store.setString(key, '');
      return store.getString(key) ?? '';
    case listConst:
      if (store.getStringList(key) == null) store.setStringList(key, []);
      return store.getStringList(key) ?? [];
    case intConst:
      if (store.getInt(key) == null) store.setInt(key, 0);
      return store.getInt(key) ?? 0;
    case doubleConst:
      if (store.getDouble(key) == null) store.setDouble(key, 0.0);
      return store.getDouble(key) ?? 0.0;
  }
  return null;
}
