//
//  ViewController.m
//  11- HitTest01
//
//  Created by luokan on 2021/2/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greenView.weakBtn = self.btn;
    [self.btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) btnAction:(UIButton *) sender{
    NSLog(@"Button   click\n");
    
}

@end
