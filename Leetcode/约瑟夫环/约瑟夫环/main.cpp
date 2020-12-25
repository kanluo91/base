//
//  main.cpp
//  约瑟夫环
//
//  Created by luokan on 2020/12/22.
//

#include <iostream>
using namespace std;

typedef struct Persion{
    int num;
    struct Persion *next;
}Persion,*CyleList;


CyleList InitCycleList(CyleList *L,int num){
    *L = (Persion *)malloc(sizeof(Persion));
    (*L)->num = 1;
    (*L)->next = NULL;
    Persion *p = *L;
    
    for (int i =2; i<=num;i++) {
        Persion *temp = (Persion *)malloc(sizeof(Persion));
        temp->num = i;
        temp->next = NULL;
        p->next = temp;
        p = temp;
    }
    p->next = (*L);
    
    return *L;
}

/// 返回最后剩余的那个数字
/// @param l 循环链表
/// @param start 起始位置
/// @param gap 报数间隔
int FindAndKill(CyleList l,int start,int gap){
    
    if(l == NULL || start <= 0 || gap <= 1) return -1;
    
    // pStart 到开始的那个人
    Persion *pStart = l;
    while (start>1 && pStart) {
        pStart = pStart->next;
        start--;
    }
    
    int i = gap;
    while (pStart && pStart != pStart->next) {
        
        if(i == 1){ // 要删自己了
            Persion *pNext = pStart->next;
            cout<<"出队列的同学"<<pStart->num<<endl;
            pStart->num = pNext->num;
            pStart->next = pNext->next;
            free(pNext);
            i = gap;
        }else{
            // 找到要出队的前一个
            pStart = pStart->next;
            i--;
        }
    }
    return l->num;
}

void Display(CyleList l){
    
    Persion *head = l;
    while(l && l->next != head){
        cout<<l->num<<"_";
        l = l->next;
    }
    cout<<l->num;
    cout<<endl;
}

int main(int argc, const char * argv[]) {
    
    cout<<"输入圆桌上的人数:";
    int n;
    scanf("%d",&n);
    
    CyleList l;
    InitCycleList(&l, n);
    Display(l);
    cout<<"输入开始位置:";
    int from;
    scanf("%d",&from);
    
    cout<<"输入报数间隔数:";
    int gap;
    scanf("%d",&gap);
    
    int last = FindAndKill(l, from, gap);

    cout<<"胜利者"<< last << endl;
    
    return 0;
}
