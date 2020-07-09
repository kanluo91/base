//
//  Stack.h
//  11.2-二叉树非递归遍历2
//
//  Created by luokan on 2020/7/5.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef Stack_h
#define Stack_h

#include <stdio.h>
#include "Common.h"

typedef struct STACKNODE{
    int haveEverStacked; // 是否加入过队列 0 没加入过 1 加入过
    struct STACKNODE *next;
    TreeNode *data;
}StackNode;

typedef struct STACK{
    int size;
    StackNode *root;
}Stack;

Stack* Init_Stack(void);  // 初始化栈

void Push_Stack(Stack *stack,StackNode* ndoe); // 进栈
 
StackNode* Pop_Stack(Stack *stack); // 出栈

StackNode * Top_Stack(Stack *stack);// 栈顶

StackNode *createStackNode(TreeNode *node,int haveInStack);

#endif /* Stack_h */
