//
//  ZYDrawView.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/11.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "ZYDrawView.h"

@interface ZYDrawPathModel : NSObject<NSCoding>
@property (nonatomic, strong) UIColor *pathColor;
@property (nonatomic, strong) UIBezierPath *bezierPath;
@end

@implementation ZYDrawPathModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        [aDecoder decodeObjectForKey:@"pathColor"];
        [aDecoder decodeObjectForKey:@"bezierPath"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.bezierPath forKey:@"bezierPath"];
    [aCoder encodeObject:self.pathColor forKey:@"pathColor"];
}

@end

@interface ZYDrawView ()
@property (nonatomic, strong) NSMutableArray<ZYDrawPathModel *> *drawPaths;
@end

@implementation ZYDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.lineWidth = 2;
    self.lineColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 创建pathModel
    ZYDrawPathModel *model = [ZYDrawPathModel new];
    model.pathColor = self.lineColor;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath setLineWidth:self.lineWidth];
    [bezierPath moveToPoint:[[touches anyObject] locationInView:self]];
    model.bezierPath = bezierPath;
    [self.drawPaths addObject:model];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZYDrawPathModel *model = self.drawPaths.lastObject;
    [model.bezierPath addLineToPoint:[[touches anyObject] locationInView:self]];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.drawEable == NO) {
        return;
    }
    
    for (ZYDrawPathModel *model in self.drawPaths) {
        [model.pathColor setStroke];
        [model.bezierPath stroke];
    }
}

- (void)back
{
    [self.drawPaths removeLastObject];
    [self setNeedsDisplay];
}

- (void)clear
{
    [self.drawPaths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)reset
{
    [self setUp];
    [self clear];
}

- (UIImage *)getImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIColor whiteColor] setFill];
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (NSMutableArray<ZYDrawPathModel *> *)drawPaths
{
    if (_drawPaths == nil) {
        _drawPaths = [NSMutableArray<ZYDrawPathModel *> array];
    }
    return _drawPaths;
}

@end
