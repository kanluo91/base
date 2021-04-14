main(List<String> args) {
  func("xxx", 20);
  printInfo1("金角大王", "你好", 21);
  printInfo2("银角大王", age: 12, message: "haha");
  printInfo3("小旋风");
}

void func(String name, int age) {
  print("name = $name age = $age");
}

// 位置可选参数
void printInfo1(String name, [String message, int age]) {
  print("name = $name message = $message age = $age");
}

// 命名可选参数
void printInfo2(String name, {String message, int age}) {
  print("name = $name message = $message age = $age");
}

// 默认参数
void printInfo3(String name, {String message = "default", int age = 30}) {
  print("name = $name message = $message age = $age");
}
