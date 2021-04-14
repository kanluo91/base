import 'package:flutter/material.dart';

// void main(){
//  runApp(MyHomePage());
// }

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp material = MaterialApp(home:MyHomePage());
    return material;
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Scaffold scaffold = Scaffold(appBar: AppBar(
      title: Text("我是首页"),
    ),body: MyContent(),);
    return scaffold;
  }
}


class MyContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Center center = new Center(child: MyMiddleContent01(),);
    return center;
  }
}

class MyMiddleContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    Text text = new Text("Hello world!",
      style: TextStyle(fontSize: 20,color: Colors.green),
    );

    Row row = Row(
      children: [
        Checkbox(value: true, onChanged: (value) => print("Checkbox  $value")),
        text,
        Text("你好",style: TextStyle(fontSize: 20,color: Colors.red),),
    ],
      mainAxisAlignment: MainAxisAlignment.center, // 水平居中
    );
    return row;
  }
}

class MyMiddleContent01 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyMiddleContent01>{

  var flag = true;
  @override
  Widget build(BuildContext context) {
    Text text = new Text("Hello world!",
      style: TextStyle(fontSize: 20,color: Colors.green),
    );

    Row row = Row(
      children: [
        Checkbox(value: flag, onChanged: (value) {
          print("CheckBox 状态:${value}");
          setState(() {
            this.flag = value;
          });
        }),
        text,
        Text("你好",style: TextStyle(fontSize: 20,color: Colors.red),),
      ],
      mainAxisAlignment: MainAxisAlignment.center, // 水平居中
    );
    return row;
  }
}