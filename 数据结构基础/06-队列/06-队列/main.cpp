//
//  main.cpp
//  06-队列
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#include <iostream>
#import <string.h>
#include "SeqQueue.hpp"

typedef struct PP{
    char name[64];
    int age;
}Persion;

void printFuc(void* data){
    
    if(data == NULL)return;
    Persion *p = (Persion *)data;
    printf("name = %s  age = %d\n",p->name,p->age);
}

int main(int argc, const char * argv[]) {

    Persion p1 = {"金角大王",1};
    Persion p2 = {"银角大王",2};
    Persion p3 = {"火角大王",3};
    Persion p4 = {"水角大王",4};
    
    SeqQueue *queue = Init_Queue();
    Push_SeqQueue(queue, &p1);
    Push_SeqQueue(queue, &p2);
    Push_SeqQueue(queue, &p3);
    Push_SeqQueue(queue, &p4);
    
    Pop_SeqQueue(queue);
    Pop_SeqQueue(queue);
    
//    Clear_SeqQueue(queue);
    
    Print_SeqQueue(queue, printFuc);
    
    return 0;
}
