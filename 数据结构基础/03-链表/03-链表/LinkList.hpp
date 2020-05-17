//
//  LinkList.hpp
//  03-链表
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef LinkList_hpp
#define LinkList_hpp

#include <stdio.h>

typedef struct LINKNODE{
    void* data;
    struct LINKNODE *next;
} LinkNode;

typedef struct LINKLIST{
    LinkNode *head;
    int size;
    // 不需要容量 没有容量的概念
}LinkList;

// 打印函数指针
typedef void (*PrintNodeFunc)(void *);

// 1. 初始化链表
LinkList * InitLinkList();

// 2. 插入数据
void InsertAtIndex(LinkList *list,int index,void* value);

// 3. 删除
void RemoveIndex(LinkList* list,int index);

// 4 长度
int ListLength(LinkList *list);

// 5 返回第一个节点
LinkNode* FrontListList(LinkList *list);

// 6.释放链表内容
void freeListSpace(LinkList *list);

// 7 查找数据的角标
int IndexOfValue(LinkList *list,void* value);

// 8 打印链表节点
void PrintLinkList(LinkList *list,PrintNodeFunc printFunc);

#endif /* LinkList_hpp */
