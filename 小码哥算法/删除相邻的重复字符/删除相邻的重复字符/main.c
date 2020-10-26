//
//  main.c
//  删除相邻的重复字符
//
//  Created by luokan on 2020/10/14.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <stdio.h>
#include <string.h>


char * removeDuplicates(char * S){

    int top = -1;
    int len = strlen(S)/sizeof(char);
    for(int i =0;i<len;i++){

        S[++top] = S[i];
        if(top>0 && S[top] == S[top-1]){
            top = top-2;
        }
    }

    S[top+1] = '\0';
    return S;

}

//char * removeDuplicates(char * S){
//int top=-1;
//int i;
//int len=strlen(S);
//for(i=0;i<len;i++){
//    S[++top]=S[i];//入栈
//    if(top>0&&S[top]==S[top-1]){
//        top=top-2;
//    }
//}
//S[top+1]='\0';
//return S;
//}



int main(int argc, const char * argv[]) {
    // insert code here...
    
    char a[] = {'a','c','c','a','b','c','\0'};
    
    char *r = removeDuplicates(a);
    printf("剩余:%s\n",r);
    return 0;
}
