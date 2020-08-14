//
//  main.cpp
//  1-冒泡排序
//
//  Created by luokan on 2020/8/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>
using namespace std;


// 时间复杂度O（n^2）
void BubbleSort(int *array,int length){
    for (int end = length-1; end > 0; end--) {
        
        int sortFinishIndex = end;
        
        for (int begin = 1; begin<=end; begin++) {
            if(array[begin] < array[begin-1]){
                int temp = array[begin];
                array[begin] = array[begin-1];
                array[begin-1] = temp;
                sortFinishIndex = begin;  // 拿到最后一次需要做swap的index。因为后面的是有序的 不再需要参加排序
            }
        }
        
        end = sortFinishIndex;
    }
}



void SelectSort(int *array,int length){
    
    
    
    
    
}



/// 插入排序 - 挪动  时间复杂度O（n^2）
/// @param array 数组
/// @param length 数组长度
void InsertSort(int *array,int length){
    
    for (int begin = 1; begin < length; begin++) {
        
        int cmpIndex = begin;
        
        while (cmpIndex > 0 && array[cmpIndex-1] > array[cmpIndex]) {
            int temp = array[cmpIndex-1];
            array[cmpIndex-1] = array[cmpIndex];
            array[cmpIndex] = temp;
            cmpIndex--;
        }
        
    }
}


/// 找到数组中最佳的插入位置  [start,end)
/// @param array 数组
/// @param start 起始位置
/// @param end 结束位置
/// @param value 插入的值  -1 代表没有插入位置
int BinarySearchIndex(int *array,int start,int end,int value){
    if(array  == NULL || end == 0) return -1;
    while (start < end) {
        int mid = (start + end) / 2;
        if(value < array[mid]){
            end = mid;
        }else if(value >= array[mid]){
            start = mid+1;
        }
    }
    return start;
}

void DisplayArray(int *array,int length){
    
    for (int i = 0; i<length; i++) {
        printf("%d_",array[i]);
    }
    
    printf("\n");
}


void InsertionSort2(int *array,int length){
    
    for (int begin = 1; begin < length; begin++) {
        
        int cmpIndex =  BinarySearchIndex(array, 0, begin, array[begin]);
        
        printf("begin = %d  cmp = %d\n",begin,cmpIndex);
        
        int cmpValue = array[begin];

        for (int mov = begin; mov > cmpIndex; mov--) {
            array[mov] = array[mov-1];
        }
        
        array[cmpIndex] = cmpValue;
    }
}


//-9_-1_1_2_23_32_41_56_81_99_
int main(int argc, const char * argv[]) {
    // insert code here...
    
    int array[10] = {-1,2,32,1,56,-9,23,41,99,81};
    
    DisplayArray(array, 10);
    
//    BubbleSort(array, 10);
//    DisplayArray(array, 10);
    
//    SelectSort(array, 10);
    
//    InsertSort(array, 10);
    
    InsertionSort2(array, 10);
    
    DisplayArray(array, 10);

    
    return 0;
}
