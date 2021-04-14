//
//  main.cpp
//  堆
//
//  Created by luokan on 2021/4/1.
//

#include <iostream>
using namespace std;

void addObj(int *array,int len,int value,int *resize){
    

}

void shiftup(int *array,int len,int idx){
    int curIdx = len;
    while (curIdx > 0) {
        
    
        int parIdx = (curIdx-1)>>1;
        curIdx = parIdx;
    }
}

void heapify(int *array,int len){
    
    
}

void removeObj(int *array,int len,int value){
    
    
}

int main(int argc, const char * argv[]) {
    int array[10] = {1,3,5,-1,-8,12,34,87,66,99};
    int resize = 10;
    
    heapify(array, 10); // 批量建堆
    
    addObj(array, 10, 101,&resize); // 添加元素
    
    return 0;
}
