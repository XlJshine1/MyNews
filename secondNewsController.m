//
//  secondNewsController.m
//  myLine
//
//  Created by xionglj on 14-9-13.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "secondNewsController.h"

@implementation secondNewsController
{
    NSInteger timer;
    UIScrollView *scrollView;
    secondNewsModel *model;
    NSInteger number;
    
}
@synthesize str,lable,lable1,lable2,lable3,imageView,imageView1,imageView2,imageView3;
@synthesize image,image1,image2,lable10,lable11,lable12;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)Click
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"2222 = %@",str);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Click)];
    self.navigationItem.leftBarButtonItem = item;
    
    NSURL *url = [NSURL URLWithString:str];
    secondNewsEntity *entity = [[secondNewsEntity alloc]init];
    [entity getNews:url];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.1765 green:0.6118 blue:0.9216 alpha:1];
    
   /* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    scrollView.contentSize = CGSizeMake(1280, 200);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0 + 0, 0, 320, 200)];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    lable = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 200)];
    lable.numberOfLines = 20;
    lable.font = [UIFont systemFontOfSize:11];
    lable.textColor = [UIColor redColor];
    lable.backgroundColor = [UIColor blackColor];
    [myView addSubview:imageView];
    [myView addSubview:lable];
    [scrollView addSubview:myView];
    
    
    UIView *myView1 = [[UIView alloc]initWithFrame:CGRectMake(0 + 320, 0, 320, 200)];
   imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    lable1 = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 200)];
    lable1.numberOfLines = 20;
    lable1.font = [UIFont systemFontOfSize:9];
    lable1.textColor = [UIColor redColor];
    lable1.backgroundColor = [UIColor blackColor];
    [myView1 addSubview:imageView1];
    [myView1 addSubview:lable1];
    [scrollView addSubview:myView1];
    
    UIView *myView2 = [[UIView alloc]initWithFrame:CGRectMake(0 + 320*2, 0, 320, 200)];
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    lable2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 200)];
    lable2.numberOfLines = 20;
    lable2.font = [UIFont systemFontOfSize:9];
    lable2.textColor = [UIColor redColor];
    lable2.backgroundColor = [UIColor blackColor];
    [myView2 addSubview:imageView2];
    [myView2 addSubview:lable2];
    [scrollView addSubview:myView2];
    
    UIView *myView3 = [[UIView alloc]initWithFrame:CGRectMake(0 + 320*3, 0, 320, 200)];
    imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    lable3 = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 200)];
    lable3.numberOfLines = 20;
    lable3.font = [UIFont systemFontOfSize:9];
    lable3.textColor = [UIColor redColor];
    lable3.backgroundColor = [UIColor blackColor];
    [myView3 addSubview:imageView3];
    [myView3 addSubview:lable3];
    [scrollView addSubview:myView3];*/

    
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake(2, 200, 80, 30)];
    lable4.text = @"相关推荐";
    lable4.backgroundColor = [UIColor colorWithRed:0.1765 green:0.6118 blue:0.9216 alpha:1];
    lable4.textColor = [UIColor redColor];
    [self.view addSubview:lable4];
    UILabel *lable5 = [[UILabel alloc]initWithFrame:CGRectMake(0, 229, 80, 3)];
    lable5.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lable5];
    UILabel *lable6 = [[UILabel alloc]initWithFrame:CGRectMake(80, 205, 10, 27)];
    lable6.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lable6];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 236, 320, 60)];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    image = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 56, 56)];
    lable10 = [[UILabel alloc]initWithFrame:CGRectMake(60,5 , 200, 50)];
    lable10.backgroundColor = [UIColor clearColor];
    lable10.numberOfLines = 3;
    [btn addSubview:image];
    [btn addSubview:lable10];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 296, 320, 60)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    image1 = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 56, 56)];
    lable11 = [[UILabel alloc]initWithFrame:CGRectMake(60,5 , 200, 50)];
    lable11.backgroundColor = [UIColor clearColor];
    lable11.numberOfLines = 3;
    [btn2 addSubview:image1];
    [btn2 addSubview:lable11];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 356, 320, 60)];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    image2 = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 56, 56)];
    lable12 = [[UILabel alloc]initWithFrame:CGRectMake(60,5 , 200, 50)];
    lable12.backgroundColor = [UIColor clearColor];
    lable12.numberOfLines = 3;
    [btn3 addSubview:image2];
    [btn3 addSubview:lable12];
    [self.view addSubview:btn3];
    
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pageTimer) userInfo:nil repeats:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"send" object:nil];
}

- (void)send:(NSNotification *)notification
{
    
    
    NSArray *array = notification.object;
    number = array.count;
    
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    scrollView.contentSize = CGSizeMake(320 * number, 200);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < number; i++) {
        UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0 + 320 * i, 0, 320, 200)];
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        lable = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 200)];
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
    
    //推荐新闻
    image.image = model.thumbnail;
    lable10.text = model.rectitle;
    
    image1.image = model.thumbnail1;
    lable11.text = model.rectitle1;
    
    image2.image = model.thumbnail2;
    lable12.text = model.rectitle2;
    
    
    
   /* //传统方法
    secondNewsModel *model = [[secondNewsModel alloc]init];
    model = [notification.object objectAtIndex:0];
    
    
    

    
    self.navigationItem.title = model.title;
    
    
    self.imageView.image = model.image;
    self.lable.text = model.description;
    
    self.imageView1.image = model.image1;
    self.lable1.text = model.description1;
    
    self.imageView2.image = model.image2;
    self.lable2.text = model.description2;
    
    self.imageView3.image = model.image3;
    self.lable3.text = model.description3;
    
    image.image = model.thumbnail;
    lable10.text = model.rectitle;
    
    image1.image = model.thumbnail1;
    lable11.text = model.rectitle1;
    
    image2.image = model.thumbnail2;
    lable12.text = model.rectitle2;   */
    
    
    
    

}
- (void)pageTimer
{
    
    [scrollView scrollRectToVisible:CGRectMake(320*timer, 0, 320, scrollView.frame.size.height) animated:YES];
    timer ++;
    if(timer==number)
    {
        
        timer = 0;
        
    }
    /* pageController = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 150.0, 320.0,10 )];
     pageController.numberOfPages = 4;
     //[pageController addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
     [_imageScrollView addSubview:pageController];
     int currentPage =pageController.currentPage;
     [_imageScrollView setContentOffset:CGPointMake(320*currentPage, 0) animated:YES];*/
}

@end
