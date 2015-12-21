//
//  DSYScrolloView.m
//  GitFirst
//
//  Created by Daisiyou on 15/12/21.
//  Copyright © 2015年 Daisiyou. All rights reserved.
//

#import "DSYScrolloView.h"

@implementation DSYScrolloView

-(instancetype)init{
    
    
    
    if (self) {
        
    }
    return self;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"x: %f, y: %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

@end
