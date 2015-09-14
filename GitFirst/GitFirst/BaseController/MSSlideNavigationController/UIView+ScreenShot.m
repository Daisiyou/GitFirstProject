//
//  Created by marco on 25/05/13.
//
//
//


#import "UIView+ScreenShot.h"
#import "QuartzCore/QuartzCore.h"



@implementation UIView (ScreenShot)

+ (UIImage *)screenShotForView:(UIView *)view
{
    return [view screenShot];
}

- (UIImage *)screenShot
{
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(NULL, size.width * scale, size.height * scale, 8, 4*size.width * scale, colorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast);
    CGContextScaleCTM(ctx, scale, scale);
    CGContextTranslateCTM(ctx, 0, size.height);
    CGContextScaleCTM(ctx, 1, -1);
    [self.layer renderInContext: ctx];
    UIViewController *vc = (id)self.nextResponder;
    
    while (vc&&![vc isKindOfClass:[UIViewController class]]) {
        vc = (id)vc.nextResponder;
    }
    
    if (vc) {
        if(!vc.hidesBottomBarWhenPushed) {
            UITabBarController *tabBarController = (UITabBarController*)vc.tabBarController;
            if ([tabBarController isKindOfClass:[UITabBarController class]]) {
                CGContextTranslateCTM(ctx, 0, self.height - MS_TABBAR_HEIGHT);
                [tabBarController.tabBar.layer renderInContext:ctx];
            }
        }
    }
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(ctx);
    
    return image;
}

@end
