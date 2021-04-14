main(List<String> args) {
  var st = Student("金角大王", 200);

  print("${st.name} ${st.getAge} ${st.age}"); // 金角大王  100  200
}

class Student {
  String name;
  int age;

  Student(this.name, this.age);

  int get getAge {
    if (this.age >= 100) return 100;
    if (this.age <= 0) return 0;
    return this.age;
  }

  set setAge(int age) {
    if (age >= 100) {
      this.age = 100;
    } else if (age <= 0) {
      this.age = 0;
    } else {
      this.age = age;
    }
  }
}
