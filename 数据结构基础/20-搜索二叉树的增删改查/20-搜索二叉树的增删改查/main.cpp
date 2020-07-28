//
//  main.cpp
//  20-搜索二叉树的增删改查
//
//  Created by luokan on 2020/7/28.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>
#include <stdio.h>
#include <stdlib.h>


#define ElemType int
#define KeyType  int
#define FALSE    0
#define TRUE     1
#define CTS     7

/* 二叉树 结点结构定义*/
typedef struct BINode{
    int data;
    struct BINode *lChild,*rChild;
} BINode, *BiTree;


/// 搜索二叉树元素
/// @param tree 二叉树
/// @param e 元素
bool SearchBST(BiTree tree, ElemType e,BINode *findE){
    if(tree  == NULL)  return false;
    
    if(e == tree->data){
        findE = tree;
        return true;
    }else if(e > tree->data){
        return SearchBST(tree->rChild, e, findE);
    }else{
        return SearchBST(tree->lChild, e, findE);
    }
}

/// 插入元素
/// @param T 二叉树指针的指针
/// @param e 元素
bool InsertBST(BiTree &T,ElemType e){
    
    BINode *p = NULL;
    if(SearchBST(T, e, p) == false){
        
        // 创建结点
        BINode *node = (BINode *)malloc(sizeof(BINode));
        node->data = e;
        node->lChild = node->rChild = NULL;
        
        // 判断是否是空树
        if(T == NULL){    // 空树的话  是根结点
            T = node;
        }else{           // 非空
            if(e < T->data){
                InsertBST(T->lChild, e);
            }else{
                InsertBST(T->rChild, e);
            }
        }
        return true;
    }
    // 已经有该元素  不做插入操作
    return false;
}

/// 中序输出
/// @param tree 二叉树
void MidOrderPrint(BiTree tree){
    if(tree == NULL) return;
    
    MidOrderPrint(tree->lChild);
    
    printf("%d ",tree->data);
    
    MidOrderPrint(tree->rChild);
    
}

/// 删除元素
/// @param tree 二叉树
/// @param e 元素
bool DeleteBST(BiTree tree,ElemType e){
    if(tree == NULL) return false;
    
    BINode *p = NULL;
    if(SearchBST(tree, e, p) == true){ // 找到了结点
        if(p->lChild == NULL  && p->rChild == NULL){  // 叶子结点
            free(p);
            p = NULL;
        }else if(p->lChild && p->rChild == NULL){  // 只有左结点
            
            BINode *lChild = p->lChild;
            p = p->lChild;
            free(lChild);
            lChild = NULL;
            
        }else if(p->lChild == NULL && p->rChild){ // 只有右结点
            
            BINode *rChild = p->rChild;
            p = p->rChild;
            free(rChild);
            rChild = NULL;
            
        }else{ //双亲结点都有
            
            
            
            
        }
    }
    return false;
}


int main(int argc, const char * argv[]) {

    
    int a[CTS] = {3,-1,20,6,13,11,99};
    BiTree tree = NULL;
    
    for(int i = 0;i<CTS;i++){
        InsertBST(tree, a[i]);
    }
    
    
    printf("中序输出搜索二叉树:\n");
    MidOrderPrint(tree);
    printf("\n");
    
    
    return 0;
}
