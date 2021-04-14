import "dart:async"
main(List<String> args){

  scheduleMicrotask((),{
    print("我是个微任务");
  });

}


