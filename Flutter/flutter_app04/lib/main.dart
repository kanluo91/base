import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("基础控件"),),
        body: AppContent(),
      ),
    );
  }
}

class AppContent extends StatefulWidget {
  @override
  _AppContentState createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        textAlign: TextAlign.center,// 居中
        maxLines: 2,// 最多多少行
        overflow: TextOverflow.ellipsis, // 显示省略号
        textScaleFactor: 1.3,// 字体的缩放因子
        style: TextStyle(fontSize: 32,color:Colors.green),),
    );
  }
}
