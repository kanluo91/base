//
//  ViewController.m
//  25-UI方法
//
//  Created by luokan on 2021/3/18.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()

@property (nonatomic,strong) CustomView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ctView = [[CustomView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.ctView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    self.ctView.frame =CGRectMake(0, 0, 100, 100);
    
    [self.ctView setNeedsLayout]; // 标记刷新
    
    [self.ctView layoutIfNeeded]; // 立即刷新
}

-(void)viewWillLayoutSubviews{
    
}


@end
