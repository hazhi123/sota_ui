import 'package:shared_preferences/shared_preferences.dart';

setLocalStorageSui(String type, String key, value) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  switch (type) {
    case 'bool':
      store.setBool(key, value);
      break;
    case 'string':
      store.setString(key, value);
      break;
    case 'list':
      store.setStringList(key, value);
      break;
    case 'int':
      store.setInt(key, value);
      break;
    case 'double':
      store.setDouble(key, value);
      break;
    case 'del':
      store.remove(key);
      break;
  }
}

getLocalStorageSui(String type, String key) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  switch (type) {
    case 'bool':
      if (store.getBool(key) == null) store.setBool(key, false);
      return store.getBool(key) ?? false;
    case 'string':
      if (store.getString(key) == null) store.setString(key, '');
      return store.getString(key) ?? '';
    case 'list':
      if (store.getStringList(key) == null) store.setStringList(key, []);
      return store.getStringList(key) ?? [];
    case 'int':
      if (store.getInt(key) == null) store.setInt(key, 0);
      return store.getInt(key) ?? 0;
    case 'double':
      if (store.getDouble(key) == null) store.setDouble(key, 0.0);
      return store.getDouble(key) ?? 0.0;
  }
  return null;
}
