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

typedef struct BINARYNODE{
    char data;
    struct BINARYNODE *leftChild;
    struct BINARYNODE *rightChild;
}BinaryNode;

typedef struct TrackBinaryStackNode{
    int flag;
    BinaryNode *node;
} TrackStackNode;



/// 创建栈中的结点
/// @param node 结点
/// @param flag 标识
TrackStackNode* MakeTrackStackNode(BinaryNode *node,int flag){
    TrackStackNode *tackNode = malloc(sizeof(TrackStackNode));
    tackNode->node =  node;
    tackNode->flag = flag;
    return tackNode;
}

void NonRecursion(BinaryNode *node){
    
    
}

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
    
}

int main(int argc, const char * argv[]) {

    
    
    return 0;
}
