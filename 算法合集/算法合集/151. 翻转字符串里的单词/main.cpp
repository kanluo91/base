//
//  main.cpp
//  151. 翻转字符串里的单词
//
//  Created by luokan on 2021/3/27.
// https://leetcode-cn.com/problems/reverse-words-in-a-string/

#include <iostream>
#include <string.h>
using namespace std;

class Solution {
public:
    
    string reverse(string &s,int begin,int end){
        if(end<=begin) return s;
        end--;
        while (begin < end) {
            char t = s[begin];
            s[begin] = s[end];
            s[end] = t;
            begin++;
            end--;
        }
        return s;
    }
    
    string reverseWords(string s) {
        // 去除空格
        unsigned long len = s.length();
        int fillidx = 0;
        bool islastblank = true;
        for (int i = 0; i<len; i++) {
            if(s[i] != ' '){
                s[fillidx++] = s[i];
                islastblank = false;
            }else{
                if(islastblank){
                    
                }else{
                    s[fillidx++] = s[i];
                }
                islastblank = true;
            }
        }
        s[fillidx] = '\0';
        
        // 逆序
        int currentlen = fillidx;
        reverse(s, 0, currentlen);
        int begin = 0;
        for (int i = 0; i<=currentlen; i++) {
            if(s[i] == ' '){
                reverse(s, begin, i);
                begin = i+1;
            }else if(s[i] == '\0'){
                reverse(s, begin, i);
                begin = i+1;
            }
        }
        return s;
    }
};

int main(int argc, const char * argv[]) {
    
    string str = " hello luo  kan! ";
    Solution sl;
    string res =  sl.reverseWords(str);
    cout << res << endl;
    
    return 0;
}
