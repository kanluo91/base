import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_control/day01/01.%E5%B8%83%E5%B1%80.dart';
import 'package:flutter_control/DataService.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("JSON 加载"),),
        body: HomePage(),
    ),);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageContent();
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  List<UserModel> datas = [];
  @override
  void initState() {
    getData().then((value){
      setState(() {
        this.datas = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JsonDemo1(this.datas);
  }
}

class JsonDemo1 extends StatelessWidget {
  List<UserModel> datas = [];
  JsonDemo1(this.datas);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(this.datas.length, (index){
        UserModel usermodel = this.datas[index];
        print("index = $index data = $usermodel");
        return ListTile(
          leading: Image(image: NetworkImage(usermodel.pic)),
          trailing: Icon(Icons.inventory),
          title: Text(usermodel.nickName),
          subtitle: Text("子标题"),
        );
      }),
    );
  }
}

