//
//  main.cpp
//  206. 反转链表
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-linked-list/submissions/

#include <iostream>

 
struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};
 

/*
 *  思路1： 头插法
 *         创建一个新链表头，每次插入头部
 *
 *  思路2： 原地交换
 *
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {

        ListNode *newHead = NULL;
        ListNode *headnext;
        while (head) {
             headnext = head->next;
             head->next = newHead;
             newHead = head;
             head = headnext;
        }
        return newHead;
    }
    

    ListNode *reverseList2(ListNode *head){
        
        if(head == NULL || head->next == NULL) return head;
        
        ListNode *begin = head;
        ListNode *end = head->next;
        
        while (end) {
            
            // 移除end
            begin->next = end->next;
            
            // end 头插
            end->next = head;
            head = end;
            
            // 重置end 为下次循环准备
            end = begin->next;
        }
        return head;
    }
    
};


int main(int argc, const char *argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
