//
//  ViewController.m
//  TestSel2
//
//  Created by luokan on 2021/1/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(int) getMyAge:(NSString *)age{
    return 21;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    int age = [self performSelector:@selector(getMyAge:) withObject:@"dads"];
    
    printf("age = %d\n",age);
}


@end
