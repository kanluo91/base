main(List<String> args){
	String name = "金角大王";
	print(name);
	print(name.runtimeType);

	test((abc){
	print(abc);

	var info = "金角大王";
	info ??= "银角大王";
	print(info);
	
var p = Persion()
	..name = "金角"
	..age = 18;
print(${p.name});

});

class Persion {
String name;
int age;
};

var movies = ["哥斯拉","蝙蝠侠","海贼王"];
print(movies);	
	
}

void test(Function foo){
foo("hello world");
}