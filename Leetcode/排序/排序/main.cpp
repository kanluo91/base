//
//  main.cpp
//  排序
//
//  Created by luokan on 2020/12/30.
//

#include <iostream>
using namespace std;

void swap(int *a,int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

#pragma mark -
#pragma mark 1.冒泡排序
// 小->大(每次找最大)
// 外循环的i 代表要重复多少次找最大值
// 在内循环中i代表已经有i个数已经找到， len-i-2 代表内循环执行的次数
void BubbleSort(int *array,int len){
    
    // 1. 自己写的
//    for (int i = 0; i<len; i++) {
//        for (int j=0; j<=len-i-2; j++) {
//            if(array[j] > array[j+1]){
//                swap(array[j], array[j+1]);
//            }
//        }
//    }
    
    // 2. 第一个版本
    // end 到最后一个元素
//    for (int end = len-1; end > 0; end--) {
//        for (int begin = 1; begin<=end; begin++) {
//            if(array[begin] < array[begin-1]){
//                swap(array[begin], array[begin-1]);
//            }
//        }
//    }
    
    // 3. 如果给的序列是完全有序的
//    for (int end = len-1; end>0; end--) {
//        bool isSort = true;
//        // 第一趟扫描完之后 如果没有一次交换  那么原数组本来就是有序的
//        for (int beg = 1; beg <= end; beg++) {
//            if(array[beg-1]>array[beg]){
//                isSort = false;
//                swap(array[beg-1], array[beg]);
//            }
//        }
//
//        if(isSort){
//            break;
//        }
//    }
    
//    4. 如果是局部有序
    for (int end = len-1; end>0; end--) {
        bool SortIndex = end;
        // 拿到最后一次交换的index，index后面的必定是有序的。
        for (int beg = 1; beg <= end; beg++) {
            if(array[beg-1]>array[beg]){
                swap(array[beg-1], array[beg]);
                SortIndex = beg;
            }
        }
        end = SortIndex;
    }
}

#pragma mark -
#pragma mark 2.选择排序
void SelectSort(int *arr,int len){
    for (int end = len-1;end>0; end--) {
        int maxIdx = 0;
        for (int begin = 0; begin<=end; begin++) {
            if(arr[maxIdx] < arr[begin]){
                maxIdx = begin;
            }
        }
        swap(arr[maxIdx], arr[end]);
    }
}

void displayArray(int *array,int len){
    for (int i = 0; i<len; i++) {
        cout << array[i] << "_";
    }
    cout<<endl;
}

int main(int argc, const char * argv[]) {
    int array[11] = {1,3,12,9,8,-1,23,99,76,-3,0};
//    BubbleSort(array, 11);
    SelectSort(array, 11);
    displayArray(array, 11);
    return 0;
}
