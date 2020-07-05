//
//  Stack.c
//  11.2-二叉树非递归遍历2
//
//  Created by luokan on 2020/7/5.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "Stack.h"

Stack* Init_Stack(void){
    Stack *st = (Stack *)malloc(sizeof(Stack));
    st->size = 0;
    st->root = NULL;
    return st;
}  // 初始化栈

void Push_Stack(Stack *stack,StackNode* node){
    if(stack == NULL || node == NULL || node->data == NULL) return;
    
    if(stack->root == NULL){
        stack->root = node;
        stack->size++;
    }else{
        node->next = stack->root;
        stack->root = node;
        stack->size++;
    }
} // 进栈
 
StackNode* Pop_Stack(Stack *stack){
    if(stack == NULL ||  stack->root == NULL) return NULL;
    StackNode *top = stack->root;
    stack->root = stack->root->next;
    stack->size--;
    return top;
} // 出栈

StackNode * Top_Stack(Stack *stack){
    if(stack == NULL ||  stack->root == NULL) return NULL;
    return stack->root;
}// 栈顶


StackNode *createStackNode(TreeNode *node,int haveInStack){
    if(node == NULL) return NULL;
//    printf("创建 %c\n",node->value);
    StackNode *stNode = (StackNode *)malloc(sizeof(StackNode));
    stNode->data = node;
    stNode->next = NULL;
    stNode->haveEverStacked = haveInStack;
    return stNode;
}
