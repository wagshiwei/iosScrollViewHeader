//
//  ViewController.m
//  scrollHeader
//
//  Created by yuzi on 17/1/11.
//  Copyright © 2017年 yuzi. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h";


#define DeviceHeight [UIScreen mainScreen].bounds.size.height
#define DeviceWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UIScrollViewDelegate>
{
    CGFloat HeaderImgHeight;
}


@property(strong,nonatomic)UIScrollView* mScrollView;
@property(strong,nonatomic)UIImageView* avatar;
@property(strong,nonatomic)CircleView* circle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HeaderImgHeight = DeviceHeight;
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mScrollView = [[UIScrollView alloc ]init];
    [self.view addSubview:_mScrollView];
    self.mScrollView.frame = CGRectMake(0, 0, DeviceWidth, DeviceHeight);
    self.mScrollView.contentSize=CGSizeMake(DeviceWidth, DeviceHeight+1);
    self.mScrollView.delegate = self;
    
    self.avatar = [[UIImageView alloc ]init];
    [self.mScrollView addSubview:_avatar];
    self.avatar.frame = CGRectMake(0,-64,DeviceWidth,DeviceHeight/2);
    self.avatar.image = [UIImage imageNamed:@"1.jpg"];
//    self.avatar.
    _circle = [[CircleView alloc ]init];
     [self.mScrollView addSubview:_circle];
    _circle.frame = CGRectMake(0, (50), DeviceWidth, DeviceHeight);
    _circle.backgroundColor=[UIColor clearColor];//  HexColor(0x00000000);
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if([scrollView isEqual:self.mScrollView]){
        //        NSLog(@"%f ",scrollView.contentOffset.y);
        
        //        float HeaderImgHeight= DeviceHeight;
        
        CGFloat y = scrollView.contentOffset.y; //如果有导航控制器，这里应该加上导航控制器的高度64
        [_circle setControlPoint:y];
        if (y< 0) {
            CGRect frame = self.avatar.frame;
            frame.origin.y = y;
            CGFloat fac = ((HeaderImgHeight-y)/(float)HeaderImgHeight);
            frame.size.width =fac*DeviceWidth;
            frame.origin.x = (DeviceWidth-frame.size.width)/2;
            frame.size.height = HeaderImgHeight-y;
            self.avatar.frame = frame;
            
            
        }else{
            CGRect frame = self.avatar.frame;
            frame.origin.y = 0;
            frame.size.height = HeaderImgHeight;
            self.avatar.frame = frame;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
