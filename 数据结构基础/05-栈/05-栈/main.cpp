//
//  main.cpp
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>
#import "SeqStack.hpp"
#import <string.h>


void PrintStack(void* data){
    
    if(data == NULL) return;
    
    Persion *p = (Persion *)data;
    printf("name = %s age = %d\n",p->name,p->age);
}

int main(int argc, const char * argv[]) {

    SeqStack *sq = Init_SeqStack();
    
    Persion p1 = {"a",1};
    Persion p2 = {"b",2};
    Persion p3 = {"c",3};
    Persion p4= {"d",4};
    
    Push_Stack(sq, &p1);
    Push_Stack(sq, &p2);
    Push_Stack(sq, &p3);
    Push_Stack(sq, &p4);
    
    Pop_Stack(sq);
    Pop_Stack(sq);
    
    Print_SeqStack(sq
                   , PrintStack);
    
    
    
    return 0;
}
