//
//  ViewController.m
//  23-Runtime坑
//
//  Created by luokan on 2021/3/17.
//

#import "ViewController.h"
#import "JJPersion.h"
#import "JJStudent.h"
#import "NSObject+Swizzling.h"

@interface ViewController ()
@property (nonatomic,strong) JJPersion *p;
@property (nonatomic,strong) JJStudent *st;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSObject swizzleCls:[JJStudent class] Sel:@selector(persionInstanceMethod) WithSel:@selector(studentInstanceMethod)];
    self.p = [JJPersion new];
    self.st = [JJStudent new];
    self.p.name = @"231";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 父类不动
    [self.p persionInstanceMethod];
    
    // 子类修改了
    [self.st persionInstanceMethod];
    [self.st studentInstanceMethod];
    extern int age; //申明使用的是全局变量age
    NSLog(@"age = %d",age);
    age = 20;
    NSLog(@"age = %d",age);
}

@end
