//
//  UIViewController+UIRectEdge.m
//  MinShengEcPjTemplate
//
//  Created by iBcker on 13-10-28.
//
//

#import "UIViewController+UIRectEdge.h"

#import <objc/runtime.h>

@implementation UIViewController (UIRectEdge)

static const char *kWantsFullScreenLayoutKey;

- (BOOL)wantsFullScreenLayout
{
    id v=objc_getAssociatedObject(self,&kWantsFullScreenLayoutKey);
    if (v!=nil) {
        return [v boolValue];
    }else{
        if ([NSStringFromClass(self.class) hasPrefix:@"BI"]) {
            // 解决百度输入法在6.0下候选框拉伸的问题
            return NO;
        }
        return YES;
    }
}

- (void)setWantsFullScreenLayout:(BOOL)b
{
    objc_setAssociatedObject(self, &kWantsFullScreenLayoutKey, @(b), OBJC_ASSOCIATION_ASSIGN);
}

static const char *kAutomaticallyAdjustsScrollViewInsetsKey;

- (BOOL)automaticallyAdjustsScrollViewInsets
{
    id v=objc_getAssociatedObject(self,&kAutomaticallyAdjustsScrollViewInsetsKey);
    if (v!=nil) {
        return [v boolValue];
    }else{
        return NO;
    }
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)b
{
    objc_setAssociatedObject(self, &kAutomaticallyAdjustsScrollViewInsetsKey, @(b), OBJC_ASSOCIATION_ASSIGN);
}

static const char *kEdgesForExtendedLayoutKey;

- (UIRectEdge)edgesForExtendedLayout
{
    id v=objc_getAssociatedObject(self,&kEdgesForExtendedLayoutKey);
    if (v!=nil) {
        return [v integerValue];
    }else{
        static NSArray *ignore;
        if (!ignore){
            ignore=@[@"PUUIAlbumListViewController",@"PUUIPhotosAlbumViewController"];
        }
        if ([ignore containsObject:NSStringFromClass([self class])]) {
            return UIRectEdgeNone;
        }else{
            return UIRectEdgeAll;
        }
    }
}

- (void)setEdgesForExtendedLayout:(UIRectEdge)rect
{
    objc_setAssociatedObject(self, &kEdgesForExtendedLayoutKey, @(rect), OBJC_ASSOCIATION_ASSIGN);
}

@end
