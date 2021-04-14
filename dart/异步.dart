// import "dart:io"
// main(List<String> args) {
//   print("-----Start-----");

//   sleep(Duration(seconds: 3));

//   print("-----end-----");
// }

main(List<String> args) {
  print("request start");
  var data = getData();
  data.then((value) {
    print(value);
  });
  print("request end");
}

Future<String> getData() async {
  var result = await Future.delayed(Duration(seconds: 3), () {
    return "network data";
  });

  return "请求结果" + result;
}
