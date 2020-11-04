//
//  main.c
//  BF字符串匹配
//
//  Created by luokan on 2020/10/29.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


/// 字符串匹配
/// @param str1 串1
/// @param str2 串2
int BFMate(char *str1,char *str2){
    
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    int i ,j,count;
    
    while(i<len1 && j<len2){
        count++;
        if(str1[i] == str2[j]){
            i++;
            j++;
        }else{
            i = i-j+1;
            j = 0;
        }
    }
    
    printf("匹配次数  %d\n",count);
    
    if(j==len2){
        return i-j;
    }
    return -1;
}



int main(int argc, const char * argv[]) {
    // insert code here...
    
    int index = BFMate("ababcabcacbab", "abcac");
    
    printf("匹配结果： %d\n",index);
    return 0;
}
