//
//  main.cpp
//  203. 移除链表元素
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/remove-linked-list-elements/

#include <iostream>


struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        
        if(head == NULL) return head;

        // 创建一个虚拟头结点
        ListNode *virtualHead = (ListNode *)malloc(sizeof(ListNode));// new ListNode(-1);
        virtualHead->next = head;

        ListNode *move = virtualHead;
        
        while (move->next) {
            if(move->next->val == val){
                move->next = move->next->next;
            }else{
                move = move->next;
            }
        }
        return virtualHead->next;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
