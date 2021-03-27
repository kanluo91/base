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

// 添加到最后  然后做上滤
void shiftup(int *array,int len,int shiftIndx){
    
    int shiftvalue = array[shiftIndx];
    while (shiftIndx>0) {
        int parIndex = 2*shiftIndx-1;
        if(parIndex>0) // 有父节点
        {
            if(array[shiftIndx]>array[parIndex]){
                array[shiftIndx] = array[parIndex];
                shiftIndx = parIndex;
            }else{
                array[shiftIndx] = shiftvalue;
                break;
            }
        }else{
            array[shiftIndx] = shiftvalue;
            break;
        }
    }
}

void shiftdown(int *array,int len,int shiftIndex){
    
    int left = 2*shiftIndex+1;
    int right = 2*shiftIndex+2;
    int shiftvalue = array[shiftIndex];
    while(shiftIndex<len-1){
        if(left<=len-1 && right<=len-1){//left&right
            
        }else if(left<=len-1){ // only left
            if()
            
        }else{
            break;
        }
    }
}

void headSort(int *array,int len){
    
    
}
