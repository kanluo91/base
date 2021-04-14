//
//  main.cpp
//  字符转数字
//
//  Created by luokan on 2021/3/29.
//

#include <iostream>
using namespace std;

class Solution {
public:
    int strToInt(string str) {
        int len = str.length();
        int start = 0;
        int userfulllen = 0;
        bool isPostive = true;
        for(int i = 0;i<len;i++){
            if(str[i] == ' ') continue;
            if(str[i] == '-'){
                start = i+1;
                isPostive = false;
            }else if(str[i] == '+'){
                start = i+1;
                isPostive = true;
            }
            else if(isdigit(str[i])){
                userfulllen++;
            }
        }
        int sum = 0;
        for(int i = start;i<len;i++){
            char c = str[i];
            if(!isdigit(c)) continue;
            int value = str[i] - '0';
            sum += pow(10,userfulllen-1)*value;
            userfulllen--;
            if(sum >= INT_MAX) return 0;
        }
        if(isPostive ==false){
            sum *= -1;
        }
        return sum;
    }
};

int main(int argc, const char * argv[]) {
    
    Solution sl;
    int res =  sl.strToInt("words and 987");
    printf("结果 =%d\n",res);
    
    return 0;
}
