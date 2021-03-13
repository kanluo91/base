//
//  main.cpp
//  queue
//
//  Created by luokan on 2021/3/10.
//

#include <iostream>
#include <queue>
using namespace std;

int main(int argc, const char * argv[]) {
    
    // 队列只允许 对头删除元素  队尾添加元素
    queue<int> t;
    
    for (int i =0; i<10; i++) {
        t.push(i); //
    }
    
    for (int i  = 0; i<10; i++) {
        cout << t.front() << "- "<< t.back() << endl;
        t.pop();
    }
    

    return 0;
}
