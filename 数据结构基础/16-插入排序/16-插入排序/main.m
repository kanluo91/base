//
//  main.m
//  16-插入排序
//
//  Created by luokan on 2020/6/23.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MaxCount 100


void LogArray(int *array,int len){
    for (int i = 0; i<len; i++) {
        printf("%d\n",array[i]);
    }
}

// 算法复杂度 O（n^2）
void InsertionSort(int *array,int len){
    for (int begin = 1; begin<len; begin++) {
        int cmpIndex = begin;
        while (cmpIndex > 0 &&  array[cmpIndex] < array[cmpIndex-1]) {
            int tmp = array[cmpIndex];
            array[cmpIndex] = array[cmpIndex-1];
            array[cmpIndex-1] = tmp;
            cmpIndex--;
        }
    }
}


int main(int argc, const char * argv[]) {
 
    int arr[MaxCount];
    srand((unsigned int)time(NULL));
    for(int i = 0;i<MaxCount;i++){
        arr[i] = rand()%MaxCount;
    }
    
    InsertionSort(arr, MaxCount);
    
    LogArray(arr, MaxCount);
    
    return 0;
}
