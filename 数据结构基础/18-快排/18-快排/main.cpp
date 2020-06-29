//
//  main.cpp
//  18-快排
//
//  Created by luokan on 2020/6/29.
//  Copyright © 2020 金角大王. All rights reserved.
//
//  快速排序： 平均 O（nlogn）
//  步骤
//  1. 找轴点元素  大于轴点元素的放右边  小于的放左边  等于的随便放哪边
//  2. 对左右序列进行重复上面的操作
//  3. 直到子序列只剩下一个元素  不能切割为止
//
//
//  快速排序的本质：
//  逐渐将每一个元素都转换为轴点元素

#include <iostream>

/// 构造出 [beign,end) 范围内的轴点元素
/// @param array 数组
/// @param begin 起始位置
/// @param end 结束位置
int PivotIndex(int *array,int begin,int end){
    
    // 1 备份begin的位置
    int pivotValue =  array[begin];
    
    // 2 先end--
    end--;
    
    int rightStat = 1;
    while (begin<end) {
        
        if(rightStat == 1){// 右边开始
            if(array[end] > pivotValue){
                end--;
            }else{
                array[begin] = array[end];
                begin++;
                // 换方向走左边开始
                rightStat = -1;
            }
        }else{// 左边开始
            if(array[begin] <  pivotValue){
                begin++;
            }else{
                array[end] = array[begin];
                end--;
                // 换方向 走右边开始
                rightStat = 1;
            }
        }
    }
    
    // 3. begin == end 这就是锚点的位置
    array[begin] = pivotValue;
    
    return begin;
}


/// 对[Begin,end) 范围内的元素进行排序
/// @param array 数组
/// @param begin 起始位置
/// @param end 结束位置
void QuickSort(int *array,int begin,int end){
    if(end - begin < 2) return; // 最少要有2个元素
    int pivotIndex = PivotIndex(array,begin, end);
    QuickSort(array, begin, pivotIndex);
    QuickSort(array, pivotIndex+1, end);
}


void LogArray(int *array,int length){
    for (int i = 0; i<length; i++) {
        printf("%d\n",array[i]);
    }
}

int main(int argc, const char * argv[]) {

    
    int array[11] = {1,8,11,32,2,34,3,99,87,66,23};
    
    QuickSort(array, 0, 11);
    
    LogArray(array, 11);
    
    
    return 0;
}
