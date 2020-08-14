//
//  main.cpp
//  1-斐波那契
//
//  Created by luokan on 2020/8/14.
//  Copyright © 2020 金角大王. All rights reserved.
//  https://leetcode-cn.com/problems/fibonacci-number/


#include <iostream>


class Solution {
public:
    int fib(int N) {
        if(N < 2) return N;
        
        int left = 0,right = 1;
        int result = 0;
        
        for (int i = 2;i <= N; i++) {
            result = left  + right;
            left = right;
            right = result;
        }
        return result;
    }
};

int main(int argc, const char * argv[]) {

    
    Solution st;
    int n = 4;
    int num =  st.fib(n);
    printf("斐波那契 f(%d) = %d\n",n,num);
    
    
    return 0;
}

