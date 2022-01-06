/// Author(s): Parisa Alipajooh
///Last Edited: 31/05/2021 11:02 AM
///
///

import 'package:shared_preferences/shared_preferences.dart';

class  StorageUtil{

  static const String CLASS_NAME = 'StorageUtil';
  StorageUtil(){
    //some initializations
  }


  static Future<void> setDataInSP(String key, String data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  static Future<void> setListInSP(String key, List data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, data);
  }

  static Future<List<String>> getListFromSP(String key) async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List result = prefs.getStringList(key);
      return result;
    }catch(e){
      //Logger.log(CLASS_NAME, 'getDataFromSP', e.toString());
      return null;
    }
  }


  static Future<String> getDataFromSP(String key) async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String result = prefs.getString(key);
      return result;
    }catch(e){
      //Logger.log(CLASS_NAME, 'getDataFromSP', e.toString());
      return null;
    }
  }

  static Future<void> setDataInSPInt(String key, int data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, data);
  }

  static Future<int> getDataFromSPInt(String key) async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int result = prefs.getInt(key);
      return result;
    }catch(e){
      //Logger.log(CLASS_NAME, 'getDataFromSPInt', e.toString());
      return null;
    }
  }

  static Future<void> setDataInSPBool(String key, bool data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, data);
  }

  static Future<bool> getDataFromSPBool(String key) async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool result = prefs.getBool(key);
      return result;
    }catch(e){
      //Logger.log(CLASS_NAME, 'getDataFromSPBool', e.toString());
      return null;
    }
  }

  static Future<void> setDataInSPList(String key, List data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, data);
  }

  static Future<List> getDataFromSPList(String key) async{
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> result = prefs.getStringList(key);
      return result;
    }catch(e){
      //Logger.log(CLASS_NAME, 'getDataFromSPList', e.toString());
      return null;
    }
  }

  static Future clearAllSP() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future clearByKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}