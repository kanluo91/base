//
//  LinkStack.hpp
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//  栈： 先进 后出

#ifndef LinkStack_h
#define LinkStack_h

#include <stdio.h>
#include <stdlib.h>


typedef struct LINKNODE{
    struct LINKNODE *next;
}LinkNode;


typedef struct LINKSTACK{
    LinkNode head;
    int size;
}LinkStack;


LinkStack * Init_LinkStack(void);

void Push_LinkStack(LinkStack *stack,LinkNode *node);

void Pop_LinkStack(LinkStack *stack);

LinkNode* Top_LinkStack(LinkStack *stack);

int Size_LinkStack(LinkStack *stack);

void Clear_LinkStack(LinkStack *stack);

void Free_LinkStack(LinkStack *stack);

#endif /* LinkStack_h */
