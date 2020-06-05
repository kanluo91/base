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


void BubbleSort(int *arr,int length){
    long start = getSysTime();
    for (int i = 0; i<length;i++) {
        for(int j = i+1;j<length;j++){
            if(arr[i]>arr[j]){
                swap(&arr[i], &arr[j]);
            }
        }
    }
    long end = getSysTime();
    
    long timegap  = end - start;
    
    printf("耗时: %ld\n",timegap);
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
    
    
    BubbleSort(arr, MaxCount);
    printArray(arr, MaxCount);
    

    return 0;
}
