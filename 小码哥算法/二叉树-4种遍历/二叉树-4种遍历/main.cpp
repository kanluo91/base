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
#include <queue>
using namespace std;

typedef struct TREENODE{
    int value;
    struct TREENODE *left,*right;
}TreeNode,*Tree;


TreeNode* LinkStack[100];
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

#pragma mark -
#pragma mark 先序(根-左-右)
void PreOrderTraversal(Tree T){
    
    struct TREENODE * p = T;
    Push(p);
    
    while(Top()){
        p = Top();
        printf("%d,",p->value);
        Pop();
        if(p->right){
            Push(p->right);
        }
        
        if(p->left){
            Push(p->left);
        }
    }
}

#pragma mark -
#pragma mark 中序遍历：（左-根-右）
void MidOrderTraversal(Tree T){
    struct TREENODE *p =T;
    while (p || Top()) {
        if(p){
            Push(p);
            p = p->left;
        }else{
            p = Top();
            printf("%d,",p->value);
            Pop();
            p = p->right;
        }
    }
}


#pragma mark -
#pragma mark 后序遍历
void LastOrderTraversal(Tree T){
    
    
    
}


#pragma mark -
#pragma mark 层序遍历

void LevelOrderTraversal(Tree T){
    
    Tree Array[100];
    int front = 0;
    int rear = 0;
    // 队空： rear == front
    // 队满： (rear+1)%MaxSize == front
    
    Array[rear++] = T;
    
    int level = 0;
    
    while(rear != front){
        Tree top = Array[front];
        printf("%d,",top->value);
        // 出队列
        front = (front+1)%100;
    
        if(top->left){
            Array[rear++] = top->left;
        }
        if(top->right){
            Array[rear++] = top->right;
        }
    }
    printf("\n层级:%d\n",level);
}


#pragma mark -
#pragma mark 先序遍历 2
void PreOrderTraversal2(Tree T){
    cout << endl;
    if(T == NULL) return;
    stack<Tree> st;
    st.push(T);
    while(!st.empty()){
        Tree top = st.top();
        cout << top->value  << " ";
        st.pop();
        if(top->right){
            st.push(top->right);
        }
        if(top->left){
            st.push(top->left);
        }
    }
    cout << endl;
}

#pragma mark -
#pragma mark 层序遍历2
void LevelOrderTraversal2(Tree T){
    
    if(T == NULL) return;
    queue<Tree> q;
    q.push(T);
    int height = 0;
    int levelSize = 1;// 加了一个数据
    while (!q.empty()) {
        // 队头 出队列
        Tree data = q.front();
        q.pop();
        levelSize--;
        if(q.empty()){
            height++;
        }
        cout << data->value << " ";
        if(data->left){
            q.push(data->left);
        }
        if(data->right){
            q.push(data->right);
        }
        if(levelSize == 0){
            levelSize = q.size();
            height++;
        }
    }
    cout << endl;
    cout << "height = " << height <<endl;
}

int main(int argc, const char * argv[]) {
    
    Tree t;
    InitTree(t);
//    PreOrderTraversal(t);
//    PreOrderTraversal2(t);
//    MidOrderTraversal(t);
//    LevelOrderTraversal(t);
    LevelOrderTraversal2(t);
    
//    vector<int> vt;
//    vt.push_back(1);
//    vt.push_back(2);
//
//    cout << vt[1] << endl;
    
    printf("\n");
    return 0;
}
