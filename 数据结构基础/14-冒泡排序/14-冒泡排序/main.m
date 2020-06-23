//
//  main.m
//  14-冒泡排序
//
//  Created by luokan on 2020/6/5.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/timeb.h>

#define MaxCount  200

void swap(int *a,int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

long getSysTime(){
    struct timeb tb;
    ftime(&tb);
    return tb.time*1000 + tb.millitm;
}

#pragma mark -
#pragma mark 版本1： 自己写的最原始的
void BubbleSort(int *arr,int length){
    
    for (int i = 0; i<length;i++) {
        for(int j = i+1;j<length;j++){
            if(arr[i]>arr[j]){
                swap(&arr[i], &arr[j]);
            }
        }
    }
}


#pragma mark -
#pragma mark 版本2 MJ
void BubbleSort1(int *array,int len){
    for (int end = len-1; end>0; end--) {
        for (int begin = 1; begin<=end; begin++) {
            if(array[begin] < array[begin-1]){
                int temp = array[begin];
                array[begin] = array[begin-1];
                array[begin-1] = temp;
            }
        }
    }
}

#pragma mark -
#pragma mark 版本3 MJ
void BubbleSort2(int *array,int len){
    for (int end = len-1; end>0; end--) {
        
        int sortFinish = 1;   // 步骤1
        
        for (int begin = 1; begin<=end; begin++) {
            if(array[begin] < array[begin-1]){
                int temp = array[begin];
                array[begin] = array[begin-1];
                array[begin-1] = temp;
                sortFinish = -1;  // 步骤2
            }
        }
        if(sortFinish == 1) break; // 步骤3
    }
}

#pragma mark -
#pragma mark 版本4 MJ
void BubbleSort3(int *array,int len){
    for (int end = len-1; end>0; end--) {
        
        int sortFinishIndex = end;   // 步骤1
        
        for (int begin = 1; begin<=end; begin++) {
            if(array[begin] < array[begin-1]){
                int temp = array[begin];
                array[begin] = array[begin-1];
                array[begin-1] = temp;
                sortFinishIndex = begin;  // 步骤2
            }
        }
        end = sortFinishIndex; // 步骤三
    }
}



void printArray(int *arr,int len){
    
    int i = 0;
    while (i<len) {
        printf(" %d= %d\n",i,arr[i]);
        i++;
    }
}

int main(int argc, const char * argv[]) {
    
    int arr[MaxCount];
    srand((unsigned int)time(NULL));
    for(int i = 0;i<MaxCount;i++){
        arr[i] = rand()%MaxCount;
    }
    long start = getSysTime();
//    BubbleSort(arr, MaxCount);
//    BubbleSort1(arr, MaxCount);
//    BubbleSort2(arr, MaxCount);
    BubbleSort3(arr, MaxCount);
    
    long end = getSysTime();
    long timegap  = end - start;
    
    printf("耗时: %ld\n",timegap);
    
//    printArray(arr, MaxCount);
    

    return 0;
}
