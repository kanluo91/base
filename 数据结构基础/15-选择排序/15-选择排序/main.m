//
//  main.m
//  15-选择排序
//
//  Created by luokan on 2020/6/23.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MaxCount  200

void SelectSort(int *array,int len){
    
    for (int end = len-1; end>0; end--) {
        int maxIndex = 0;
        for (int begin = 0; begin <= end; begin++) {
            if(array[begin] > array[maxIndex]){
                maxIndex = begin;
            }
        }
        
        // 交换最大的值 和数组最后一个数的位置
        int temp = array[end];
        array[end] = array[maxIndex];
        array[maxIndex] = temp;
    }
}

void LogArray(int *array,int len){
    for (int i = 0; i<len; i++) {
        printf("%d\n",array[i]);
    }
}

int main(int argc, const char * argv[]) {

    
    int arr[MaxCount];
    srand((unsigned int)time(NULL));
    for(int i = 0;i<MaxCount;i++){
        arr[i] = rand()%MaxCount;
    }
    
    SelectSort(arr, MaxCount);
    
    LogArray(arr, MaxCount);
    
    
    return 0;
}
