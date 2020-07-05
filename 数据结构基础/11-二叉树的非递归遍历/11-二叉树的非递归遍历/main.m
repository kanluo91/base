//
//  main.m
//  11-二叉树的非递归遍历
//
//  Created by luokan on 2020/6/4.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "LinkStack.h"


#define MY_TRUE 1
#define MY_FALSE 0

typedef struct BINARYNODE{
    char data;
    struct BINARYNODE *leftChild;
    struct BINARYNODE *rightChild;
}BinaryNode;

typedef struct TrackBinaryStackNode{
    LinkNode *node; // linkstack 用
    int flag;
    BinaryNode *root;
} TrackStackNode;


/// 创建栈中的结点
/// @param node 结点
/// @param flag 标识
TrackStackNode* MakeTrackStackNode(BinaryNode *node,int flag){
    TrackStackNode *tackNode = malloc(sizeof(TrackStackNode));
    tackNode->root =  node;
    tackNode->flag = flag;
    return tackNode;
}

#pragma mark -
#pragma mark 非递归遍历
void NonRecursion(BinaryNode *root){
    
    if(root == NULL) return;
    
    LinkStack *stack = Init_LinkStack();
    
    Push_LinkStack(stack, (LinkNode *)MakeTrackStackNode(root, MY_FALSE));
    
    while (Size_LinkStack(stack)>0) {
     
        TrackStackNode *tack = (TrackStackNode *)Top_LinkStack(stack);
        Pop_LinkStack(stack);
        if(tack == NULL || tack->root == NULL){
            continue;
        }
        
        // 3.根
        if(tack->flag == MY_TRUE){
            printf("%c",tack->root->data);
        }else{
            // 1 右
            Push_LinkStack(stack, (LinkNode *)MakeTrackStackNode(tack->root->rightChild, MY_FALSE));
            
            // 2 左
            Push_LinkStack(stack, (LinkNode *)MakeTrackStackNode(tack->root->leftChild, MY_FALSE));
            
            tack->flag = MY_TRUE;
            Push_LinkStack(stack, (LinkNode *)tack);
        }
    
    }
    
    printf("\n");
}

#pragma mark -
#pragma mark 创建二叉树
void CreateBinaryTree(){
    
    BinaryNode node1 = {'A',NULL,NULL};
    BinaryNode node2 = {'B',NULL,NULL};
    BinaryNode node3 = {'C',NULL,NULL};
    BinaryNode node4 = {'D',NULL,NULL};
    BinaryNode node5 = {'E',NULL,NULL};
    BinaryNode node6 = {'F',NULL,NULL};
    BinaryNode node7 = {'G',NULL,NULL};
    BinaryNode node8 = {'H',NULL,NULL};
    
    node1.leftChild  = &node2;
    node1.rightChild = &node6;
    
    node2.rightChild = &node3;
    
    node3.leftChild =  &node4;
    node3.rightChild = &node5;
    
    node6.rightChild = &node7;
    node7.leftChild = &node8;
    
    
    NonRecursion(&node1);
    
}

int main(int argc, const char * argv[]) {

    CreateBinaryTree();
    
    
    return 0;
}
