//
//  QRCodeController.m
//  GitFirst
//
//  Created by Daisiyou on 15/11/9.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "QRCodeController.h"
#import <AVFoundation/AVFoundation.h>


@interface QRCodeController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    long num;
    
    UILabel* messageLabel;
}
@end

@implementation QRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;

    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式
    output.metadataObjectTypes=@[
//                                 AVMetadataObjectTypeUPCECode,
//                                 AVMetadataObjectTypeCode39Code,
//                                 AVMetadataObjectTypeCode39Mod43Code,
//                                 AVMetadataObjectTypeEAN13Code,
//                                 AVMetadataObjectTypeEAN8Code,
//                                 AVMetadataObjectTypeCode93Code,
                                 AVMetadataObjectTypeCode128Code,
//                                 AVMetadataObjectTypePDF417Code,
                                 AVMetadataObjectTypeQRCode,
//                                 AVMetadataObjectTypeAztecCode,
//                                 AVMetadataObjectTypeInterleaved2of5Code,
//                                 AVMetadataObjectTypeITF14Code,
//                                 AVMetadataObjectTypeDataMatrixCode
                                 ];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;
    layer.frame = CGRectMake(50, 100, self.view.width - 100,self.view.width - 100 );
    layer.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer insertSublayer:layer atIndex:0];
    self.view.backgroundColor = [UIColor clearColor];
    
    
    messageLabel = [ControlFactory createLabel:@"message" backgroundColor:[UIColor clearColor] font:[UIFont systemFontOfSize:14.0f] textColor:[UIColor redColor] textAlignment:(NSTextAlignmentCenter) lineBreakMode:(NSLineBreakByCharWrapping)];
    [self.view addSubview:messageLabel];
    messageLabel.numberOfLines = 0;
    
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.mas_equalTo(self.view.width - 100 + 100);
        make.right.equalTo(@-10);
    }];
    //开始捕获
    [session startRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{

    if (metadataObjects.count>0) {
        [session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        messageLabel.text = metadataObject.stringValue;
        NSLog(@"%@",metadataObject.type);
        NSLog(@"%ld", num++);
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
