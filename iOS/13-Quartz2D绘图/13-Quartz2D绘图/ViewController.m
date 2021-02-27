//
//  ViewController.m
//  13-Quartz2D绘图
//
//  Created by luokan on 2021/2/27.
//

#import "ViewController.h"
#import "CustomView.h"
#import "ProgressView.h"

@interface ViewController ()

@property (nonatomic,strong) CustomView *ctView;

@property (nonatomic,strong) ProgressView *progressView;

@property (nonatomic,strong) UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ctView = [CustomView new];
    
    self.ctView.frame = CGRectMake(100, 100, 300, 300);
    
    [self.view addSubview:self.ctView];
    
    self.progressView = [ProgressView new
                         ];
    self.progressView.backgroundColor = [UIColor whiteColor];
    self.progressView.frame = CGRectMake(100, 400, 300, 300);
    
    [self.view addSubview:self.progressView];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 750, 400, 50)];
    self.slider.maximumValue = 1;
    self.slider.minimumValue = 0;
    [self.view addSubview:self.slider];
    [self.slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];

}

-(void) sliderValueChange:(UISlider *) slider{
    
    self.progressView.progress = slider.value;
    
}

@end
