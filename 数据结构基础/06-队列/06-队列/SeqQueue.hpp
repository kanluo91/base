//
//  SeqQueue.hpp
//  06-队列
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef SeqQueue_hpp
#define SeqQueue_hpp

#include <stdio.h>
#import "Common.h"

typedef struct SS{
    void* data[MAX_SIZE];
    int size;
}SeqQueue;

typedef void (*PrintQueueFun)(void* data); // 定义函数指针

SeqQueue *Init_Queue();

void Push_SeqQueue(SeqQueue *queue,void *data);

void Pop_SeqQueue(SeqQueue *queue);

void* Front_SeqQeue(SeqQueue *queue);

void* Back_SeqQeue(SeqQueue *queue);

void Clear_SeqQueue(SeqQueue *queue);

void Free_SeqQueue(SeqQueue *queue);

void Print_SeqQueue(SeqQueue *queue,PrintQueueFun func);

#endif /* SeqQueue_hpp */
