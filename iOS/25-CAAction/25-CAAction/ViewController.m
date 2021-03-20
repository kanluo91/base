//
//  ViewController.m
//  25-CAAction
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
    
    self.ctView = [[CustomView alloc
                    ] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.ctView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.ctView];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.ctView.frame = CGRectMake(0, 0, 200, 200);
//    [self.ctView setNeedsDisplay];
//    self.ctView.backgroundColor = [UIColor greenColor];
}

@end
