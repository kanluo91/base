//
//  main.cpp
//  排序
//
//  Created by luokan on 2020/12/30.
//

#include <iostream>
using namespace std;

#pragma mark -
#pragma mark 辅助函数
void swap(int *a,int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

bool Cmp(int a,int b){
    return a>b?true:false;
}

void displayArray(int *array,int len){
    for (int i = 0; i<len; i++) {
        cout << array[i] << "_";
    }
    cout<<endl;
}

#pragma mark -
#pragma mark 1.冒泡排序
// 小->大(每次找最大)
// 外循环的i 代表要重复多少次找最大值
// 在内循环中i代表已经有i个数已经找到， len-i-2 代表内循环执行的次数
void BubbleSort(int *array,int len){

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

#pragma mark -
#pragma mark 3. 插入排序
void InsertSort(int *arr,int len){
    
    // 2. 优化-找到插入位置，挪动其他元素
    for (int begin=1; begin<len; begin++) {

        int fstart = 0;
        int fend = begin;
        int fvalue = arr[begin];
        // 找插入位置
        while (fstart<fend) {
            int fmid = (fstart+fend)/2;
            if(fvalue >= arr[fmid]){
                fstart = fmid+1;
            }else{
                fend = fmid;
            }
        }
        int fmove = begin;
        // 挪元素
        while (fmove>=fstart) {
            arr[fmove] = arr[fmove-1];
            fmove--;
        }
        
        // 赋值
        arr[fstart] = fvalue;
    }
    
}

#pragma mark -
#pragma mark 4. 二分搜索
// 这个算法是有弊端的：如果数组中有多个重复的元素，会返回哪个index呢？
int IndexOfValue(int *arr,int len,int value){
    int begin = 0;
    int end = len;
    while (begin<value) {
        int mid = (begin+end)/2;
        if(value > arr[mid]){
            begin = mid+1;
        }else if(value<arr[mid]){
            end = mid;
        }else{
            return mid;
        }
    }
    return -1;
}

/// 在数组中找到合适的插入位置
/// @param array 数组
/// @param len 数组长度
/// @param value 插入的值
int findInsertIndex(int *array,int len,int value){
    int begin  = 0;
    int end = len;
    while (begin < end) {
        int mid = (begin+end)/2;
        if(value >= array[mid]){
            begin = mid+1;
        }else if(value < array[mid]){
            end = mid;
        }
    }
    return begin;
}

#pragma mark -
#pragma mark 5.归并排序
void MergeArray(int *arr,int begin,int mid,int end,int *copyArray){
    // 1. 先对[beigin,mid) 的元素进行备份
    int leftStart = 0;
    int leftEnd = mid-begin;
    while (leftStart<leftEnd) {
        copyArray[leftStart] = arr[begin+leftStart];
        leftStart++;
    }
    leftStart = 0;
    int rightStart = mid;
    int rightEnd = end;
    int arrIndex = begin;
    // 2. copyArray 和 arr[mid,end) 进行合并
    while (leftStart<leftEnd) {
        int leftValue = copyArray[leftStart];
        int rightValue = arr[rightStart];
        // 如果右边先结束,一直读左边的数
        if(rightStart>=rightEnd){
            arr[arrIndex++] = leftValue;
            leftStart++;
        }else{
            // 左边也没结束  右边也没结束
            if(leftValue<=rightValue){
                arr[arrIndex++] = leftValue;
                leftStart++;
            }else{
                arr[arrIndex++] = rightValue;
                rightStart++;
            }
        }
    }
}

/*
 * 对[begin,end)  进行递归归并 [begin,mid)  [mid,end)
 *
 */
void MergeSort(int *arr,int begin,int end,int* copyArray){
    if(end-begin <= 1) return;
    int mid = (begin+end)/2;
    MergeSort(arr, begin, mid,copyArray);
    MergeSort(arr, mid, end,copyArray);
    MergeArray(arr, begin, mid, end,copyArray);
}

#pragma mark -
#pragma mark 6. 快速排序
int PiovtIndex(int *arr,int begin,int end){
    int mid = (begin+end)/2;
    int piovtValue = arr[mid];
    
    swap(arr[begin], arr[mid]);
    // 原理还是
    
    end--;
    bool rightTravel = true;
    while (begin<end) {
        if(rightTravel){

            if(arr[end] > piovtValue){
                end--;
                rightTravel = true;
            }else{
                arr[begin++] = arr[end];
                rightTravel = false; // 方向反转
            }
            
        }else{
            if(arr[begin] < piovtValue){
                begin++;
                rightTravel = false;
            }else{
                arr[end--] = arr[begin];
                rightTravel = true; //方向反转
            }
        }
    }
    arr[begin] = piovtValue;
    return begin;
}


/*
 *  注意： 排序分了三个部分
 *  [begin,piovIndex)
 *  piovIndex
 *  [piovIndex+1,end)
 */
void QuickSort(int *array,int begin,int end){
    if(end-begin <= 1) return;
    int piovtidx = PiovtIndex(array, begin, end);
    QuickSort(array, begin, piovtidx);
    QuickSort(array, piovtidx+1, end);
}

int main(int argc, const char * argv[]) {
    int array[11] = {1,3,12,9,8,-1,23,99,76,-3,0};
    int copyArray[5];
//   BubbleSort(array, 11);
//   SelectSort(array, 11);
//   InsertSort(array, 11);
//   MergeSort(array, 0, 11, copyArray);
    
//   TestFindInsertIndex();
    
    QuickSort(array, 0, 11);
    
    displayArray(array, 11);
    return 0;
}
