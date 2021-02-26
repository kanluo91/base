//
//  ViewController.m
//  12-hitTest2
//
//  Created by luokan on 2021/2/26.
//

#import "ViewController.h"
#import "RedView.h"
#import "GreenView.h"

@interface ViewController ()

@property (nonatomic,strong) RedView *redView;

@property (nonatomic,strong) GreenView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [RedView new];
    self.greenView = [GreenView new];
    
    self.redView.frame  = CGRectMake(100, 100, 200, 50);
    self.redView.center = self.view.center;
    
    
    self.greenView.frame = CGRectMake(50, -80, 100, 100);
    
    [self.view addSubview:self.redView];
    
    [self.redView addSubview:self.greenView];
    
}


@end
