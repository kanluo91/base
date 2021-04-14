main(List<String> args) {
  var p = new Persion("kk", 32);
  p.eat();
  print(p);

  Car.brand = "比亚迪";
  Car.showBrand();

  print(Colors.alpha.index); // 3
  print(Colors.values); // [Colors.red, Colors.green, Colors.blue, Colors.alpha]
}

enum Colors { red, green, blue, alpha }

class Animal {
  int age;
  Animal(this.age);

  void run() {
    print("Animal run");
  }
}

class Persion extends Animal {
  String name;

  Persion(String name, int age)
      : name = name,
        super(age);

  void eat() {
    print("persion ear");
  }

  String toString() {
    return "${this.name} ${this.age}";
  }
}

class Car {
  static String brand;

  static void showBrand() {
    print("${Car.brand}");
  }
}
