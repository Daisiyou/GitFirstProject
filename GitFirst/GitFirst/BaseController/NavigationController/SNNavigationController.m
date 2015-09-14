//
//  SNNavigationController.m
//  MinShengEcPjTemplate
//
//  Created by ibcker on 13-12-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "SNNavigationController.h"
#import <objc/runtime.h>

@interface SNNavigationController()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)UIImageView *navColorOverly;

@end

@implementation SNNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self=[super initWithRootViewController:rootViewController];
    if (self) {
        //        [self.navigationBar setTranslucent:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.opaque = NO;
    if (OS_VERSION>=5) {
        NSArray *vs=[self.navigationBar subviews];
        Class clazz;
        if ((int)OS_VERSION==5) {
            clazz=NSClassFromString(@"UINavigationBarBackground");
        }else{
            clazz=NSClassFromString(@"_UINavigationBarBackground");
        }
        for (UIView *v in vs) {
            if ([v isKindOfClass:clazz]) {
                v.hidden=YES;
                break;
            }
        }
    }
    [self setNavBarStyle:UI7NavBarSytleTransparent];
    [self.navigationBar insertSubview:self.navColorOverly atIndex:0];
    [self.navigationBar setTranslucent:YES];
    
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (UIImageView *)navColorOverly
{
    if (!_navColorOverly) {
        if (!_navColorOverly) {
            _navColorOverly=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height+20)];
            _navColorOverly.frame=CGRectMake(0, -20, self.navigationBar.frame.size.width, MS_NAVBAR_HEIGHT_WITH_STATUS_BAR);
            _navColorOverly.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        }
    }
    return _navColorOverly;
}
- (void)setNavBarStyle:(UI7NavBarSytle)style animated:(BOOL)animated
{
    if (_navBarStyle==style) {
        return;
    }
    switch (style) {
        case UI7NavBarSytleLight:
            [self setNavBarBgWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] animated:animated];
            break;
        case UI7NavBarSytleBlack:
            [self setNavBarBgWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] animated:animated];
            break;
        case UI7NavBarSytleTransparent:
            [self setNavBarBgWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0] animated:animated];
            break;
        default: //UI7NavBarSytleDark:
            [self setNavBarBgWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8] animated:animated];
            break;
    }
    _navBarStyle=style;
}


- (void)setNavBarStyle:(UI7NavBarSytle)style
{
    [self setNavBarStyle:style animated:NO];
}

- (void)setNavBarBgWithColor:(UIColor *)cl animated:(BOOL)animated
{
    _navBarStyle=UI7NavBarSytleColor;
    [_navColorOverly.layer removeAnimationForKey:kCATransitionFade];
    if (animated) {
        CATransition *animate  = [CATransition animation];
        animate.type = kCATransitionFade;
        animate.duration = 0.3f;
        [_navColorOverly.layer addAnimation:animate forKey:kCATransitionFade];
    }
    UIGraphicsBeginImageContext(CGSizeMake(2, 2));
    [cl set];
    UIRectFill(CGRectMake(0, 0, 2, 2));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.navColorOverly.image=[image stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    
    //Modified by FeiGuangpu
    UIImageView* navBottomLine = [[UIImageView alloc]init];
    navBottomLine.backgroundColor = [UIColor colorWithHexString:@"#dedfe0"];
    navBottomLine.height = 1;
    navBottomLine.width = self.navColorOverly.width;
    navBottomLine.left = 0;
    navBottomLine.bottom = self.navColorOverly.height;
    [self.navColorOverly addSubview:navBottomLine];
}

- (void)setNavBarBgWithColor:(UIColor *)cl
{
    [self setNavBarBgWithColor:cl animated:NO];
}

- (void)setNavBarBgWithImage:(UIImage *)image
{
    _navBarStyle=UI7NavBarSytleImage;
    self.navColorOverly.image=image;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // fix 'nested pop animation can result in corrupted navigation bar'
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
@implementation UINavigationBar (CustomImage)
- (void)drawRect:(CGRect)rect {}
@end

/// About Custom layout @see UINavigationBar(TitleViewAlignment)