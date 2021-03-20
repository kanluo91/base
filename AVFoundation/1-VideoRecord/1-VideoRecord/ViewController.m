//
//  ViewController.m
//  1-录制视频
//
//  Created by luokan on 2021/3/19.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVCaptureFileOutputRecordingDelegate,AVCaptureMetadataOutputObjectsDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>
@property (nonatomic,strong) UIButton *recordBtn;
@property (nonatomic,strong) UIButton *pauseBtn;

@property (nonatomic,strong) AVCaptureSession *session;    // session

@property (nonatomic,strong) AVCaptureDevice *activeVideoDevice; // 视频设备
@property (nonatomic,strong) AVCaptureDevice *activeAudioDevice; // 音频设备
@property (nonatomic,strong) AVCaptureDeviceInput * activeInput;  // 当前正在活跃的设备输入

@property (nonatomic,strong) AVCaptureStillImageOutput *imageOutput;     // 图片输出
@property (nonatomic,strong) AVCaptureMovieFileOutput *videoOutput; // 视频输出

@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation ViewController

-(void) initUI{
    self.recordBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.recordBtn.backgroundColor = [UIColor greenColor];
    [self.recordBtn setTitle:@"录制" forState:UIControlStateNormal];
    [self.view addSubview:self.recordBtn];
    [self.recordBtn addTarget:self action:@selector(recordAction:) forControlEvents:UIControlEventTouchUpInside];
}

// 寻找指定的摄像头
-(AVCaptureDevice *) cameraWithPosition:(AVCaptureDevicePosition) pos{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *d in devices) {
        if(d.position == pos){
            return d;
        }
    }
    return nil;
}

// 是否支持自动对焦
-(BOOL) isSupportFocus{
    if(self.activeVideoDevice && [self.activeVideoDevice isFocusModeSupported:AVCaptureFocusModeAutoFocus]){
        return YES;
    }else{
        return NO;
    }
}

// 是否支持曝光
-(BOOL) isSupportExpore{
    if(self.activeVideoDevice && [self.activeVideoDevice isExposureModeSupported:AVCaptureExposureModeAutoExpose]){
        return YES;
    }else{
        return NO;
    }
}

-(void) focusAtPoint:(CGPoint) point{
    if(self.activeVideoDevice){
        if([self.activeVideoDevice lockForConfiguration:NULL]){
            self.activeVideoDevice.focusMode = AVCaptureFocusModeAutoFocus;
            self.activeVideoDevice.focusPointOfInterest = point;
            [self.activeVideoDevice unlockForConfiguration];
        }else{
            NSLog(@"Focus 失败~~~\n");
        }
    }
}

-(void) swithCamera{
    if(self.activeInput && self.activeInput.device){
        AVCaptureDevicePosition pos = self.activeInput.device.position;
        AVCaptureDevice *newDevice;
        if(pos == AVCaptureDevicePositionFront){
            newDevice  = [self cameraWithPosition:AVCaptureDevicePositionBack];
        }else{
            newDevice  = [self cameraWithPosition:AVCaptureDevicePositionFront];
        }
        AVCaptureDeviceInput *newinput = [AVCaptureDeviceInput deviceInputWithDevice:newDevice error:NULL];
        if(newinput){
            [self.session beginConfiguration];            ///-------------- 和下面commit 成对出现
            [self.session removeInput:self.activeInput];
            if([self.session canAddInput:newinput]){ // 添加新的设备
                [self.session addInput:newinput];
                self.activeInput = newinput;
                self.activeVideoDevice = newinput.device;
            }else{ // 移除失败的情况
                [self.session addInput:self.activeInput];
            }
            [self.session commitConfiguration];
        }
    }
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

#pragma mark -
#pragma mark 1. 设置Session
-(void)configSession{
    // 2. session
    self.session = [[AVCaptureSession alloc] init];
    
    // 2.1 设置分辨率
    if([self.session canSetSessionPreset:AVCaptureSessionPresetHigh]){
        self.session.sessionPreset = AVCaptureSessionPresetHigh;
    }else{
        self.session.sessionPreset = AVCaptureSessionPreset1280x720;
    }
}

#pragma mark -
#pragma mark 2. 设置输入
-(void)configVideoInput{
    // 3. 设备对象
    self.activeVideoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInDualCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionFront];
   // 4. 设备session 的设备输入
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:self.activeVideoDevice error:NULL];
    if([self.session canAddInput:videoInput]){
        [self.session addInput:videoInput];
        self.activeInput = videoInput;
    }
}

-(void) configAudioInput{
    self.activeAudioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:self.activeAudioDevice error:NULL];
    if([self.session canAddInput:audioInput]){
        [self.session addInput:audioInput];
    }
}

#pragma mark -
#pragma mark 3. 设置输出
-(void) configImageOutput{
    self.imageOutput  = [[AVCaptureStillImageOutput alloc] init];
    self.imageOutput.outputSettings = @{AVVideoCodecKey:AVVideoCodecTypeJPEG};
    if([self.session canAddOutput:self.imageOutput]){
        [self.session addOutput:self.imageOutput];
    }
}

-(void) configVideoOutput{
    self.videoOutput  = [[AVCaptureMovieFileOutput alloc] init];
    if([self.session canAddOutput:self.videoOutput]){
        [self.session addOutput:self.videoOutput];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];

    // 1. 权限
    if([self _checkAuthStatus] == NO){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    
        }];
        return;
    }
    
    [self configSession];
    [self configVideoInput];
    [self configAudioInput];

    // 5. 添加输出
    AVCaptureMovieFileOutput *outPut = [[AVCaptureMovieFileOutput alloc] init];
    if([self.session canAddOutput:outPut]){
        [self.session addOutput:outPut];
    }
    
    // 7. 预览
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.previewLayer.bounds = self.view.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.view.layer addSublayer:self.previewLayer];
}

-(void) 拍照{
    
    AVCaptureConnection *conn = [self.imageOutput connectionWithMediaType:AVMediaTypeVideo];
    
//    if(conn.isVideoOrientationSupported){
////        conn.videoOrientation
//    }
    
    
    [self.imageOutput captureStillImageAsynchronouslyFromConnection:conn completionHandler:^(CMSampleBufferRef  _Nullable imageDataSampleBuffer, NSError * _Nullable error) {
       
        NSData *data = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        
        
        
        }
     ];
    
    
}

-(void) 拍视频{

    if(self.videoOutput && self.videoOutput.isRecording){  // 正在拍摄
        
    }else{ // 当前没有拍摄
        AVCaptureConnection *conn = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo];
        if([conn isVideoOrientationSupported]){
//            conn.videoOrientation = xxxx;
        }
        
        // 是否支持视频稳定
        if([conn isVideoStabilizationSupported]){
            conn.enablesVideoStabilizationWhenAvailable = YES;
        }
        
        // 开始录制  如果是直播/小视频  -> 捕抓到视频信息 - 压缩
        
        // 这里保存的是一个QuickTime 格式的视频
        [self.videoOutput startRecordingToOutputFileURL:[self uniqueURL] recordingDelegate:self];
        
    }
}


-(NSURL *) uniqueURL{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *dirPath = [fm temporaryDirectory];
    if(dirPath){
        NSString *fp = [dirPath stringByAppendingPathComponent:@"aaa.mov"];
        return [NSURL URLWithString:fp];
    }
    return nil;
}

- (void)pauseAction:(id)sender {
    if([self.session isRunning]){
        [self.session stopRunning];
    }
}

- (void)recordAction:(id)sender {
    if(![self.session isRunning]){
        [self.session startRunning];
    }
}
@end

