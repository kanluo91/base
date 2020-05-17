//
//  DynamicArray.cpp
//  02-动态数组
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "DynamicArray.hpp"
#include <stdlib.h>
#include <string>


// 1  初始化
DyanmicArray *Init_Array(int capacity){
    
    DyanmicArray *array = (DyanmicArray *)malloc(sizeof(DyanmicArray));
    array->capacity = capacity;
    array->size = 0;
    array->pAddr = (int *)malloc(sizeof(int)*capacity);
    return array;
}

// 2. 插入
void Push_in_Array(DyanmicArray *array,int value){
    if(array == NULL) return;
    
    // 1 判断空间是否足够
    if(array->capacity == array->size){
        
        // 2 申请新的2倍存储空间
        int* newArrea = (int *)malloc(sizeof(int)*array->capacity*2);
        
        // 3. 拷贝数据到新空间
        memcpy(newArrea,array->pAddr,array->capacity);
        
        // 4. 释放旧的空间
        free(array->pAddr);

        //5. 重新赋值
        array->pAddr = newArrea;
         
        //6 重新设置容量
        array->capacity = array->capacity *2;
    }
    
    array->size++;
    int idx = array->size-1;
    array->pAddr[idx] = value;
}

// 3. 删除
void Remove_At_Index(DyanmicArray *array,int index){
    
}

// 3. 删除
void Remove_By_value(DyanmicArray *array,int value){
    
    
    
}
 
// 4. 释放
void FressSpace_Array(DyanmicArray *array){
    
    if(array && array->pAddr){
        free(array->pAddr);
    }
    if(array){
        free(array);
    }
}

// 5. 查找角标
int FindIndex_In_Array(DyanmicArray *array,int value){
    
    return -1;
}

// 6. 打印
void PrintArray(DyanmicArray *array){
    for (int i = 0; i< array->size; i++) {
        printf("array[%d] = %d\n",i,array->pAddr[i]);
    }
}

// 7. 清空数组
void ClearArray(DyanmicArray *array){
    if(array == NULL) return;
    array->size = 0;
}

// 8. 获得容量
int ArrayCapacity(DyanmicArray *array){
    if(array== NULL) return 0;
    return array->capacity;
}

// 9. 获得元素个数
int ArraySize(DyanmicArray *array){
    
     if(array== NULL) return 0;
       return array->size;
}
  
// 10. 获去某个位置的元素
int ValueAtIndex(DyanmicArray *array,int index){
    if(array == NULL) return -1;
    
    return array->pAddr[index];
}
