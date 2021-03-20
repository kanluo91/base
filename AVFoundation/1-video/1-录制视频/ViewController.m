//
//  ViewController.m
//  1-录制视频
//
//  Created by luokan on 2021/3/19.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic,strong) AVCaptureDevice *captureDevice;
@property (nonatomic,strong) AVCaptureSession *captureSession;
@property (nonatomic,strong) AVCaptureConnection *captureConn;
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 权限
    if([self _checkAuthStatus] == NO) return;
    
    // 2. session
    self.captureSession = [[AVCaptureSession alloc] init];
    
        // 2.1 设置质量
    if([self.captureSession canSetSessionPreset:AVCaptureSessionPresetHigh]){
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh;
    }else{
        self.captureSession.sessionPreset = AVCaptureSessionPreset1280x720;
    }
    
    AVCaptureDeviceDiscoverySession *session = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInDualCamera] mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
    
    // 3. 找设备
    for(AVCaptureDevice * device in session.devices){
        if([device hasMediaType:AVMediaTypeVideo] && device.position == AVCaptureDevicePositionBack){
            self.captureDevice = device;
            break;
        }
    }

   // 4. 添加输入
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice error:NULL];
    if([self.captureSession canAddInput:input]){
        [self.captureSession addInput:input];
    }
    
    // 5. 添加输出
    AVCaptureMovieFileOutput *outPut = [[AVCaptureMovieFileOutput alloc] init];
    if([self.captureSession canAddOutput:outPut]){
        [self.captureSession addOutput:outPut];
    }
    
    // 6. connection
    self.captureConn =[outPut connectionWithMediaType:AVMediaTypeVideo];
    
    
    // 7. 预览
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    self.previewLayer.bounds = self.view.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.view.layer addSublayer:self.previewLayer];
}

#pragma mark -
#pragma mark 1. 校验权限
//AVAuthorizationStatusNotDetermined = 0,
//AVAuthorizationStatusRestricted    = 1,
//AVAuthorizationStatusDenied        = 2,
//AVAuthorizationStatusAuthorized    = 3,
-(BOOL) _checkAuthStatus{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized){
        NSLog(@"步骤1： 有权限 !!!!\n");
        return YES;
    }else{
        NSLog(@"步骤1： 没有有权限 !!!!\n");
        return NO;
    }
}

- (IBAction)pauseAction:(id)sender {
    [self.captureSession stopRunning];
}

- (IBAction)recordAction:(id)sender {
    
    [self.captureSession startRunning];
}
@end
