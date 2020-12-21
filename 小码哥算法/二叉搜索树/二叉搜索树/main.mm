//
//  main.m
//  二叉搜索树
//
//  Created by luokan on 2020/11/10.
//

#import <Foundation/Foundation.h>

typedef struct BNode{
    struct BNode *left;
    struct BNode *right;
    int value;
}BNode,*BTree;


BOOL SearchBST(BTree T,BNode **lastNode,BTree root,int searchValue){
    *lastNode = root;
    if(T == NULL){
        return NO;
    }
    if(searchValue > T->value){
       return SearchBST(T->right,lastNode,T,searchValue);
    }else if(searchValue < T->value){
        return SearchBST(T->left,lastNode,T,searchValue);
    }else{
        return YES;
    }
}

BOOL InsertBTS(BTree *root,int insertValue){
    

    BNode *p = NULL;
    if(!SearchBST((*root),&p,NULL,insertValue)){
        
        // 创建根结点
        BNode *temp = (BNode *)malloc(sizeof(struct BNode));
        temp->left = NULL;
        temp->right = NULL;
        temp->value = insertValue;
        
        if(p == NULL){
            *root = temp;
        }else{
            if(insertValue > p->value){
                p->right = temp;
            }else{
                p->left = temp;
            }
        }
        return NO;
    }
    return YES;
}

void DisplayTree_Pre(BTree root){
    
    if(root == NULL) return;
    printf("%d,",root->value);
    DisplayTree_Pre(root->left);
    DisplayTree_Pre(root->right);
}

BOOL DeleteBST(BTree *root,int deleValue){
    
    BNode *p = NULL;
    if(SearchBST(*root, &p, *root, deleValue)){
        
        if(p->left&&p->left->value == deleValue){
            BNode *delnode = p->left;
            
            if(delnode->left && delnode->right){
                
                BNode *s = delnode->left;
                BNode *v = NULL;
                while (s) {
                    v = s;
                    s = s->right;
                }
                delnode->value = s->value;
                
                if(v->left){
                    v->right = s->left;
                }else{
                    v->left = s->left;
                }
                
            }
            else if(delnode->left){
                p->left = delnode->left;
            }
            else if(delnode->right){
                p->left = delnode->right;
            }
            else{
                p->left = NULL;
            }
            
            free(delnode);
            
        }
        else if(p->right&&p->right->value == deleValue){
            
            BNode *delnode = p->right;
            if(delnode->left && delnode->right){
                
                BNode *s = delnode->left;
                BNode *v = NULL;
                while (s) {
                    v = s;
                    s = s->right;
                }
                delnode->value = s->value;
                
                if(v->left){
                    v->right = s->left;
                }else{
                    v->left = s->left;
                }
                
            }else if(delnode->left){
                p->right = delnode->left;
            }else if(delnode->right){
                p->right = delnode->right;
            }else{
                p->right = NULL;
            }
            
            free(delnode);
        }
        else{ // 根结点
            BNode *delnode = p;
            
            
        }
        return YES;
    }
    return NO;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BTree tree = NULL;
        InsertBTS(&tree,3);
        InsertBTS(&tree,4);
        InsertBTS(&tree,2);
        InsertBTS(&tree,5);
        InsertBTS(&tree,9);
        InsertBTS(&tree,11);
        InsertBTS(&tree,21);
        
        BNode *lastNode = NULL;
        BOOL succ = SearchBST(tree, &lastNode, tree, 6);
        
        printf("搜索结点3：%s  上一个结点:%d\n",succ?"成功":"失败",lastNode->value);
        
        DeleteBST(&tree, 3);
        
        DisplayTree_Pre(tree);
        printf("\n");
        
    }
    return 0;
}
