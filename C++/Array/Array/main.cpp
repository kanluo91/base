//
//  main.cpp
//  Array
//
//  Created by luokan on 2021/3/10.
//

#include <iostream>
#include <array>
using namespace std;

int main(int argc, const char * argv[]) {
    
    // 1. 初始化 10个元素的double数据  必须是常量 不能是变量 内部的值 不会默认初始化为0 现在里面的值 不确定
    array<double, 10> values;
    
    array<double, 10> values2{}; // 默认值是0
    
    
    int size = values.size();
    
    int max_size = values.max_size();
    
    bool empty = values.empty();
    
    int indexValue = values2.at(2);
    
    
    
    
    return 0;
}
