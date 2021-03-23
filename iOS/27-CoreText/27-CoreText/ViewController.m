//
//  ViewController.m
//  27-CoreText
//
//  Created by luokan on 2021/3/21.
//

#import "ViewController.h"
#import "CustomView.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic,strong) CustomView *ctView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ctView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.ctView.center = self.view.center;
    self.ctView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.ctView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
// 黑白滤镜
   self.view.layer.filters = @[({
        CIFilter *filter = [NSClassFromString(@"CAFilter") filterWithName:@"colorSaturate"];  // 看是 CIFilter，实际上是 CAFilter
        [filter setValue:@0 forKey:@"inputAmount"];
        filter;
    })];
}

@end
