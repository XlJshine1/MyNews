//
//  videoNewsController2.m
//  News
//
//  Created by xionglj on 14-9-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "videoNewsController2.h"
#import "videoNewsEntity2.h"
#import "videoNewsModel2.h"
@implementation videoNewsController2
{
    UIImageView *animatedImageView;
   
}
@synthesize str,IDarray,Titlearray,Number;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)back
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    number = (NSInteger)[Number integerValue];
   
    UIView  *view10 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view10.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view10 addSubview:imageView10];
    [self.view addSubview:view10];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view10 addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 240, 40)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.numberOfLines = 2;
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.font = [UIFont systemFontOfSize:15];
    lableH.text = [Titlearray objectAtIndex:number];
    lableH.textColor = [UIColor blackColor];
    [view10 addSubview:lableH];
    
    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 244, 320, 216)];
    
    animatedImageView.animationImages = [NSArray arrayWithObjects:   
                                         
                                         [UIImage imageNamed:@"21.tiff"],
                                         [UIImage imageNamed:@"22.tiff"],
                                         [UIImage imageNamed:@"23.tiff"],
                                         [UIImage imageNamed:@"24.tiff"],
                                         [UIImage imageNamed:@"25.tiff"],
                                         [UIImage imageNamed:@"26.tiff"],
                                    
                                         nil];
    
    animatedImageView.animationDuration = 2.0f;
    
    animatedImageView.animationRepeatCount = 0;
    [self.view addSubview:animatedImageView];
    
    [animatedImageView startAnimating];
    
    videoNewsEntity2 *entity = [[videoNewsEntity2 alloc]init];
    NSURL *url = [NSURL URLWithString:[IDarray objectAtIndex:number]];
    [entity getNews:url];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sender:) name:@"toVideo2" object:nil];
    
}
- (void)sender:(NSNotification *)notification
{

    
    NSArray *array = notification.object;
    videoNewsModel2 *model = [[videoNewsModel2 alloc]init];
    model = [array objectAtIndex:0];
    
    NSString *str1 = model.videoSrc;
    NSLog(@"str1================%@",str1);
    NSURL *url1 = [NSURL URLWithString:str1];
    
    moviePalyer = [[MPMoviePlayerController alloc]initWithContentURL:url1];
    moviePalyer.view.frame = CGRectMake(0, 44, 320,200);
    [self.view addSubview:moviePalyer.view];
    
    [moviePalyer play];
    NSLog(@"isPlaying------");
}
//横竖屏适配方法
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        //左横屏
        moviePalyer.view.frame = CGRectMake(0, 0, 480,300);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        //右横屏
        moviePalyer.view.frame = CGRectMake(0, 0, 480,300);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        //竖屏
        moviePalyer.view.frame = CGRectMake(0, 44, 320,200);
    }
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        //倒屏
        moviePalyer.view.frame = CGRectMake(0, 44, 320,200);
    }
    return YES;
}


@end
