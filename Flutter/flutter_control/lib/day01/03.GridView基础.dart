import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_control/day01/01.%E5%B8%83%E5%B1%80.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("滚动控件"),),
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
  @override
  Widget build(BuildContext context) {
    return GridViewDemo5();
  }
}

// 代理： 固定数量
class GridViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5), // 水平间距
      // 设置vertical 有个问题： grid 在间距上滚动不显示
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8, //  ratio = 宽度/高度
          crossAxisSpacing: 10, // 交叉轴的间距
          mainAxisSpacing: 10, // 主轴的间距
        ),
        children: List.generate(100-1, (index) {
          return Container(color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1));
        }),

      ),
    );
  }
}

// 代理 固定宽度
class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5), // 水平间距
      // 设置vertical 有个问题： grid 在间距上滚动不显示
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:150,
        ),
        children: List.generate(100-1, (index) {
          return Container(color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1));
        }),

      ),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Text("hellow or"),
        Text("hellow or"),
        Text("hellow or"),
        Text("hellow or"),
        Text("hellow or"),
        Text("hellow or"),
        Text("hellow or"),
      ],
    );
  }
}

class GridViewDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(maxCrossAxisExtent: 100,children: [
      Text("hellow or"),
      Text("hellow or"),
      Text("hellow or"),
      Text("hellow or"),
      Text("hellow or"),
      Text("hellow or"),
      Text("hellow or"),
    ],);
  }
}

class GridViewDemo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bgcolor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256) , 1);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder:(BuildContext ctx,int index){
            return Container(color:  Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256) , 1));
          }),
    );
  }
}


