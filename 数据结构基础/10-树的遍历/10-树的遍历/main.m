//
//  main.m
//  10-树的遍历
//
//  Created by luokan on 2020/6/4.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/**
 先序： ABCDEFGH
 中序：BDCEAFHG
 后续：DECBHGFA
 */

typedef struct BIANRYNODE{
    char data;
    struct BIANRYNODE *leftChild;
    struct BIANRYNODE *rightChild;
}BinaryNode;

#pragma mark -
#pragma mark 递归-先序遍历
void FirstRecursion(BinaryNode *node){

    if(node == NULL) return;

    // 1. 先访问根
    printf("%c",node->data);

    // 2. 左结点
    FirstRecursion(node->leftChild);

    // 3. 右结点
    FirstRecursion(node->rightChild);
}

#pragma mark -
#pragma mark 递归-中序遍历
void MiddleRecusion(BinaryNode *node){
    
    if(node == NULL) return;
    
    // 1. 左结点
    MiddleRecusion(node->leftChild);

    // 2. 先访问根
    printf("%c",node->data);

    // 3. 右结点
    MiddleRecusion(node->rightChild);
    
}

#pragma mark -
#pragma mark 计算叶子结点个数
/// 求叶子结点的个数
/// @param root 根结点
/// @param number 返回的数量
void CaluateLeafNum(BinaryNode *root,int* number){
    
    if(root == NULL) return;
    if(root->leftChild == NULL && root->rightChild == NULL){
        (*number)++;
    }
    
    // 计算左叶子
    CaluateLeafNum(root->leftChild, number);
    
    // 计算右叶子
    CaluateLeafNum(root->rightChild, number);
    
}


#pragma mark -
#pragma mark 计算高度
int CalculateLeafDeep(BinaryNode *rootNode){
    if(rootNode == NULL){
        return 0;
    }
    
    int leftDeep = CalculateLeafDeep(rootNode->leftChild);
    int rightDeep = CalculateLeafDeep(rootNode->rightChild);
    int deep = leftDeep>rightDeep?(leftDeep+1):(rightDeep+1);
    return deep;
}

#pragma mark -
#pragma mark 递归-中序遍历
void LastRecusion(BinaryNode *node){
    
    if(node == NULL) return;
    
    // 1. 左结点
    LastRecusion(node->leftChild);
    
    // 2. 右结点
    LastRecusion(node->rightChild);

    // 3. 先访问根
    printf("%c",node->data);
    
}

#pragma mark -
#pragma mark 拷贝二叉树

BinaryNode * CopyBinaryTree(BinaryNode *rootNode){
    
    if(rootNode == NULL) return NULL;
    
    // 拷贝左子树
    BinaryNode *lNode = CopyBinaryTree(rootNode->leftChild);
    
    // 拷贝右子树
    BinaryNode *rNode = CopyBinaryTree(rootNode->rightChild);
    
    // 创建根结点
    BinaryNode *newRoot = malloc(sizeof(BinaryNode));
    newRoot->data = rootNode->data;
    newRoot->leftChild = lNode;
    newRoot->rightChild = rNode;
    
    return newRoot;
}


void FreeBinaryTree(BinaryNode *node){
    if(node == NULL) return;
    FreeBinaryTree(node->leftChild);
    FreeBinaryTree(node->rightChild);
    free(node);
}

///  构建二叉树
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
    
    FirstRecursion(&node1);
    printf("\n");
    
    MiddleRecusion(&node1);
    printf("\n");
    
    LastRecusion(&node1);
    printf("\n");
    
    int number = 0;
    CaluateLeafNum(&node1, &number);
    
    printf("叶子结点的个数:%d\n",number);

    // 拷贝二叉树
    printf("拷贝二叉树遍历:");
    BinaryNode *newRoot = CopyBinaryTree(&node1);
    FirstRecursion(newRoot);
    
    FreeBinaryTree(newRoot);
    printf("\n");
    
    int deep = CalculateLeafDeep(&node1);
    printf("树的高度:%d\n",deep);

}


int main(int argc, const char * argv[]) {

    CreateBinaryTree();
    
    return 0;
}
