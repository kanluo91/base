//
//  ViewController.m
//  29-finishhook
//
//  Created by luokan on 2021/3/22.
//

#import "ViewController.h"
#import "fishhook.h"
#import "Persion.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

// 新
void ctNSLog(NSString *format, ...){
    format = [format stringByAppendingString:@" 被Hook了"];
    sys_nslog(format);
}

void ct_msgSend(id _Nullable self,SEL _Nonnull op, ...){

//    sys_msgSend(self,op);
}

// 保存NSLog的真实地址的指针
static void (*sys_nslog)(NSString *format, ...);


//objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)
static void (*sys_msgSend)(id _Nullable self,SEL _Nonnull op, ...);

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1111----------");
    
    
//    struct rebinding log;
//    log.name = "NSLog";
//    log.replacement = ctNSLog;
//    log.replaced = (void *)&sys_nslog;
    
    struct rebinding msgSend;
    msgSend.name = "objc_msgSend";
    msgSend.replacement = ct_msgSend;
    msgSend.replaced = (void *)&sys_msgSend;
    
    // 定义一个数组！ <#struct rebinding *rebindings#>
    struct rebinding rebs[1] = {msgSend};
    rebind_symbols(rebs, 1);
    
//    NSLog(@"22222----------");
    
    Persion *p = [Persion new];
    [p hello:1];

}


@end
