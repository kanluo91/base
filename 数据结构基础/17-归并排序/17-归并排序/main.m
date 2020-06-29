//
//  main.m
//  17-归并排序
//
//  Created by luokan on 2020/6/24.
//  Copyright © 2020 金角大王. All rights reserved.
//
//  时间复杂度O（nlogn）

#import <Foundation/Foundation.h>

void LogArray(char *str,int *array,int start,int end){
    printf("%s  %d ~ %d\n",str,start,end);
    for (int i = start; i<end; i++) {
        printf(" %d\n",array[i]);
    }
}


/// 将 [begin,middle) 和 [middle,end) 之前的数组合并
/// @param begin 起始位置
/// @param middle 中间位置
/// @param end 结束位置
void Merge(int *array,int begin,int middle,int end){
    
    LogArray("合并之前", array, begin, end);
    
    // 新建一个数组  备份原来的数组
    int leftLen = middle - begin;
    int leftArray[leftLen];

    for (int i = 0; i<leftLen; i++) {
        leftArray[i] = array[begin+i];
    }
    
    int aStart = begin;
//    int aEnd = middle;
    int bStart = middle;
    int bEnd = end;
    
    int cStart = 0;
    int cEnd = leftLen;
    
    while (cStart<cEnd) {
        int leftV = leftArray[cStart];
        
        if(bStart<bEnd){
            int rightV = array[bStart];
             if(leftV <= rightV){ // 选left 值
                 array[aStart] = leftV;
                 aStart++;
                 cStart++;
             }else{ // 选了right的值
                 array[aStart] = rightV;
                 aStart++;
                 bStart++;
             }
        }else{ // 直接选left的值
                array[aStart] = leftV;
                aStart++;
                cStart++;
        }
    }
    LogArray("合并之后", array, begin, end);
}

void MergerSort(int *array,int begin,int end){
    if(end - begin < 2) return;// 最小要2个数
    int middle  = (begin + end) >> 1;
    MergerSort(array, begin, middle); // 左边归并
    MergerSort(array, middle,end); // 右边归并
    Merge(array,begin, middle, end); // 合并
}


//        0 ~ 7
//  0 ~ 3        3~7
//0~1  1~3    3~5  5~7


void TestMergerSort(int *array,)



int main(int argc, const char * argv[]) {

    int array[7] = {49,38,65,97,76,13,27};
    
    MergerSort(array, 0, 7);

    
    return 0;
}
