//
//  main.cpp
//  94. 二叉树的中序遍历
//
//  Created by luokan on 2020/8/17.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

#include <iostream>
#include <vector>
#include <stack>
using namespace std;


 struct TreeNode {
      int val;
      TreeNode *left;
      TreeNode *right;
      TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 };

class Solution {
public:
    
    // 中序 - 递归的方法
    void traversal(TreeNode *root,vector<int> &vt){
        if(root == NULL) return;
        traversal(root->left, vt);
        vt.push_back(root->val);
        traversal(root->right, vt);
    }
    
    // 中序 - 非递归
    void traversal2(TreeNode *root,vector<int> &vt){
        stack<TreeNode *> st;
        TreeNode *p = root;
        
        while (!st.empty() || p) {
            
            if(p){
                st.push(p);
                p = p->left;
            }else{
                
                p = st.top();
                vt.push_back(p->val);
                st.pop();
                p = p->right;
            }
        }
    }
    
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> result;
        traversal(root, result);
        return result;
    }
};

// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/wan-quan-mo-fang-di-gui-bu-bian-yi-xing-miao-sha-q/
//class Solution {
//public:
//    vector<int> preorderTraversal(TreeNode* root) {
//        vector<int> res;  //保存结果
//        stack<TreeNode*> call;  //调用栈
//        if(root!=nullptr) call.push(root);  //首先介入root节点
//        while(!call.empty()){
//            TreeNode *t = call.top();
//            call.pop();  //访问过的节点弹出
//            if(t!=nullptr){
//                if(t->right) call.push(t->right);  //右节点先压栈，最后处理
//                if(t->left) call.push(t->left);
//                call.push(t);  //当前节点重新压栈（留着以后处理），因为先序遍历所以最后压栈
//                call.push(nullptr);  //在当前节点之前加入一个空节点表示已经访问过了
//            }else{  //空节点表示之前已经访问过了，现在需要处理除了递归之外的内容
//                res.push_back(call.top()->val);  //call.top()是nullptr之前压栈的一个节点，也就是上面call.push(t)中的那个t
//                call.pop();  //处理完了，第二次弹出节点（彻底从栈中移除）
//            }
//        }
//        return res;
//    }
//};


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
