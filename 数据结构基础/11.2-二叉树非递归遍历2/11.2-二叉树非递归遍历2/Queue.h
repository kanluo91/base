//
//  Queue.h
//  11.2-二叉树非递归遍历2
//
//  Created by luokan on 2020/7/7.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef Queue_h
#define Queue_h

#include <stdio.h>
#include "Common.h"

typedef struct QUEUENODE{
    TreeNode *data;
    struct QUEUENODE *pre;
    struct QUEUENODE *next;
}QueueNode;

typedef struct QUEUE{
    int size; // 个数
    struct QUEUENODE *head;
    struct QUEUENODE *tail;
}Queue;

Queue *Init_Queue(void);

void EnQueue(Queue *queue,QueueNode *node);

QueueNode *DeQueue(Queue *queue);

QueueNode *CreateQueueNode(TreeNode *node);

int QueueSize(Queue *q);

#endif /* Queue_h */
