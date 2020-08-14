//
//  main.cpp
//  141. 环形链表
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/linked-list-cycle/

#include <iostream>


struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};


/*
 *  思路：快慢指针
 *       慢指针走一步
 *       快指针走2步  如果相遇了就是有环
 *
 */

class Solution {
public:
    bool hasCycle(ListNode *head) {
        
        if(head == NULL || head->next == NULL) return false;
        
        ListNode *slowHead = head;
        ListNode *fastHead = head->next;
        
        while (fastHead && fastHead->next) {
            
            if(fastHead == slowHead) return true;
            fastHead = fastHead->next->next;
            slowHead = slowHead->next;
            
        }
        
        return false;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
