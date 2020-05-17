//
//  DynamicArray.hpp
//  02-动态数组
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef DynamicArray_hpp
#define DynamicArray_hpp

#include <stdio.h>


typedef struct DYNAMICARRAY{
    int *pAddr;     // 数据元素的地址
    int size;       // 当前有多少个元素
    int capacity;   // 容量
} DyanmicArray;


// 1  初始化
DyanmicArray *Init_Array(int capacity);

// 2. 插入
void Push_in_Array(DyanmicArray *array,int value);

// 3. 删除
void Remove_At_Index(DyanmicArray *array,int index);

// 3. 删除
void Remove_By_value(DyanmicArray *array,int value);

// 4. 释放
void FressSpace_Array(DyanmicArray *array);

// 5. 查找角标
int FindIndex_In_Array(DyanmicArray *array,int value);

// 6. 打印
void PrintArray(DyanmicArray *array);

// 7. 清空数组
void ClearArray(DyanmicArray *array);

// 8. 获得容量
int ArrayCapacity(DyanmicArray *array);

// 9. 获得元素个数
int ArraySize(DyanmicArray *array);

// 10. 获去某个位置的元素
int ValueAtIndex(DyanmicArray *array,int index);

#endif /* DynamicArray_hpp */
