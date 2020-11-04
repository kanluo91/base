//
//  main.c
//  KMP匹配
//
//  Created by luokan on 2020/10/30.
//


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
 *  特点： i不回退  j回退（j回退的位置就是KMP算法的关键）
 *
 *
 */


void MakeNext(char *str,int *array){
    
    int i = 1;
    int j = 0;
    array[1] = 0;
    array[2] = 1;
    
    while(i<strlen(str)){
        if (j == 0 || str[i-1] == str[j-1]) {
            i++;
            j++;
            array[i] = j;
        }else{
            j = array[j];
        }
    }
    
}

int KMP(char *str1,char *str2){
    size_t len = strlen(str2)+1;
    int Next[len];
    MakeNext(str2, Next);
    int i = 1;
    int j = 1;
    while(i<=strlen(str1) && j<= strlen(str2)){
        if(j == 0|| str1[i-1] == str2[j-1]){
            i++;
            j++;
        }else{
            j = Next[j];
        }
    }
    if(j == len){
        return i-j+1;
    }
    return -1;
}

int main(int argc, const char * argv[]) {
    
    int index = KMP("ababcabcacbab", "abcac");
    printf("KMP匹配 比较次数：%d  匹配位置:%d\n",0,index);

    return 0;
}
