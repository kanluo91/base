//
//  main.c
//  11.3-二叉树的题目
//
//  Created by luokan on 2020/7/9.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <stdio.h>
#import "Queue.h"

/// 递归的方法-求树的高度
/// @param root 根结点
int TreeDeep1(TreeNode *root){
    
    if(root == NULL) return 0;
    
    int left = TreeDeep1(root->leftChild);
    int right = TreeDeep1(root->rightChild);
    
    return left>right?left+1:right+1;
    
}


/// 非递归的方法求树的高度
/// @param root 根结点
int TreeDeep2(TreeNode *root){
    
    Queue *q =  Init_Queue();
    EnQueue(q, CreateQueueNode(root));  // 进队
    int height = 0;
    int currentQueueSize = 1;
    
    while (QueueSize(q) > 0) {
                
        // 出队
        QueueNode *qNode = DeQueue(q);
        
        currentQueueSize--;
        
        if(currentQueueSize == 0){
            height++;
        }
        
        if(qNode && qNode->data){
            
            EnQueue(q, CreateQueueNode(qNode->data->leftChild));
            
            EnQueue(q, CreateQueueNode(qNode->data->rightChild));
            
            if(currentQueueSize == 0){
                currentQueueSize = QueueSize(q);
            }
            
        }
    }
    
    return height;
}


/// 是不是完全二叉树
/// @param root 树的根结点   1 YES / -1 NO

// 1. 当前结点的  左边结点为空  右结点必须为空，
// 2.

int isFullBinaryTree(TreeNode *root){

    
    if(root == NULL) return -1;

    Queue *q =  Init_Queue();
    EnQueue(q, CreateQueueNode(root));  // 进队
    
    int isNextAllLeafNode = 0; // 标记后面是否全部是叶子结点
    
    while (QueueSize(q) > 0) {
        // 出队
        QueueNode *qNode = DeQueue(q);
        
        if(qNode && qNode->data){
            
            TreeNode *treeNode = qNode->data;
            // 1. left 没数据  right 有数据
            if(treeNode->leftChild == NULL && treeNode->rightChild){
                return -1;
            }
            
            
            
            // 判断后续出现的是否都是叶子结点
            if(isNextAllLeafNode == 1 &&(treeNode->leftChild || treeNode->rightChild)){
                return -1;
            }
            
            
            // 2. 左结点存在，右节点不存在   或者   左右结点都不存在  则后续的都是叶子结点
            if((treeNode->leftChild && treeNode->rightChild == NULL) || (treeNode->leftChild == NULL && treeNode->rightChild == NULL))
            {
                isNextAllLeafNode = 1;
            }
            
        }
        
        
        if(qNode && qNode->data){
            
            EnQueue(q, CreateQueueNode(qNode->data->leftChild));
            
            EnQueue(q, CreateQueueNode(qNode->data->rightChild));
        }
    }
    return 1;
}


/// 翻转二叉树
/// @param root 二叉树的根结点
void ReverseTree(TreeNode *root){
    if(root == NULL) return;
    Queue *q =  Init_Queue();
    EnQueue(q, CreateQueueNode(root));  // 进队
    while (QueueSize(q) > 0) {
        // 出队
        QueueNode *qNode = DeQueue(q);
        
        // 交换左右子树
        if(qNode && qNode->data){
            
            TreeNode *left = qNode->data->leftChild;
            qNode->data->leftChild = qNode->data->rightChild;
            qNode->data->rightChild = left;
        }
        if(qNode && qNode->data){
            
            EnQueue(q, CreateQueueNode(qNode->data->leftChild));
            
            EnQueue(q, CreateQueueNode(qNode->data->rightChild));
        }
    }
    
    
}


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


/// 层序遍历二叉树
/// @param root 二叉树的根结点
void LevelTravelTree(TreeNode *root){
    
    printf("层序遍历:");
    
    Queue *q =  Init_Queue();
    EnQueue(q, CreateQueueNode(root));  // 进队
    
    while (QueueSize(q) > 0) {
        
        // 出队
        QueueNode *qNode = DeQueue(q);
    
        if(qNode && qNode->data){
            
            printf("%c",qNode->data->value);
            
            EnQueue(q, CreateQueueNode(qNode->data->leftChild));
            
            EnQueue(q, CreateQueueNode(qNode->data->rightChild));
        }
    }
    
    printf("\n");
}


/// 根据遍历结果  重构二叉树

//  以下的情况之一可以保证一颗唯一的二叉树
//  1. 前序遍历 +  中序遍历
//  2. 后续遍历 +  中序遍历



// 练习：
// 前序遍历：  4 2 1 3 6 5 
// 中序遍历：  1 2 3 4 5 6
void RebuildTree(){
    
    
    
    
    
}


int main(int argc, const char * argv[]) {

    TreeNode *tree = createTree();
    
    int deep1 = TreeDeep1(tree);
    
    int deep2 = TreeDeep2(tree);
    
    int isFull = isFullBinaryTree(tree);
    
    printf("树的高度：%d   %d\n",deep1,deep2);
    
    printf("是不是完全二叉树:%d\n",isFull);
    
    LevelTravelTree(tree);
    
    ReverseTree(tree);
    
    LevelTravelTree(tree);
    
    
    return 0;
}
