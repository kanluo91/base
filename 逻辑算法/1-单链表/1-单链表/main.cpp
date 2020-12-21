//
//  main.cpp
//  1-单链表
//
//  Created by luokan on 2020/12/21.
//

#include <iostream>
using namespace std;

#define ERROR 0
#define TRUE 1
#define FALSE 0
#define OK 1

typedef int Status;
typedef int  ElemType;


typedef struct Node{
    ElemType data;
    Node *next;
}Node,*LinkList;


///  创建单链表-默认带头结点
/// @param L 单链表
Status InitLinkList(LinkList *L){
    *L = (Node *)malloc(sizeof(Node));
    if(*L == NULL) return ERROR;
    (*L)->data = 0;
    (*L)->next = NULL;
    return OK;
}

///  插入数据
/// @param L 链表
/// @param index 角标  位置走1开始
/// @param data 数据
Status LinkListInsert(LinkList *L,int index,ElemType data){
    
    Node *p = *L;
    
    // 找到要插入的前一个元素
    while(index>1 && p){
        p = p->next;
        index--;
    }
    
    if(p == NULL) return ERROR;
    
    Node *t =(Node *)malloc(sizeof(Node));
    t->data = data;
    t->next = NULL;
    
    t->next = p->next;;
    p->next = t;
    return OK;
}

/// 获取链表的某个元素
/// @param L 链表
/// @param index 角标
/// @param value 返回的元素值
Status LinkListGetValue(LinkList L,int index ,ElemType *value){
    
    Node *p =  L->next;
    while (index>0 && p) {
        p=p->next;
    }
    if(index == 0 && p){
        *value = p->data;
        return OK;
    }else{
        return ERROR;
    }
}

/// 删除链表中某个位置元素
/// @param L 链表
/// @param index 角标
Status LinkListDelete(LinkList *L,int index){
    
    Node *p = (*L);
    // 拿到前一个元素
    while(p && index>1){
        p=p->next;
        index--;
    }
    
    if(p && index == 1){
        if(p->next){
            Node *temp = p->next;
            p->next = temp->next;
            free(temp);
        }
        return OK;
        
    }else{
        return ERROR;
    }
}

/// 置空链表 L == NULL
/// @param L 链表
Status LinkListClear(LinkList *L){
    Node *head,*temp;
    head = (*L)->next;
    if(head){
        temp = head->next;
        // 释放temp
        free(head);
        head = temp->next;
    }
    (*L) = NULL;
    return OK;
}


void DisplayLinkList(LinkList l){
    cout<<endl;
    
    if(l == NULL || l->next == NULL) return;
    
    Node *p = l->next;
    while (p) {
        cout<< p->data << "_";
        p = p->next;
    }
    cout<<endl;
}


int main(int argc, const char * argv[]) {
    
    LinkList L;
    InitLinkList(&L);
    
    // 添加
    LinkListInsert(&L, 1, 1);
    LinkListInsert(&L, 2, 2);
    LinkListInsert(&L, 3, 3);
    LinkListInsert(&L, 4, 4);
    
    // 删除
    LinkListDelete(&L, 2);
    LinkListDelete(&L, 2);
    
    //清空
    LinkListClear(&L);
    
    DisplayLinkList(L);
    

    return 0;
}
