//
//  main.cpp
//  快排
//
//  Created by luokan on 2021/3/27.
//

#include <iostream>
using namespace std;

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

int main(int argc, const char * argv[]) {
    int array[10] = {0,-3,99,1,8,32,-8,21,9,31};
    quicksort(array, 0, 10);
    displayArray(array, 10);
    return 0;
}
