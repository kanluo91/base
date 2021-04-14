//
//  main.cpp
//  判断回文
//
//  Created by luokan on 2021/3/30.
//

#include <iostream>
#include <ctype.h>
using namespace std;

class Solution {
public:

    bool isCharEqual(char a,char b){
        // 数字 字母
        if(isdigit(a) && !isdigit(b)) return false;
        if(!isdigit(a) && isdigit(b)) return false;
        
        
        // a b 小写/ 大写
        // a 小写  b大写
        // a 大写  b小写
        int avalue = (int)a;
        int bvalue = (int)b;
        if(avalue == bvalue) return true;
        if(avalue - bvalue == 32 || bvalue - avalue == 32) return true;
        return false;
    }

    bool ischar(char c){
        int value = (int)c;
        if((value >= 65 && value <= 90) || (value>=97 && value <= 122) ||(value >= 48 && value <= 57)){
            return true;
        }
        return false;
    }


    bool isPalindrome(string s) {
        int len = s.length();
        int begin = 0;
        int end = s.length()-1;
        while(begin < end){
            
            if(ischar(s[begin]) == false){
                begin++;
                continue;
            }
            if(ischar(s[end]) == false){
                end--;
                continue;
            }

            if(isCharEqual(s[begin],s[end])){
                begin++;
                end--;
            }else{
                return false;
            }
        }
        return true;
    }
};

int main(int argc, const char * argv[]) {
    
    Solution sl;
    bool isRight = sl.isPalindrome("0P");
    
    int res = toupper(3);
    int res1 = tolower(3);
    
    return 0;
}
