//
//  ViewController.m
//  10-CGAffineTransform
//
//  Created by luokan on 2021/2/26.
//

#import "ViewController.h"
#import "RedView.h"

typedef NS_ENUM(NSUInteger, JJMoveDirection) {
    JJMoveDirectionUp,
    JJMoveDirectionDown,
    JJMoveDirectionLeft,
    JJMoveDirectionRight
};

@interface ViewController ()

@property (nonatomic,strong) RedView *targetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.targetView = [RedView new];
    self.targetView.frame = CGRectMake(0, 0, 100, 100);
    self.targetView.backgroundColor = [UIColor redColor];
    self.targetView.center = self.view.center;
    [self.view addSubview:self.targetView];
}

-(void) move:(JJMoveDirection)direction{
    
    switch (direction) {
        case JJMoveDirectionUp:
            
            self.targetView.transform  = CGAffineTransformTranslate(self.targetView.transform, 0, -10);
            break;
        case JJMoveDirectionDown:
            
            self.targetView.transform  = CGAffineTransformTranslate(self.targetView.transform, 0, 10);
            
            break;
        case JJMoveDirectionLeft:
            self.targetView.transform  = CGAffineTransformTranslate(self.targetView.transform, -10, 0);
            
            break;
        case JJMoveDirectionRight:
            
            self.targetView.transform  = CGAffineTransformTranslate(self.targetView.transform, 10, 0);
            
            break;
            
        default:
            break;
    }
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    [self move:JJMoveDirectionUp];
//    
//}


@end
