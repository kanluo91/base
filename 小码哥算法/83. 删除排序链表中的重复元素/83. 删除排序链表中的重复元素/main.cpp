//
//  main.cpp
//  83. 删除排序链表中的重复元素
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/remove-linked-list-elements/submissions/

#include <iostream>


struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};
 

/*
 *  思路： 有序链表
 *
 *
 *  [1,1,2,3,3]
 */

class Solution {
public:
    ListNode* deleteDuplicates(ListNode* head) {
        
        if(head == NULL || head->next == NULL) return head;

        ListNode *p = head;
        while (p && p->next) {
            
            if(p->val == p->next->val){
                p->next = p->next->next;
            }else{
                p = p->next;
            }
        }
        return head;
    }
};


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
