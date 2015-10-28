//
// Created by chenxu on 13-6-25.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Additions)
/**
 * Searches the view hierarchy recursively for the first responder, starting with this window.
 */
- (UIView*)findFirstResponder;

/**
 * Searches the view hierarchy recursively for the first responder, starting with topView.
 */
- (UIView*)findFirstResponderInView:(UIView*)topView;


@end
