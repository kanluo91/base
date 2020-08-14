//
//  main.cpp
//  876. 链表的中间结点
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>

struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};
 
class Solution {
public:
    ListNode* middleNode(ListNode* head) {
        
        ListNode *slow = head;
        ListNode *fast = head;
        while (fast && fast->next) {
            fast = fast->next->next;
            slow = slow->next;
        }
        return slow;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
