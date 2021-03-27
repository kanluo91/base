//
//  main.c
//  数组
//
//  Created by luokan on 2021/3/27.
//

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {

    char s1[100] = "hello ";
    char s2[] = "world !\n";
    strcat(s1,s2);
    printf("%s",s1);
    
    char str1[100] = "你好呀!";
    char str2[100] = "我是谁!";
    strcpy(str1, str2);
    printf("%s\n",str1); // 我是谁    
    printf("行号：%d\n",__LINE__);

    return 0;
}
