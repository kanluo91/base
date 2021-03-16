//
//  main.cpp
//  24-合并有序数组
//
//  Created by luokan on 2021/3/16.
//

#include <iostream>
using namespace std;

int* mergeArray(int *arr1,int *arr2,int len1,int len2);

int main(int argc, const char * argv[]) {
    int arr1[] = {9,7,6,5,4,3,2,1};
    int arr2[] = {2,4,5,6,8,9,10};
    int *array = mergeArray(arr1, arr2, 8, 7);
    for (int i = 0; i<15; i++) {
        cout << array[i] << "_";
    }
    return 0;
}

//A是个降序数组，如 9 7 6 5 4 3 1；
//
//B是个升序数组，如 2 4 5 6 8 9 10；
//
//请实现一个函数，将A和B合并成一个升序数组。

int* mergeArray(int *arr1,int *arr2,int len1,int len2){
    int *array = (int *)malloc(sizeof(int)*(len1+len2));
    memset(array, 0, sizeof(int)*(len1+len2));
    int i = len1-1;
    int j = 0;
    int idx = 0;
    while(i >= 0||j<len2){
        if(i>=0 && j<len2){
            if(arr1[i] > arr2[j]){
                array[idx++] = arr2[j++];
            }else{
                array[idx++] = arr1[i--];
            }
        }else if(i>=0){
            array[idx++] = arr1[i--];
        }else if(j<len2){
            array[idx++] = arr2[j++];
        }
    }
    return array;
}
