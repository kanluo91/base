main(List<String> args) {
  var lt = Location<int>(10, 20);
  print("${lt.x} ${lt.y}");
}

class Location<T extends num> {
  T x;
  T y;
  Location(this.x, this.y);
}
