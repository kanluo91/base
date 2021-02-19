//
//  ViewController.m
//  深浅拷贝
//
//  Created by luokan on 2021/2/1.
//

#import "ViewController.h"
#import "Persion.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Persion *p1 = [Persion new];
    p1.name = @"丁丁";
    p1.age = 10;
    
    Persion *p2 = [Persion new];
    p2.name = @"啦啦";
    p2.age = 11;
    
    self.array = @[p1,p2];
    
    NSArray *array2 = [self.array copy];
    NSMutableArray *array3 = [self.array mutableCopy];
    
    NSArray *array4 = [[NSMutableArray alloc] initWithArray:self.array copyItems:YES];
    
    
    ((Persion *)[array2 firstObject]).name = @"迪西";
    
    NSLog(@"P1 = %@\n",self.array);  //0x6000018237a0
    
    NSLog(@"P2 = %@\n",array2);      //0x6000018237a0
    
    NSLog(@"P3 = %@\n",array3);     //0x6000016648a0
    
    NSLog(@"P4 = %@\n",array4);     //新对象  并且里面的数据也是新对象
    
    
}


@end
