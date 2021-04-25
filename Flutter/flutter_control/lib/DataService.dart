import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class UserModel {
  String nickName;
  String pic;
  UserModel({this.nickName,this.pic});
  UserModel.withMap(Map<String,dynamic> parseMap){
    this.nickName = parseMap["name"];
    this.pic = parseMap["pic"];
  }
  // @override
  // String toString() {
  //   return "姓名: ${this.nickName},头像:${this.pic}";
  // }
}

Future <List<UserModel>> getData() async{
  List<UserModel> datas =  new List();
  String jsonString = await rootBundle.loadString("assets/json/data.json");
  final jsonRst = json.decode(jsonString);
  for(Map<String,dynamic> data in jsonRst){
    datas.add(UserModel.withMap(data));
  }
  return datas;
}

// Future <List<UserModel>> getData() async{
//
//   List<UserModel> datas = new List();
//
//
//
//   return datas;
// }