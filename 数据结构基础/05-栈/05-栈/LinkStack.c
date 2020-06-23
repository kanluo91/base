//
//  LinkStack.cpp
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "LinkStack.h"


LinkStack * Init_LinkStack(){
    
    LinkStack *stack = (LinkStack *)malloc(sizeof(LinkStack));
    
    stack->head.next = NULL;
    stack->size = 0;
    
    return stack;
}

void Push_LinkStack(LinkStack *stack,LinkNode *node){
    
    if(stack == NULL || node == NULL) return;
    
    node->next = stack->head.next;
    stack->head.next = node;
    
    stack->size++;
}

void Pop_LinkStack(LinkStack *stack){
    
    if(stack == NULL) return;
    if(stack->size == 0) return;
    
    LinkNode *pNext = stack->head.next;
    stack->head.next = pNext->next;
    stack->size--;
    
}

LinkNode* Top_LinkStack(LinkStack *stack){
    
    if(stack == NULL) return NULL;
    if(stack->size == 0) return NULL;
    return stack->head.next;
}

int Size_LinkStack(LinkStack *stack){
    
    if(stack == NULL) return -1;
    return stack->size;
}

void Clear_LinkStack(LinkStack *stack){
    if(stack == NULL) return;
    if(stack->size == 0) return;
    stack->head.next = NULL;
    stack->size = 0;
}

void Free_LinkStack(LinkStack *stack){
    
    if(stack == NULL) return;
    free(stack);
    
}
