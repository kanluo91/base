//
//  ViewController.m
//  30-bounds
//
//  Created by luokan on 2021/3/22.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *view1;

@property (nonatomic,strong) UIView *view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
//
//    [self.view1 setBounds:CGRectMake(-30, -30, 200, 200)];

    self.view1.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.view1];//添加到self.view

    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(self.view1.frame),NSStringFromCGRect(self.view1.bounds));

    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

    self.view2.backgroundColor = [UIColor yellowColor];

    [self.view1 addSubview:self.view2];//添加到view1上,[此时view1坐标系左上角起点为(-30,-30)]

    NSLog(@"view2 frame:%@========view2 bounds:%@",NSStringFromCGRect(self.view2.frame),NSStringFromCGRect(self.view2.bounds));
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view1 setBounds:CGRectMake(-30, -30,200,200)];
    
    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(self.view1.frame),NSStringFromCGRect(self.view1.bounds));
    
//    self.view2.bounds = CGRectMake(50, 50, 150, 150);
}


@end
