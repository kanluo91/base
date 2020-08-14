//
//  main.cpp
//  237. 删除链表中的节点
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

/*
 *  思路：
 *      1。把下个结点的数据拷贝到当前要删除的结点
 *      2. 然后移除下一个结点
 *
 *
 */
class Solution {
public:
    void deleteNode(ListNode* node) {
        
        if(node == NULL) return;
        
        node->val = node->next->val;
        node->next = node->next->next;
        
    }
};

int main(int argc, const char * argv[]) {

    
    
    return 0;
}
