import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home:MyHomePage());
  }
}

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我是标题",style: TextStyle(fontSize: 20,color: Colors.red),),),
      body: MyHomeContent(),
    );
  }
}

class MyHomeContent extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MyHomeContentWidget();
  }
}

class MyHomeContentWidget extends State<MyHomeContent>{
  int cnt = 0;
   @override
  Widget build(BuildContext context) {
     return Center(child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center
           ,children: [
            RaisedButton(child: Icon(Icons.add),onPressed: (){
            setState(() {
              cnt++;
            });

            }),
           RaisedButton(child: Icon(Icons.reduce_capacity),onPressed: (){
            setState(() {
              cnt--;
            });
           }),
         ],),
         SizedBox(height: 20,),
         Text("计数器的值:$cnt"),
       ],
     ));
  }
}

