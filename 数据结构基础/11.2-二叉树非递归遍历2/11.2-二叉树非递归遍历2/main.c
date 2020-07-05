//
//  main.c
//  11.2-二叉树非递归遍历2
//
//  Created by luokan on 2020/7/5.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <stdio.h>
#include "Stack.h"
#include "Stack.h"

TreeNode * createTree(){
    TreeNode *nodeA =(TreeNode *)malloc(sizeof(TreeNode));
    nodeA->value = 'A';
    
    TreeNode *nodeB =(TreeNode *)malloc(sizeof(TreeNode));
    nodeB->value = 'B';
    
    TreeNode *nodeC =(TreeNode *)malloc(sizeof(TreeNode));
    nodeC->value = 'C';
    
    TreeNode *nodeD =(TreeNode *)malloc(sizeof(TreeNode));
    nodeD->value = 'D';
    
    TreeNode *nodeE =(TreeNode *)malloc(sizeof(TreeNode));
    nodeE->value = 'E';
    
    TreeNode *nodeF =(TreeNode *)malloc(sizeof(TreeNode));
    nodeF->value = 'F';
    
    TreeNode *nodeG =(TreeNode *)malloc(sizeof(TreeNode));
    nodeG->value = 'G';
    
    TreeNode *nodeH =(TreeNode *)malloc(sizeof(TreeNode));
    nodeH->value = 'H';
    
    nodeA->leftChild  =nodeB;
    nodeA->rightChild = nodeF;
    
    nodeB->rightChild = nodeC;
    nodeB->leftChild = NULL;
    
    nodeC->leftChild =  nodeD;
    nodeC->rightChild = nodeE;
    
    nodeD->leftChild = NULL;
    nodeD->rightChild = NULL;
    
    nodeE->leftChild = NULL;
    nodeE->rightChild = NULL;
    
    
    nodeF->rightChild = nodeG;
    nodeF->leftChild = NULL;
    
    nodeG->leftChild = nodeH;
    nodeG->rightChild = NULL;
    
    nodeH->leftChild = NULL;
    nodeH->rightChild = NULL;
    
    return nodeA;
}

#pragma mark -
#pragma mark 先序遍历
// A B C
void PreRescureOrder(TreeNode *root){
    
    Stack *stack = Init_Stack();
    StackNode *stNode = createStackNode(root,0);
    Push_Stack(stack, stNode);
    
    while (Top_Stack(stack)) {
        StackNode *rootStNode = Pop_Stack(stack);
        
        if(rootStNode->haveEverStacked == 1){ // 输出
            if(rootStNode->data && rootStNode->data->value){
                printf("%c",rootStNode->data->value);
            }
        }else{
            
        // 右
            StackNode *rightStNode = createStackNode(rootStNode->data->rightChild, 0);
            Push_Stack(stack,rightStNode);

        // 左 
            StackNode *leftStNode = createStackNode(rootStNode->data->leftChild, 0);
            Push_Stack(stack, leftStNode);
        
        // 根
        rootStNode->haveEverStacked = 1;
        Push_Stack(stack, rootStNode);
        }
    }
    printf("\n");
}

void MidRescureOrder(TreeNode *root){
    
    
    
}

void LastRescureOrder(TreeNode *root){
    
    
    
}

int main(int argc, const char * argv[]) {

    TreeNode *tree = createTree();
    
    PreRescureOrder(tree);
    
    return 0;
}
