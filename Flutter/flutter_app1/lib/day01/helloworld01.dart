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
    Text text = new Text("Hello world!!! haha ",
      style: TextStyle(fontSize: 40,color: Colors.green),
    );
    Center center = new Center(child: text,);
    Scaffold scaffold = Scaffold(appBar: AppBar(
      title: Text("我是首页"),
    ),body: center,);
    return scaffold;
  }
}
