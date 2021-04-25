import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("基础控件"),),
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
    return StackDemo1();
  }
}

class ButtonDemo1 extends StatelessWidget {
  const ButtonDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FlatButton(
        onPressed: () {
          print("click Flat Button");
        },
        child: Text("Flutter Button"),
        textColor: Colors.green,
        color: Colors.red,
      ),
      FlatButton(
        minWidth: 200,
        height: 100,
        highlightColor: Colors.yellow,
        padding: EdgeInsets.all(30),
        onPressed: (){},
        child: Text("Flutter Button"),
        color: Colors.green,
        textColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ]);
  }
}

// 图片1
class ImageDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
        image: NetworkImage("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=559317975,2675578009&fm=26&gp=0.jpg"));
  }
}

// 图片2
class ImageDemo2 extends StatelessWidget {
  final String imUrl = "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=559317975,2675578009&fm=26&gp=0.jpg";
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeInDuration: Duration(milliseconds: 1),
      fadeOutDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/1.png"),
      image: NetworkImage(imUrl),
    );
  }
}

// 圆角图片3

class ImageDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200 ,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg")),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              offset: Offset(3,3),
              blurRadius: 20,
            )
          ],
        ),
      ),
    );
  }
}


class TextFieldDemo1 extends StatefulWidget {
  @override
  _TextFieldDemo1State createState() => _TextFieldDemo1State();
}

class _TextFieldDemo1State extends State<TextFieldDemo1> {

  final usernameTFController = TextEditingController();
  final pwdTFController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: usernameTFController,
            style: TextStyle(fontSize: 21,color: Colors.green),
            cursorColor: Colors.red,
            decoration: InputDecoration(
              labelText: "用户名:",
              hintText: "请输入用户名",
              fillColor: Colors.yellow,
              icon: Icon(Icons.people,color: Colors.green,),
              border: OutlineInputBorder(
              ),
            ),
            onSubmitted: (value) {
              print("submit ${value}");
            },

          ),
          SizedBox(height: 10,),
          TextField(
            controller: pwdTFController,
            style: TextStyle(fontSize: 21,color: Colors.green),
            cursorColor: Colors.red,
            decoration: InputDecoration(
              labelText: "密码:",
              hintText: "请输入密码",
              fillColor: Colors.yellow,
              icon: Icon(Icons.lock,color: Colors.green,),
              border: OutlineInputBorder(
              ),
            ),
            onSubmitted: (value) {
              print("submit ${value}");
            },

          ),
          SizedBox(height: 10,),
          FlatButton(
            onPressed: (){
              // 1. 获取用户名 和 密码
              final username = usernameTFController.text;
              final pwd = pwdTFController.text;
              print("账号:$username 密码:$pwd");

              // 2. 登录请求


            },
            child: Text("登录",style: TextStyle(fontSize: 20,color: Colors.white),),
            color: Colors.green,
            minWidth: 300,
            height: 50,
          ),

        ],)
    );
  }
}

class LayoutDemo1 extends StatefulWidget {
  @override
  _LayoutDemo1State createState() => _LayoutDemo1State();
}

class _LayoutDemo1State extends State<LayoutDemo1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.red,
          width: 10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            offset: Offset(3,3),
            blurRadius: 3,
          )
        ],
        image: DecorationImage(image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg")),
        // gradient: LinearGradient(
        //   colors: [Colors.red,Colors.orange],
        // ),

      ),
      width: 300,
      height: 300,
      child: Container(),
    );
  }
}

// stack

class StackDemo1 extends StatefulWidget {
  @override
  _StackDemo1State createState() => _StackDemo1State();
}

class _StackDemo1State extends State<StackDemo1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.green,
          width: 300,
          height: 300,
        ),
        Positioned(
          child: Icon(Icons.favorite,size: 40,),
          left: 10,
          top: 20,
        ),
        Positioned(
          child: Container(color: Colors.red,child: Text("你好，我是一个文本",style: TextStyle(color: Colors.yellow),)),
          bottom: 10,
          right: 10,
        )

      ],

    );
  }
}





