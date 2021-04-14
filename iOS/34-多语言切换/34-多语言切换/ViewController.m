//
//  ViewController.m
//  34-多语言切换
//
//  Created by luokan on 2021/3/30.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel  =[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.titleLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.titleLabel];
    
    self.titleLabel.text = NSLocalizedString(@"t_label_title", "没有获取到");
}


@end
