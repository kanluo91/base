//
//  main.m
//  旋转
//
//  Created by luokan on 2020/12/29.
//  

#import <Foundation/Foundation.h>

typedef struct Node{
    int data;
    int height;
    struct Node *left,*right,*parent;
}Node;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}


void afertAdd(Node *node){
    
    while((node = node->parent) != NULL){
        
        // 如果是平衡的则更新高度  不平衡则调平衡
        if(isBalance(node)){ // 判断是否平衡
            // 更新高度的逻辑是Max(leftHeight,rightHeight) + 1
            
        }else{ // 恢复平衡
            reblance(firtNotBlanceNode); // 高度最低的那个不平衡的结点
            break;
        }
    }
    
}
