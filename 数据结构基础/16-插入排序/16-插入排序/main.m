//
//  main.m
//  16-插入排序
//
//  Created by luokan on 2020/6/23.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MaxCount 20


void LogArray(int *array,int len){
    for (int i = 0; i<len; i++) {
        printf("%d\n",array[i]);
    }
}

// 算法复杂度 O（n^2）
// 交换的方法
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


// 挪动的方法
void InsertionSort1(int *array,int len){

    for (int begin = 1; begin<len; begin++) {
        
        int cmpIndex = begin;
        int cmpValue = array[cmpIndex];
        while (cmpIndex > 0 && array[cmpIndex-1] > cmpValue) {
            array[cmpIndex] = array[cmpIndex-1];
            cmpIndex--;
        }
        array[cmpIndex] = cmpValue;
    }
}

///  有序数组的二分搜索
/// @param array 数组
/// @param start 数组的开始
/// @param end 数组的结束
/// @param value 要查找的值
int BinarySearch(int *array,int start,int end,int value){
    if(array == nil || end<0 || start<0 || end < start) return -1;
    int middle = (end + start)/2;
    
    if(value < array[middle]){
        return BinarySearch(array, start, middle, value);
    }else if(value > array[middle]){
        return BinarySearch(array, middle+1, end, value);
    }else{
        return middle;
    }
}

// 找第一个大于V元素的位置
// 小于 mid 去左边找    大于等于 mid 去右边找
// 当beign == end 的时候 就是要找的插入位置
int findBestInsertIndex(int *array,int start,int end,int value){
    if(array == nil ||  end == 0) return -1;
    int begin = start;
    while (begin < end) {
        int mid = (begin+end) >> 1;
        if(value < array[mid]){
            end = mid;
        }else if(value >= array[mid]){
            begin = mid+1;
        }
    }
    return begin;
}

void TestBinarySearch(){
    int array[10] = {1,2,3,4,5,6,7,8,9,10};
    int index =  BinarySearch(array, 0, 10, 10);
    printf("数字: %d 的角标 = %d\n",10,index);
}

void TestFindBestInsert(){
    int array[10] = {1,2,3,4,5,6,7,8,9,10};
    int index =  findBestInsertIndex(array,0,10, 3);
    
    printf("最合适的插入位置: %d\n",index);
}

// 二分-插入排序
void InsertionSort2(int *array,int len){
    
    for (int begin = 1; begin < len; begin++) {
     
        int insertValue = array[begin];
        int insertIndex = findBestInsertIndex(array, 0, begin, insertValue);
        // 把>= insertIndex  的元素后移动
        for(int move = begin;move >= insertIndex;move--){
            array[move] = array[move-1];
        }
        array[insertIndex] = insertValue;
    }
    
}


int main(int argc, const char * argv[]) {
 
    int arr[MaxCount];
    srand((unsigned int)time(NULL));
    for(int i = 0;i<MaxCount;i++){
        arr[i] = rand()%(MaxCount*10);
    }

//    InsertionSort(arr, MaxCount);
//    InsertionSort1(arr, MaxCount);
    InsertionSort2(arr, MaxCount);

    LogArray(arr, MaxCount);
    
    
//    TestBinarySearch();
    
//    TestFindBestInsert();
    
    
    
    return 0;
}
