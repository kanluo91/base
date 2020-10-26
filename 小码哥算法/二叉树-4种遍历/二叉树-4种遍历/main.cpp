//
//  main.cpp
//  二叉树-4种遍历
//
//  Created by luokan on 2020/8/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>
#include <vector>
#include <stack>
using namespace std;

typedef struct TREENODE{
    int value;
    struct TREENODE *left,*right;
}TreeNode,*Tree;


TreeNode* LinkStack[20];
int top = -1;

void InitTree(Tree &T){
    T = (TreeNode *)malloc(sizeof(TreeNode));
    T->value = 1;
    
    TreeNode *b2 = (TREENODE *)malloc(sizeof(TREENODE));
    b2->value  =2;
    
    TreeNode *b3 = (TREENODE *)malloc(sizeof(TREENODE));
    b3->value  =3;
    
    TreeNode *b4 = (TREENODE *)malloc(sizeof(TREENODE));
    b4->value  =4;

    TreeNode *b5 = (TREENODE *)malloc(sizeof(TREENODE));
    b5->value  =5;
    
    TreeNode *b6 = (TREENODE *)malloc(sizeof(TREENODE));
    b6->value  =6;
    
    TreeNode *b7 = (TREENODE *)malloc(sizeof(TREENODE));
    b7->value  =7;
    
    T->left = b2;
    T->right = b3;
    
    b2->left = b4;
    b2->right = b5;
    
    b4->left = NULL;
    b4->right = NULL;
    
    b5->left = NULL;
    b5->right = NULL;
    
    b3->left = b6;
    b3->right = b7;
    
    b6->left = NULL;
    b6->right = NULL;
    
    b7->left = NULL;
    b7->right = NULL;
    
}

void Push(TreeNode *node){
    LinkStack[++top] = node;
}

void Pop(){
    if(top == -1) return;
    top--;
}

TreeNode* Top(){
    if(top == -1) return NULL;
    return LinkStack[top];
}

/*
 * 先序(根-左-右)
 */
void PreOrderTraversal(Tree T){

    TreeNode *p;
    Push(T);
    while (Top() != NULL) {
        
        p = Top();
        Pop();
        
        while (p) {
//            printf("_%d",p->value);
            
            TreeNode *temp = p->left;
            p->left = p->right;
            p->right = temp;
            
            if(p->right){
                Push(p->right);      // 右进栈
            }
            p = p->left;             // 指向左
        }
    }
}

/*
 * 中序遍历：（左-根-右）
 *
 */
void MidOrderTraversal(Tree T){
    
    TreeNode *p = T;
    
    while (p || top != -1) {
        
        if(p){
            Push(p);
            p = p->left;
        }else{ // P 不存在的情况
            p = Top();
            printf("%d_",p->value);
            Pop();
            p = p->right;
        }
    }
}


void LastOrderTraversal(Tree T){
    
    
    
    
}


int main(int argc, const char * argv[]) {
    // insert code here...
    Tree t;
    InitTree(t);
//    PreOrderTraversal(t);
    MidOrderTraversal(t);
    printf("\n");
    return 0;
}
