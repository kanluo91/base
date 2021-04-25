import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
    return ListViewDemo3();
  }
}

class ListViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(100, (index){
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete_forever),
          title:Text("标题: $index"),
          subtitle: Text("子标题 $index"),
        );
      }),

    );
  }
}

class ListViewDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        // reverse: true, // 反转
        itemExtent: 400, // 设置固定高度  如果是水平滚动 那么就是固定宽度
        children: <Widget>[
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.blue,),
          Container(color: Colors.purple,),
          Container(color: Colors.orange,),
        ],
      ),
    );
  }
}

class ListViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
          return Text("hello world $index");
        });
  }
}


class ListViewDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext ctx,int index){
          return Text("hello world $index");
        },
        separatorBuilder: (BuildContext ctx,int index){
          return Divider(color: Colors.red,indent: 30,endIndent: 30,thickness: 3,);
        },
        itemCount: 100);
  }
}








