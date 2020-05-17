//
//  main.cpp
//  01-算法复杂度
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>

#pragma mark -
#pragma mark 常数级 O(1)
void test1(){
    // 0(3) == > O(1)
    int sum = 0,n = 100;
    sum = (1+n)*n/2;
    printf("%d\n",sum);
}

#pragma mark -
#pragma mark O(n)
void test2(int n){
    for (int i = 0; i<n; i++) {
        printf("%d\n",i);
    }
}

#pragma mark -
#pragma mark O(logN)
void test3(int n){
    // O(log2^n)
    int count = 1;
    while (count<n) {
        count = count*2;
    }
}

#pragma mark -
#pragma mark O(n^2)
void test4(int n){
    int i=0,j=0,count = 0;
    for (i = 0; i<n; i++) {
        for (j = 0; j<n; j++) {
            count++;
            printf("执行次数:%d\n",count);
        }
    }
}

#pragma mark -
#pragma mark O(n^2)
void test5(int n){
    int i=0,j=0,count = 0;
    for (i = 0; i<n; i++) {
        for (j = i; j<n; j++) {
            count++;
            printf("执行次数:%d\n",count);
        }
    }
}


int main(int argc, const char * argv[]) {

    test4(10);
    
    return 0;
}
