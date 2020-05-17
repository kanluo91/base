//
//  SeqQueue.cpp
//  06-队列
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "SeqQueue.hpp"
#include <stdio.h>
#include <stdlib.h>

SeqQueue *Init_Queue(){
    SeqQueue *q = (SeqQueue *)malloc(sizeof(SeqQueue));
    for (int i = 0; i<MAX_SIZE; i++) {
        q->data[i] = NULL;
    }
    q->size = 0;
    return q;
}

void Push_SeqQueue(SeqQueue *queue,void *data){
    if(queue == NULL)return;
    if(data ==NULL) return;
    
    if(queue->size == MAX_SIZE)return;
    queue->data[queue->size] = data;
    queue->size++;
}

// 先进先出
void Pop_SeqQueue(SeqQueue *queue){
    if(queue == NULL)return;
    if(queue->size == 0)return;
    
    for(int i =1;i<queue->size;i++){
        queue->data[i-1] = queue->data[i];
    }
    
    queue->data[queue->size-1] = NULL;
    queue->size--;
}

void* Front_SeqQeue(SeqQueue *queue){
    if(queue == NULL) return NULL;
    if(queue->size == 0) return NULL;
    return queue->data[0];
}

void* Back_SeqQeue(SeqQueue *queue){
    if(queue == NULL) return NULL;
    if(queue->size == 0) return NULL;
    return queue->data[queue->size-1];
}

void Clear_SeqQueue(SeqQueue *queue){
    
    if(queue == NULL) return;
    if(queue->size == 0) return;
    
    for(int i =0;i<queue->size;i++){
        queue->data[i] = NULL;
    }
    queue->size = 0;
}

void Free_SeqQueue(SeqQueue *queue){
    
    if(queue == NULL) return;
    if(queue->size == 0) return;
    free(queue);
}

void Print_SeqQueue(SeqQueue *queue,PrintQueueFun func){
    if(queue == NULL) return;
    if(queue->size == 0)return;
    for (int i=0; i<queue->size; i++) {
        func(queue->data[i]);
    }
}
