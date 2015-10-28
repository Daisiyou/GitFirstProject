//
//  SABaseViewController.m
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "BaseViewController.h"
#import "UIWindow+Additions.h"
#import "AppDelegate.h"

@interface BaseViewController () <UIAlertViewDelegate>

{
    UIView *_tempView;//临时存储需修改视图
    CGRect _tempFrame;//用于调整键盘高度时的临时存储
    CGFloat _contentOffsetY;
    BOOL _autoScroll;
}

@end

@implementation BaseViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.type = EBaseViewController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MS_DEFAULT_BACKGROUND_COLOR;
    
    _autoScroll = YES;

    _contentView = [[BaseScrollView alloc] initWithFrame:CGRectMake(0, MS_NAVBAR_HEIGHT_WITH_STATUS_BAR, MS_SCREEN_WIDTH, MS_SCREEN_HEIGHT - MS_NAVBAR_HEIGHT_WITH_STATUS_BAR - MS_TABBAR_HEIGHT)];
    _contentView.backgroundColor = MS_DEFAULT_BACKGROUND_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initNavButtons];
}



- (void)dealloc
{
    [self removeNotificationAndKVO];
    
    [SVProgressHUD dismiss];
}

- (void)initNavButtons
{
    
}

- (void)scrollUp:(CGFloat)height{
    //先还原视图
    if (_tempView) {
        _tempView.frame = _tempFrame;
        _tempView = nil;
    }
    
    UIView *responder = [self.view.window findFirstResponder];
    
    //计算contentView相对于Window的Frame
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    CGRect contentFrame = [delegate.window convertRect:self.contentView.frame fromView:self.contentView.superview];
    CGRect rect = [self.contentView convertRect:responder.frame fromView:responder.superview];
    
    //计算可用于显示高度
    CGFloat margin = 10;//

    CGFloat showH = MS_SCREEN_HEIGHT - height - contentFrame.origin.y;
    
    CGFloat distance = self.contentView.contentOffset.y; //当前偏移
    _contentOffsetY = distance;
    BOOL needChange = NO;
    
    if (rect.origin.y + rect.size.height > showH - margin) {//rect.origin.y + rect.size.height - distance//计算当前偏移
        //遮挡
        if (rect.size.height > showH - margin) {
            if ([NSStringFromClass([responder class]) isEqualToString:@"UIWebBrowserView"]) {
                return;//不对webview进行调整
            }
            //无法完全展示
            if (nil == _tempView || ![_tempView isEqual:responder]) {
                _tempView = responder;
                _tempFrame = responder.frame;
            }
            
            distance = rect.origin.y - margin/2.0;
            needChange = YES;
        }else {
            distance = rect.origin.y + rect.size.height - showH + margin;
        }
    }else {
        //未遮挡
        return;
    }
    
    if (distance < 0) {
        return;
    }
    
    [self.contentView setContentOffset:CGPointMake(0, distance) animated:YES];
    
    if (needChange) {
        //临时修改当前视图高度
        responder.frame = CGRectMake(responder.frame.origin.x, responder.frame.origin.y, rect.size.width, showH - margin);
    }
}

- (void)scrollBack{
    //还原视图frame
    if (_tempView) {
        _tempView.frame = _tempFrame;
        _tempView = nil;
    }
    
    if (_contentView.contentOffset.y > 0) {
        [_contentView setContentOffset:CGPointMake(0, _contentOffsetY) animated:YES];
    }
    
}

#pragma mark UIKeyboard Manage
- (void)_keyboardWillShow:(NSNotification *)notification{
    //先计算键盘高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    if (_autoScroll) {
        [self scrollUp:keyboardRect.size.height];
    }
}

- (void)_keyboardWillHide{
    if (_autoScroll) {
        [self scrollBack];
    }
}

- (void)registNotificationAndKVO
{
    
}

-(void)removeNotificationAndKVO
{
    
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
