//
//  main.cpp
//  斐波那契数
//
//  Created by luokan on 2021/1/4.
//

#include <iostream>
using namespace std;

#pragma mark -
#pragma mark fib基础版
int fib(int n){
    if(n <= 2) return 1;
    return fib(n-1) + fib(n-2);
}

#pragma mark -
#pragma mark fib 优化版(防止重复计算)
int fib2(int n,int *array){
    if(n<=2) return 1;
    if(array[n] == 0){
        array[n] = fib2(n-1,array)+fib2(n-2, array);
    }
    return array[n];
}

int main(int argc, const char * argv[]) {
    int value = fib(10);
    int array[11];
    int value2 = fib2(10,array);
    cout<<"fib(10)=" << value<<endl;
    cout<<"fib2(10,array)=" << value2<<endl;
    return 0;
}
