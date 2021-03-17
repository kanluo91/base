//
//  JJPersion.m
//  23-Runtime坑
//
//  Created by luokan on 2021/3/17.
//

#import "JJPersion.h"

@implementation JJPersion
//@dynamic name;
@synthesize name = _pName;

int age = 10;

-(void) persionInstanceMethod{
    NSLog(@"Persion Instance Method Invoke %@",_pName);
}

+(void) persionClassMethod{
    NSLog(@"Persion Class Method Invoke");
}

@end
