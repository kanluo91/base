//
//  main.cpp
//  剑指 Offer 06. 从尾到头打印链表
//
//  Created by luokan on 2021/3/1.
//

#include <iostream>
#include <vector>
using namespace std;

struct ListNode {
 int val;
 ListNode *next;
 ListNode(int x) : val(x), next(NULL) {}
};

void displayList(ListNode *head){
    
    while (head) {
        cout << head->val << endl;
        head = head->next;
    }
    
}

struct ListNode* reverseList(struct ListNode* head){
    if(head == NULL || head->next == NULL) return head;

    struct ListNode *p1 = head;
    struct ListNode *p2 = head->next;

    while(p2){
        p1->next = p2->next;
        p2->next = head;
        head = p2;
        p2 = p1->next;
    }
    return head;
}

class Solution {
public:
    vector<int> reversePrint(ListNode* head) {
        
        vector<int> vt;
//        ListNode *p = head->next;
//        while(p){
//            ListNode *pnext = p->next;
//            p->next = head;
//            head = p;
//            p = pnext;
//        }
        
        head = reverseList(head);
        ListNode *p = head;
        while(p){
            vt.push_back(p->val);
            p = p->next;
        }
        return vt;

    }
};

int main(int argc, const char * argv[]) {

    ListNode *head = (ListNode *)malloc(sizeof(ListNode));
    head->val = 1;
    
    ListNode *d1 = (ListNode *)malloc(sizeof(ListNode));
    d1->val = 3;
    
    ListNode *d2 = (ListNode *)malloc(sizeof(ListNode));
    d2->val = 2;
    
    head->next = d1;
    d1->next = d2;
    d2->next = NULL;
    
    
    Solution sl;
    vector<int> vt =  sl.reversePrint(head);
    for (int i  = 0; i<vt.size(); i++) {
        cout <<  vt[i] << endl;
    }
    
    return 0;
}
