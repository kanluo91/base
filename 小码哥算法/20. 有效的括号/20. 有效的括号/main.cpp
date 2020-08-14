//
//  main.cpp
//  20. 有效的括号
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/valid-parentheses/

#include <iostream>
#include <stack>
#include <string>

using namespace std;

//  特别注意
//  st.empty() 时  st.top()  返回一个栈顶元素的引用，类型为 T&。如果栈为空，程序会报错。


//'('，')'，'{'，'}'，'['，']'
class Solution {
public:
    bool isValid(string s) {
        
        stack<char> st;
        for (int i = 0; i<s.length(); i++) {
            char letter = s[i];
            
            switch (letter) {
                case '(':
                    st.push(s[i]);
                    break;
                case '{':
                    st.push(s[i]);
                    break;
                case '[':
                    st.push(s[i]);
                    break;
                    
                case ')':
                    if(!st.empty()&&st.top() == '('){
                        st.pop();
                    }else{
                        st.push(s[i]);
                    }
                    break;
                case '}':
                    if(!st.empty()&&st.top() == '{'){
                         st.pop();
                     }else{
                         st.push(s[i]);
                     }
                    break;
                case ']':
                    if(!st.empty()&&st.top() == '['){
                         st.pop();
                     }else{
                         st.push(s[i]);
                     }
                    break;
                default:
                    break;
            }
            
            
        }
        return st.empty();
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    
    Solution st;
    bool isV = st.isValid("]");
    printf("%s\n",isV?"YES":"NO");
    
    return 0;
}

