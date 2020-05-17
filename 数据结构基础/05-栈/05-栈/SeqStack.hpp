//
//  SeqStack.hpp
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//  顺序存储的栈

#ifndef SeqStack_hpp
#define SeqStack_hpp

#include <stdio.h>
#import "Common.h"

typedef struct SEQSTACK{
    void* data[MAX_SIZE];
    int size;
}SeqStack;


SeqStack *Init_SeqStack();

void Push_Stack(SeqStack *stack,void* data);

void Pop_Stack(SeqStack *stack);

// 返回栈&顶元素
void* Top_Stack(SeqStack *stack);

// 是否为空
int IsEmpty(SeqStack *stack);

int StackLength(SeqStack *stack);

void FreeStack(SeqStack *stack);

void ClearStack(SeqStack *stack);

void Print_SeqStack(SeqStack *stack,PrintStackFunc printFunc);

#endif /* SeqStack_hpp */
