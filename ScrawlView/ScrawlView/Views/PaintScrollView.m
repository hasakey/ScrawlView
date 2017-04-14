//
//  PaintScrollView.m
//  ScrawlView
//
//  Created by 同筑科技 on 2017/4/14.
//  Copyright © 2017年 well. All rights reserved.
//

#import "PaintScrollView.h"

@implementation PaintScrollView

/**
 屏蔽ScrollView的单指事件，只允许双指移动或缩放等
 @param gestureRecognizer 事件
 @return 返回是否
 */
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        if (gestureRecognizer.numberOfTouches == 1) {
            return false;
        }
    }
    return true;
}

@end
