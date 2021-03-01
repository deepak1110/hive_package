library hive_helper;

import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'userEntity.dart';

class DatabaseHelper {
  static const dbName = 'myDb';
  var box = Hive.box(dbName);

  // initialise local db in void main
  static initilizeLocalDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    Hive.init(documentsDir.path);
    Hive.registerAdapter(UserEntityAdapter());
    await Hive.openBox(
      dbName,
    );
    return;
  }

  // to set the user data
  addUser(UserEntity user) async {
    try {
      box.put(dbName, user);
    } catch (e) {
      print('error ============>' + e.toString());
      throw e;
    }
  }

  // to get the user data
  UserEntity getUserData() {
    try {
      UserEntity data = box.get(dbName);
      print('get data==>' + data.username);
      // UserEntity datas = UserEntity.fromDBJson(data);
      return data;
    } catch (e) {
      print('error ============>' + e.toString());
      return null;
    }
  }

  // delete all data form the database
  deleteAll() async {
    try {
      await box.clear();
    } catch (e) {
      print('error ============>' + e.toString());
      throw e;
    }
  }

  // delete particular data from its define key
  delete(String key) async {
    try {
      box.delete(key);
      print('all data delete successfully successfully');
    } catch (e) {
      print('error ============>' + e.toString());
      throw e;
    }
  }

  // save data
  Future<String> save(String key, String value) async {
    try {
      box.put(key, value);
      return 'success';
    } catch (e) {
      print('error ============>' + e.toString());
      throw e;
    }
  }

  // get data
  Future<String> getData(String key) async {
    try {
      box.get(key);
      return 'success';
    } catch (e) {
      print('error ============>' + e.toString());
      throw e;
    }
  }
}
