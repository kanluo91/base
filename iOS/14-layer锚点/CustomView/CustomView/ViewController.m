//
//  ViewController.m
//  CustomView
//
//  Created by luokan on 2021/3/4.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (nonatomic,strong) CustomView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ctView = [CustomView new];
    self.ctView.frame = CGRectMake(0, 0, 200, 200);
    self.ctView.center = self.view.center;
    self.ctView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.ctView];
    
//    self.ctView.layer.anchorPoint = CGPointZero;
    NSLog(@"position =  %@\n",NSStringFromCGPoint(self.ctView.layer.position));  // {207, 448}
    NSLog(@"anchorPoint = %@\n",NSStringFromCGPoint(self.ctView.layer.anchorPoint)); // {207, 448}
    
    
//    self.ctView.center
    
}


@end
