//
//  Queue.c
//  11.2-二叉树非递归遍历2
//
//  Created by luokan on 2020/7/7.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "Queue.h"

Queue *Init_Queue(void){
    Queue *q = (Queue *)malloc(sizeof(struct QUEUE));
    q->size = 0;
    q->head = NULL;
    q->tail = NULL;
    return q;
}

// 头进  尾巴出
void EnQueue(Queue *queue,QueueNode *node){
    
    if(queue == NULL || node == NULL)  return;
    
//    printf("进队列：%c\n",node->data->value);
    if(queue->head == NULL){
        
        queue->head = node;
        queue->tail = node;

        node->next = NULL;
        node->pre = NULL;
        
    }else{
        node->pre = NULL;
        node->next = queue->head->next;
        queue->head->pre = node;
        
        queue->head = node;
    }

    queue->size++;
}


// 头进  尾巴出
QueueNode *DeQueue(Queue *queue){
    
    if(queue->size == 0) return NULL;
    
    QueueNode *qNode = queue->tail;
    
    if(qNode == NULL || qNode->pre == NULL){
        queue->head = NULL;
        queue->tail = NULL;
        queue->size = 0;
    }else{
    
        if(qNode->next == NULL){
            qNode->pre->next = NULL;
        }else{
            
            qNode->pre->next = qNode->next;
            qNode->next->pre = qNode->pre;
            
        }
        queue->tail = qNode->pre;
        queue->size--;
        
    }
    return qNode;
}

int QueueSize(Queue *q){
    if(q == NULL) return 0;
    return q->size;
}

QueueNode *CreateQueueNode(TreeNode *node){
    
    if(node ==  NULL) return NULL;
    
    QueueNode *qNode =  (QueueNode *)malloc(sizeof(QueueNode));
    qNode->data = node;
    qNode->pre = NULL;
    qNode->next = NULL;
    return qNode;
}
