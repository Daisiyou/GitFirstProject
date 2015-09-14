//
//  Created by marco on 25/05/13.
//
//
//


#import <Foundation/Foundation.h>


@interface MSSlideNavigationController : UINavigationController
@end

@interface UIViewController (MSSlideNavigationControllerSupport)
- (BOOL)supportSlideGoBack;
@end