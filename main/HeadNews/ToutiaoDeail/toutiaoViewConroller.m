//
//  toutiaoViewConroller.m
//  News
//
//  Created by xionglj on 14-9-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "toutiaoViewConroller.h"

#import "secondNewsModel.h"
#import "secondNewsEntity.h"

@implementation toutiaoViewConroller
{
    NSInteger timer;
    UIScrollView *scrollView;
    secondNewsModel *model;
    NSInteger number;
    UIImageView *animatedImageView;
    UIView *view3;
    
}
@synthesize str,str1,lable,lable1,lable2,lable3,imageView,imageView1,imageView2,imageView3;
@synthesize image,image1,image2,lable10,lable11,lable12;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [self.view addSubview:view];
    
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -35, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.text = str1;
    lableH.textColor = [UIColor blackColor];
    [view addSubview:lableH];
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 416)];
    [self.view addSubview:view3];
    
    self.view.backgroundColor = [UIColor blackColor];
    //
    NSURL *url = [NSURL URLWithString:str];
    secondNewsEntity *entity = [[secondNewsEntity alloc]init];
    [entity getNews:url];
    
    
    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    
    animatedImageView.animationImages = [NSArray arrayWithObjects:   
                                         
                                         [UIImage imageNamed:@"00.tiff"],
                                         [UIImage imageNamed:@"01.tiff"],
                                         [UIImage imageNamed:@"02.tiff"],
                                         [UIImage imageNamed:@"03.tiff"],
                                         [UIImage imageNamed:@"04.tiff"],
                                         [UIImage imageNamed:@"05.tiff"],
                                         [UIImage imageNamed:@"06.tiff"],
                                         [UIImage imageNamed:@"07.tiff"],
                                         
                                         nil];
    
    animatedImageView.animationDuration = 0.5f;
    
    animatedImageView.animationRepeatCount = 0;
    
    [animatedImageView startAnimating];
    
    [view3 addSubview: animatedImageView];
    
    
    
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pageTimer) userInfo:nil repeats:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"send" object:nil];
  
    
}


- (void)send:(NSNotification *)notification
{
    
    
    NSArray *array = notification.object;
    number = array.count;
    
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, 320, 300)];
    scrollView.contentSize = CGSizeMake(320 * number, 200);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor redColor];
    [view3 addSubview:scrollView];
    
    for (int i = 0; i < number; i++) {
        UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0 + 320 * i, 0, 320, 200)];
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
        lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
        lable.numberOfLines = 20;
        lable.font = [UIFont systemFontOfSize:11];
        lable.textColor = [UIColor redColor];
        lable.backgroundColor = [UIColor blackColor];
        [myView addSubview:imageView];
        [myView addSubview:lable];
        [scrollView addSubview:myView];
        
        model = [[secondNewsModel alloc]init];
        
        model = [array objectAtIndex:i];
        self.navigationItem.title = model.title;
        
        self.imageView.image = model.image;
        self.lable.text = model.description;
        
        
     }
    [animatedImageView stopAnimating];

}
- (void)pageTimer
{
    
    [scrollView scrollRectToVisible:CGRectMake(320*timer, 0, 320, scrollView.frame.size.height) animated:YES];
    timer ++;
    if(timer==number)
    {
        
        timer = 0;
        
    }
    
}
@end
