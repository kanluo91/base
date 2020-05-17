//
//  LinkList.cpp
//  03-链表
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include "LinkList.hpp"
#include <stdlib.h>

// 人
typedef struct{
    char name[64];
    int age;
    int score;
}Persion;

// 1. 初始化链表
LinkList * InitLinkList(){
    
    // 头节点是不保存数据信息的
    LinkList *list = (LinkList *)malloc(sizeof(LinkList));
    list->size = 0;
    
    list->head = (LinkNode *)malloc(sizeof(LinkNode));
    list->head->data = NULL;
    list->head->next = NULL;
    
    return list;
}

// 2. 插入数据
void InsertAtIndex(LinkList *list,int index,void* value){
    
}

// 3. 删除
void RemoveIndex(LinkList* list,int index){
    
}

// 4 长度
int ListLength(LinkList *list){
    // head节点不算入size 长度 head 是占位的空节点
    return list->size;
}

// 5 返回第一个节点
LinkNode* FrontListList(LinkList *list){
    return list->head->next;
}

// 6.释放链表内容
void freeListSpace(LinkList *list){
    
}

// 7 查找数据的角标
int IndexOfValue(LinkList *list,void* value){
    
    return -1;
}

// 8 打印链表节点
void PrintLinkList(LinkList *list,PrintNodeFunc printFunc){
    
    
}
