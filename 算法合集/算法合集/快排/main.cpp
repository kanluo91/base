//
//  main.cpp
//  快排
//
//  Created by luokan on 2021/3/27.
//

#include <iostream>
using namespace std;

#pragma mark -
#pragma mark 快排
// [begin,end)
int pivot(int *array,int begin,int end){
    if(end - begin < 1) return begin;
    end--;
    int pivotvalue = array[begin];
    while (begin<end) {
        while(begin < end && array[end] > pivotvalue){
            end--;
        }
        array[begin] = array[end];
        while(begin < end && array[begin] < pivotvalue){
            begin++;
        }
        array[end] = array[begin];
    }
    array[begin] = pivotvalue;
    return begin;
}

void quicksort(int *array,int begin,int end){
    if(end - begin > 0){
        int p = pivot(array, begin, end);
        quicksort(array, begin, p);
        quicksort(array, p+1, end);
    }
}

void displayArray(int *array,int length){
    for (int i = 0; i<length; i++) {
        printf("%d ",array[i]);
    }
    printf("\n");
}

#pragma mark -
#pragma mark 快排优化
// [begin,end)
int pivot2(int *array,int begin,int end){
    if(end-begin<1) return begin;
    // 这里要先生成随机数  然后执行后面的end-- 要不然 end - begin = 0 会报错
    int rdmIdx = begin+arc4random()%(end-begin);
    swap(array[begin],array[rdmIdx]);
    
    end--;
    int pivot = array[begin];
    
    while (begin<end) {
        // 这个array[end] > pivot 不能写 >=  要考虑整个数组可能是相同数字的情况  最坏的情况
        while(begin < end && array[end] > pivot){
            end--;
        }
        array[begin] = array[end];
        while(begin < end && array[begin] < pivot){
            begin++;
        }
        array[end] = array[begin];
    }
    array[begin] = pivot;
    
    return begin;
}

void quicksort2(int *array,int begin,int end){
    if(end - begin < 1) return;
    int pidx = pivot2(array, begin, end);
    quicksort2(array, begin, pidx);
    quicksort2(array, pidx+1, end);
}

int main(int argc, const char * argv[]) {
    int array[10] = {0,-3,99,1,8,32,-8,21,9,31};
//    quicksort(array, 0, 10);
    quicksort2(array, 0, 10);
    displayArray(array, 10);
    return 0;
}
