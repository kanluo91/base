//
//  SeqStack.cpp
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "SeqStack.hpp"
#include <stdlib.h>
#include <stdio.h>

SeqStack *Init_SeqStack(){
    SeqStack *stack = (SeqStack *)malloc(sizeof(SeqStack));
    stack->size = 0;
    for (int i = 0; i<MAX_SIZE; i++) {
        stack->data[i] = NULL;
    }
    return stack;
}

void Push_Stack(SeqStack *stack,void* data){
    if(stack == NULL) return;
    
    if(stack->size == MAX_SIZE){
        return;
    }
    if(data == NULL) return;
    
    int top = stack->size;
    stack->data[top] = data;
    stack->size++;
}

void Pop_Stack(SeqStack *stack){
    if(stack == NULL) return;
    
    if(stack->size == 0){
        return;
    }
    
    stack->size--;
    stack->data[stack->size] = NULL;
}

// 返回栈顶元素
void* Top_Stack(SeqStack *stack){
    if(stack == NULL) return NULL;
     
     if(stack->size == 0){
         return NULL;
     }
    
    int top = stack->size - 1;
    return stack->data[top];
}

// 是否为空
int IsEmpty(SeqStack *stack){
    if(stack == NULL) return STACK_TRUE;
    if(stack->size == 0) return STACK_TRUE;
    return STACK_FALSE;
}

int StackLength(SeqStack *stack){
    if(stack == NULL)return 0;
    return stack->size;
}

void FreeStack(SeqStack *stack){
    if(stack != NULL){
        free(stack);
    }
}

void ClearStack(SeqStack *stack){
    if(stack == NULL) return;
    stack->size = 0;
}

void Print_SeqStack(SeqStack *stack,PrintStackFunc printFunc){
    
    if(stack == NULL)return;
    if(stack->size == 0)return;
    for (int i = 0; i<stack->size; i++) {
        if(printFunc){
            printFunc(stack->data[i]);
        }
    }
}
