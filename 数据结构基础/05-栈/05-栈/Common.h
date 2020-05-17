//
//  Common.h
//  05-栈
//
//  Created by luokan on 2020/5/17.
//  Copyright © 2020 金角大王. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define MAX_SIZE 1024

#define STACK_TRUE  1
#define STACK_FALSE 0

typedef struct PP{
    char name[64];
    int age;
}Persion;

typedef void (*PrintStackFunc)(void *);

#endif /* Common_h */
