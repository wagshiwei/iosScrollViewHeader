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
//    CGContextAddCurveToPoint(ctx, 150, 150);
//    CGContextAddLineToPoint(ctx, 100, 200);
//    CGContextAddLineToPoint(ctx, 50, 150);
//    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddQuadCurveToPoint(ctx, DeviceWidth/2, -64-y, DeviceWidth, height);
    CGContextAddLineToPoint(ctx, DeviceWidth, DeviceHeight);
    CGContextAddLineToPoint(ctx, 0, DeviceHeight);
    CGContextAddLineToPoint(ctx, 0, height);
    
    
      [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] set];
    CGContextFillPath(ctx);
    
    //2.画四边形
//    CGContextAddRect(ctx, CGRectMake(20, 20, chang, kuan));
    
    // 如果要设置绘图的状态必须在渲染之前
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
    // 绘制什么类型的图形(空心或者实心).就要通过什么类型的方法设置状态
    //    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 调用OC的方法设置绘图的颜色
    //   [[UIColor purpleColor] setFill];
    //   [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
    //    [[UIColor greenColor] set];
    [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
    
    
    //3.渲染图形到layer上
    //空心的
    CGContextStrokePath(ctx);
    //实心的
    //CGContextFillPath(ctx);
    
}


@end
