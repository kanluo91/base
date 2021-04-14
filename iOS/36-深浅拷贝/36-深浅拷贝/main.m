//
//  main.m
//  36-深浅拷贝
//
//  Created by luokan on 2021/3/31.
//

#import <Foundation/Foundation.h>
void test1(void);
void test2(void);
void test3(void);

int main(int argc, const char * argv[]) {

//    test1();
//    test2();
    test3();
    
    return 0;
}

#pragma mark -
#pragma mark 1. nsstring 复制
void test1(void){
    NSString *st = @"我是字符串";
    
    NSString *st1 = [st copy];
    NSString *st2 = [st mutableCopy];
    
    NSLog(@"\nst = %p\nst1 = %p\nst2 = %p\n",st,st1,st2);
    // 改变st2 是不会影响 str str1的值
    st2 = @"2";
    
    NSLog(@"\nst = %@\nst1 = %@\nst2 = %@\n",st,st1,st2);
}

void test2(){
    NSMutableString *str = [NSMutableString stringWithFormat:@"%d",1];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:str,@"1",@"2",@"3",nil];
    
    NSMutableArray *arrayT = [[NSMutableArray alloc] initWithArray:array copyItems:YES];
    
    NSArray *array1 = [array copy];
    NSMutableArray *array2 = [array mutableCopy];
    
    [[array1 firstObject] appendString:@"++++"];
    
    [[array2 firstObject] appendString:@"---"];
//   结果都是下面
//    "1++++---",
//    1,
//    2,
//    3
//    arrayT = (
//        1,
//        1,
//        2,
//        3
//    )
    NSLog(@"\narray = %@\n",array);
    NSLog(@"\narray1 = %@\n",array1);
    NSLog(@"\narray2 = %@\n",array2);
    NSLog(@"\narrayT = %@\n",arrayT);
    
}

void test3()
{
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0;i<10000;i++){
        [array addObject:[NSNumber numberWithInt:i]];
    }
    for(int i = 0;i<10000;i++){
        if(i%2==0){
            [array removeObjectAtIndex:i];
        }
    }
    
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if(idx%2 == 0){
//            [array removeObject:obj];
//        }
//    }];
    
    NSLog(@"array = %@\n",array);

    
}
