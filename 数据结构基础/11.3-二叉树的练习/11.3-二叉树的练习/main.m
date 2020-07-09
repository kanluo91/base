//
//  main.m
//  11.3-二叉树的练习
//
//  Created by luokan on 2020/7/9.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

/// 递归的方法-求树的高度
/// @param root 根结点
int TreeDeep1(TreeNode *root){
    
    if(root == NULL) return 0;
    
    int left = TreeDeep1(root->leftChild);
    int right = TreeDeep1(root->rightChild);
    
    return MAX(left, right)+1;
}


/// 非递归的方法求树的高度
/// @param root 根结点
int TreeDeep2(TreeNode *root){
    
    Queue *q =  Init_Queue();
    EnQueue(q, CreateQueueNode(root));  // 进队
    int height = 0;
    
    while (QueueSize(q) > 0) {
        
        // 出队
        QueueNode *qNode = DeQueue(q);
        
        if(QueueSize(q) == 0){
            height ++;
        }
        
    
        if(qNode && qNode->data){
            
            EnQueue(q, CreateQueueNode(qNode->data->leftChild));
            
            EnQueue(q, CreateQueueNode(qNode->data->rightChild));
        }
    }
    
    return 0;
}


/// 是不是完全二叉树
/// @param root 树的根结点   1 YES / -1 NO
int isFullBinaryTree(TreeNode *root){

    
    return -1;
}


/// 翻转二叉树
/// @param root 二叉树的根结点
void ReverseTree(TreeNode *root){
    
    
    
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
    
    
    
    printf("\n");
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
