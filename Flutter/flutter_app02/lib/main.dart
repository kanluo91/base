
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text("我是标题"),backgroundColor: Colors.red,),
      body: HomeContent(),
    );
    return scaffold;
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      HomeProductItem("唐老鸭", "售价：100", "https://img2.baidu.com/it/u=1732627441,2510723839&fm=26&fmt=auto&gp=0.jpg"),
      HomeProductItem("唐老鸭", "售价：100", "https://img2.baidu.com/it/u=1732627441,2510723839&fm=26&fmt=auto&gp=0.jpg"),
      HomeProductItem("唐老鸭", "售价：100",  "https://img2.baidu.com/it/u=1732627441,2510723839&fm=26&fmt=auto&gp=0.jpg"),
      HomeProductItem("唐老鸭", "售价：100",  "https://img2.baidu.com/it/u=1732627441,2510723839&fm=26&fmt=auto&gp=0.jpg"),
    ],);
  }
}
class HomeProductItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imageUrl;
  
  HomeProductItem(this.title,this.desc,this.imageUrl);

  final TextStyle style1 = TextStyle(fontSize: 25,color: Colors.red);
  final TextStyle style2 = TextStyle(fontSize: 25,color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellow, // 边框颜色
          width: 5, //边框宽度
        ),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Text(title,style: style1),],
            mainAxisAlignment: MainAxisAlignment.end,),
        SizedBox(height: 8,),
        Text(desc,style: style2,),
        SizedBox(height: 8,),
        Image.network(imageUrl),
      ],),
    );
  }
}
