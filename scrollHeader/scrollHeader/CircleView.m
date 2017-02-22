//
//  CircleView.m
//  scrollHeader
//
//  Created by yuzi on 17/1/11.
//  Copyright © 2017年 yuzi. All rights reserved.
//

#import "CircleView.h"

#define DeviceHeight [UIScreen mainScreen].bounds.size.height
#define DeviceWidth [UIScreen mainScreen].bounds.size.width

#define Trans(x)  x*0.5

@interface CircleView (){
    CGFloat offsetY;
}


//@property(assign,nonatomic)CGPoint controlPoint;
@end

@implementation CircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setControlPoint:(CGFloat)point{
    offsetY = point;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)myView

{
    [super drawRect:myView];
   
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    CGFloat y = offsetY;
    if(y>-64){
        y=-64;
    }else if(y<-Trans(360)){
        y=-Trans(360);
    }
    
    CGFloat height = Trans(260)+y+64;
    
    CGContextMoveToPoint(ctx, 0, height);
    CGContextAddQuadCurveToPoint(ctx, DeviceWidth/2, -64-y, DeviceWidth, height);
    CGContextAddLineToPoint(ctx, DeviceWidth, DeviceHeight);
    CGContextAddLineToPoint(ctx, 0, DeviceHeight);
    CGContextAddLineToPoint(ctx, 0, height);
    [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] set];
    CGContextFillPath(ctx);
    [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
    CGContextStrokePath(ctx);

    
}


@end
