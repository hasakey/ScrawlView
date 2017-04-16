//
//  PaintView.m
//  ScrawlView
//
//  Created by 同筑科技 on 2017/4/14.
//  Copyright © 2017年 well. All rights reserved.
//

#import "PaintView.h"

@interface PaintView()
@property(nonatomic,strong)NSMutableArray *pathArray;

@end

@implementation PaintView
-(NSMutableArray *)pathArray
{
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];
    
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    [currentPath moveToPoint:startPoint];
    [self.pathArray addObject:currentPath];
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    UIBezierPath *currentPath = [self.pathArray lastObject];
    [currentPath addLineToPoint:point];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}


-(void)drawRect:(CGRect)rect
{
    [[UIColor redColor] set];
    for (UIBezierPath *path in self.pathArray) {
        
        [path stroke];
    }
}
-(void)clear
{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}
-(void)back
{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

@end
