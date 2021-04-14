int main(List<String> args) {
  var p = Points(3, 4);
  print(p.distance);

  var st = new Student.fromName("金角大王");
  print(st);

  var m1 = Monkey1("m1");
  var m2 = Monkey1("m1");
  print(identical(m1, m2)); // false

  var m3 = Monkey1("m1");
  var m4 = Monkey1("m1");
  print(identical(m3, m3)); // true

  var p1 = Persion("1");
  var p2 = Persion("2");
  var p3 = Persion("1");

  print(identical(p1, p2)); // false
  print(identical(p1, p3)); // true
}

class Points {
  final num x;
  final num y;
  final num distance;

  Points(this.x, this.y) : distance = x * x + y * y;
}

class Student {
  String name;
  int age;
  Student(this.name, this.age);
  Student.fromName(String name) : this(name, 30);

  String toString() {
    return "${this.name} + ${this.age}";
  }
}

class Monkey1 {
  String name;
  Monkey1(this.name);
}

class Monkey2 {
  final String name;
  const Monkey2(this.name);
}

class Persion {
  String name;
  int age;

  static final Map<String, Persion> _cache = {};

  Persion._inter(this.name);

  factory Persion(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final p = Persion._inter(name);
      _cache[name] = p;
      return p;
    }
  }
}
