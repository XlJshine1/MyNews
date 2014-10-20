//
//  deailViewController.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "deailViewController.h"
#import "detailNewsEntity.h"
#import "detailNewsModel.h"
#import "secondViewController.h"
#import "UserModel.h"
#import "UserDB.h"
@implementation deailViewController
{
    UIImageView *imageView;
    UIImageView *imageView2;
    UIWebView *web;
    UIScrollView *scroll;
    UIImageView  * animatedImageView;
    UIView *viewFX;
    UIView *view4;
    UIView *view5;
    NSInteger number;
    UIScrollView *homeScroll;
    UIView *viewNext;
    UILabel *lableH;
    UIView *viewFY;
    UITextView *textViewFY;
    UIView *view3;
   
}
@synthesize str,str1,array,IDarray,Number,Titlearray,imageData,Timearray,Urlarray;
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
    
   
    number = [Number integerValue];
   
   
    self.view.backgroundColor = [UIColor blackColor];
    
    
    //导航栏
    UIView  *view10 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view10.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view10 addSubview:imageView10];
    [self.view addSubview:view10];
    
    //主标题
    lableH = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 200, 40)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.numberOfLines = 2;
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.font = [UIFont systemFontOfSize:15];
    lableH.text = [Titlearray objectAtIndex:number];
    lableH.textColor = [UIColor blackColor];
    [view10 addSubview:lableH];
    //返回按钮
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view10 addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    //上一页按钮
    
    
    UIView *view21 = [[UIView alloc]initWithFrame:CGRectMake(245, 10, 25, 20)];
    UIButton *toleft = [[UIButton alloc]init];
    toleft.frame = CGRectMake(0, 0, 25, 20);
    [toleft setBackgroundImage:[UIImage imageNamed:@"toleft.png"] forState:UIControlStateNormal];
    [view21 addSubview:toleft];
    [view10 addSubview:view21];
    [toleft addTarget:self action:@selector(toLeft) forControlEvents:UIControlEventTouchUpInside];
    //下一页按钮
    UIView *view22 = [[UIView alloc]initWithFrame:CGRectMake(285, 10, 25, 20)];
    UIButton *toright = [[UIButton alloc]init];
    toright.frame = CGRectMake(0, 0, 25, 20);
    [toright setBackgroundImage:[UIImage imageNamed:@"toright.png"] forState:UIControlStateNormal];
    [view22 addSubview:toright];
    [view10 addSubview:view22];
    [toright addTarget:self action:@selector(toRight) forControlEvents:UIControlEventTouchUpInside];
  

    
    //分享视图
    viewFX = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 215)];
    viewFX.backgroundColor = [UIColor whiteColor];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
    lable3.backgroundColor = [UIColor grayColor];
    [viewFX addSubview:lable3];
    
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 5, 60, 35)];
    lable1.backgroundColor = [UIColor clearColor];
    lable1.text = @"分享到";
    lable1.textAlignment = UITextAlignmentCenter;
    lable1.textColor = [UIColor colorWithRed:0.1529 green:0.4275 blue:0.9373 alpha:1];
    [viewFX addSubview:lable1];
    
    
 for (int i = 0; i < 4 ; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15 + 80*i, 40, 50, 50)];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15 + 80*i, 95, 50, 25)];
        lable.tag = i + 5;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textAlignment = UITextAlignmentCenter;
        btn.tag = i + 5;
        [self lableText:lable];
        [self btnBack:btn];
        [viewFX addSubview:lable];
        [viewFX addSubview:btn];
    }
    for (int i = 0; i < 4 ; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15 + 80*i, 125, 50, 50)];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15 + 80*i, 180, 50, 25)];
        lable.tag = i + 9; 
        btn.tag = i + 9;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textAlignment = UITextAlignmentCenter;
        [self lableText:lable];
        [viewFX addSubview:lable];
        [self btnBack:btn];
        [viewFX addSubview:btn];
    }
    viewFX.hidden = YES;
    
    
    
    //评论
    viewFY = [[UIView alloc]initWithFrame:CGRectMake(0, 330, 320, 130)];
    viewFY.backgroundColor = [UIColor colorWithRed:0.5608 green:0.5961 blue:0.6392 alpha:1];
     viewFY.hidden = YES;
    
    UIButton *btnFY1 = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    btnFY1.backgroundColor = [UIColor clearColor];
    UIImageView *imageFY = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no1.png"]];
    imageFY.frame = btnFY1.bounds;
    [btnFY1 addSubview:imageFY];
    [viewFY addSubview:btnFY1];
    [btnFY1 addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lableFY = [[UILabel alloc]initWithFrame:CGRectMake(140, 5, 40, 20)];
    lableFY.backgroundColor = [UIColor clearColor];
    lableFY.text = @"发言";
    lableFY.textAlignment = UITextAlignmentCenter;
    [viewFY addSubview:lableFY];
    
    
    UIButton *btnFY2 = [[UIButton alloc]initWithFrame:CGRectMake(290, 5, 25, 25)];
    btnFY2.backgroundColor = [UIColor clearColor];
    UIImageView *imageFY1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yes.png"]];
    imageFY1.frame = btnFY2.bounds;
    [btnFY2 addSubview:imageFY1];
    [viewFY addSubview:btnFY2];
    
    
    textViewFY = [[UITextView alloc]initWithFrame:CGRectMake(5, 35, 310, 80)];
    textViewFY.delegate = self;
    textViewFY.font = [UIFont systemFontOfSize:18];
   
    
    [viewFY addSubview:textViewFY];
    
    
    
    //数据请求
    NSURL *url = [NSURL URLWithString:[IDarray objectAtIndex:number]];
    detailNewsEntity *entity = [[detailNewsEntity alloc]init];
    [entity getNews:url];
    
    web = [[UIWebView alloc]init];
    [self.view addSubview:web];
    web.scrollView.showsHorizontalScrollIndicator = NO;
   
    
    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 320, 200)];
    
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
    
   [self.view addSubview: animatedImageView];
    
    

    [self.view addSubview:viewFX];
   
    
    view4 = [[UIView alloc]initWithFrame:CGRectMake(120, 200,80, 60)];
    view4.layer.cornerRadius = 10;
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
    imageView2.layer.cornerRadius = 10;
    [view4 addSubview:imageView2];
    view4.hidden = YES;
    [self.view addSubview:view4];
     
    
    
    view5 = [[UIView alloc]initWithFrame:CGRectMake(256, 415, 60, 150)];
    view5.backgroundColor = [UIColor grayColor];
    for (int i = 0; i <3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(1, 1 + 50*i, 58, 49)];
        btn.tag = i + 13;
        [self btnBack:btn];
        [view5 addSubview:btn];
    }
    
    [self.view addSubview:view5];
    
    //选项栏视图
    view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 415, 320, 45)];
    view3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view3];
    
   /* for (int i = 0; i < 5; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(17 + 64 * i, 7, 30, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        [view3 addSubview:btn];
        [self btnBack:btn];
        [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
    lable.backgroundColor = [UIColor grayColor];
    [view3 addSubview:lable];*/
    
    [self createBarButton];
    
    
    
    [self.view addSubview:viewFY];
  
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"todetailview" object:nil];
    
    
    //键盘弹出通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillChangeFrameNotification object:nil];
    //键盘收起通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}
- (void)createBarButton
{
    for (int i = 0; i < 5; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(17 + 64 * i, 7, 30, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        [view3 addSubview:btn];
        [self btnBack:btn];
        [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
    lable.backgroundColor = [UIColor grayColor];
    [view3 addSubview:lable];
}
- (void)hide
{
    viewFY.hidden = YES;
    [textViewFY resignFirstResponder];
}
- (void)keyboardWillShow
{
    viewFY.hidden = NO;
    [UIView animateWithDuration:0.25 animations:^{
        viewFY.frame = CGRectMake(0, 80, 320, 130);} completion:nil];
}

- (void)keyboardWillHide
{
    viewFY.hidden = YES;
   [UIView animateWithDuration:0.25 animations:^{viewFY.frame = CGRectMake(0, 330, 320, 130);} completion:nil];
    
    
}

//上一条新闻
- (NSInteger)toLeft
{
    viewNext.hidden = YES;
    [self createBarButton];
    if (number - 1 >=0) {
        NSURL *url = [NSURL URLWithString:[IDarray objectAtIndex:number - 1]];
        detailNewsEntity *entity = [[detailNewsEntity alloc]init];
        [entity getNews:url];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"todetailview" object:nil];
         
        
        viewNext = [[UIView alloc]initWithFrame:CGRectMake(100, 60, 120, 30)];
        UILabel *lable = [[UILabel alloc]initWithFrame:viewNext.bounds];
        [viewNext addSubview:lable];
        lable.text = @"上一条新闻";
        lable.textAlignment = UITextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.backgroundColor = [UIColor blackColor];
        viewNext.backgroundColor = [UIColor blackColor];
        [self.view addSubview:viewNext];
        
        lableH.text = [Titlearray objectAtIndex:number - 1];
        
        
        number = number - 1;
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1) userInfo:nil repeats:NO];
    }else{
        viewNext = [[UIView alloc]initWithFrame:CGRectMake(100, 60, 120, 30)];
        UILabel *lable = [[UILabel alloc]initWithFrame:viewNext.bounds];
        [viewNext addSubview:lable];
        lable.text = @"已是第一条新闻";
        lable.font = [UIFont systemFontOfSize:15];
        lable.textAlignment = UITextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.backgroundColor = [UIColor blackColor];
        viewNext.backgroundColor = [UIColor blackColor];
        [self.view addSubview:viewNext];
        
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1) userInfo:nil repeats:NO];
    
    }
   
    return number;

}
//下一条新闻
- (NSInteger)toRight
{   
    [self createBarButton];
    viewNext.hidden = YES;
    if (number + 1 < IDarray.count) {
        NSURL *url = [NSURL URLWithString:[IDarray objectAtIndex:number + 1]];
        detailNewsEntity *entity = [[detailNewsEntity alloc]init];
        [entity getNews:url];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"todetailview" object:nil];
        
        
        
        viewNext = [[UIView alloc]initWithFrame:CGRectMake(100, 60, 120, 30)];
        UILabel *lable = [[UILabel alloc]initWithFrame:viewNext.bounds];
        [viewNext addSubview:lable];
        lable.text = @"下一条新闻";
        lable.textAlignment = UITextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.backgroundColor = [UIColor blackColor];
        viewNext.backgroundColor = [UIColor blackColor];
        [self.view addSubview:viewNext];
        
        lableH.text = [Titlearray objectAtIndex:number+1];
        
        
        number = number + 1;
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1) userInfo:nil repeats:NO];
    }else{
        viewNext = [[UIView alloc]initWithFrame:CGRectMake(100, 60, 120, 30)];
        UILabel *lable = [[UILabel alloc]initWithFrame:viewNext.bounds];
        [viewNext addSubview:lable];
        lable.text = @"已是最后一条新闻";
        lable.font = [UIFont systemFontOfSize:15];
        lable.textAlignment = UITextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.backgroundColor = [UIColor blackColor];
        viewNext.backgroundColor = [UIColor blackColor];
        [self.view addSubview:viewNext];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time1) userInfo:nil repeats:NO];
    
    }
    
    return number;

}
- (void)time1
{
   viewNext.hidden = YES;
}

- (void)lableText:(UILabel *)lable
{
    switch (lable.tag) {

        case 5:
            lable.text = @"朋友圈";
            break;
        case 6:
             lable.text = @"微 信";
            break;
        case 7:
             lable.text = @"新浪微博";
            break;
        case 8:
             lable.text = @"腾讯微博";
            break;
        case 9:
             lable.text = @"QQ空间";
            break;        
        case 10:
             lable.text = @"QQ好友";
            break;
        case 11:
             lable.text = @"邮 件";            
            break;
        case 12:
             lable.text = @"短 信";
            break;
        default:
            break;
    }
}
- (void)btnBack:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [btn setImage:[UIImage imageNamed:@"A11"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"A1"] forState:UIControlStateSelected];
            break;
        case 1:
            [btn setImage:[UIImage imageNamed:@"A2"] forState:UIControlStateNormal];
            break;
        case 2:
            [btn setImage:[UIImage imageNamed:@"A3"] forState:UIControlStateNormal];
            break;
        case 3:
            [btn setImage:[UIImage imageNamed:@"A4"] forState:UIControlStateNormal];
            break;
        case 4:
            [btn setImage:[UIImage imageNamed:@"A5"] forState:UIControlStateNormal];
            break;
        case 5:
            [btn setImage:[UIImage imageNamed:@"B1"] forState:UIControlStateNormal];
            break;
        case 6:
            [btn setImage:[UIImage imageNamed:@"B2"] forState:UIControlStateNormal];
            break;
        case 7:
            [btn setImage:[UIImage imageNamed:@"B3"] forState:UIControlStateNormal];
            break;
        case 8:
            [btn setImage:[UIImage imageNamed:@"B4"] forState:UIControlStateNormal];
            break;
        case 9:
            [btn setImage:[UIImage imageNamed:@"B5"] forState:UIControlStateNormal];
            break;        
        case 10:
            [btn setImage:[UIImage imageNamed:@"B6"] forState:UIControlStateNormal];
            break;
        case 11:
            [btn setImage:[UIImage imageNamed:@"B7"] forState:UIControlStateNormal];
            break;
        case 12:
            [btn setImage:[UIImage imageNamed:@"B8"] forState:UIControlStateNormal];
            break;
        case 13:
            [btn setImage:[UIImage imageNamed:@"D1"] forState:UIControlStateNormal];
            break;
        case 14:
            [btn setImage:[UIImage imageNamed:@"D2"] forState:UIControlStateNormal];
            break;
        case 15:
            [btn setImage:[UIImage imageNamed:@"D3"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
- (void)action:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            btn.selected = !btn.selected;
            if (btn.selected == YES) {
                [imageView2 setImage:[UIImage imageNamed:@"C1"]];
                view4.hidden = NO;
                [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time) userInfo:nil repeats:NO];
              
                
                NSString *title = [Titlearray objectAtIndex:number];
                NSString *time = [Timearray objectAtIndex:number];
                NSString *url = [Urlarray objectAtIndex:number];
                NSString *imagedata = [imageData objectAtIndex:number];
                //NSData *imagedata = [imageData objectAtIndex:number];
                //NSString *image = [NSString stringWithFormat:@"%@",imagedata];
              
                UserModel *user = [[UserModel alloc]init];
                user.title = title;
                user.time = time;
                user.image = imagedata;
                user.url = url;
                
                
                [[UserDB shareInstance]createTable];
                [[UserDB shareInstance]addUser:user];
                
                
            }
            else if(btn.selected == NO)
            {
                [imageView2 setImage:[UIImage imageNamed:@"C2"]];
                view4.hidden = NO;
                 [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time) userInfo:nil repeats:NO];
                
                UserModel *user = [[UserModel alloc]init];
                [[UserDB shareInstance]subUser:user andTitle:[Titlearray objectAtIndex:number]];
                
            }
            break;
        case 1:
            
             viewFY.hidden = NO;
            break;
        case 2:
           
           btn.selected = !btn.selected;
            if (btn.selected == YES) {
                
                [UIView animateWithDuration:2 animations: ^{web.scrollView.contentOffset = CGPointMake(0, web.scrollView.contentSize.height*1/3);} completion:nil];
                
            }
            else if(btn.selected == NO){
               [UIView animateWithDuration:2 animations: ^{web.scrollView.contentOffset = CGPointMake(0, web.scrollView.contentSize.height*2/3);} completion:nil];
               
            }
            break;
      case 3:
            if (viewFX.hidden == YES) {
                viewFX.hidden = NO;
                [UIView animateWithDuration:1 animations: ^{view5.frame = CGRectMake(256, 415, 60, 150);} completion:nil];
            }
            else if(viewFX.hidden == NO){
                viewFX.hidden = YES;
            }
            break;
      case 4:
            
            btn.selected = !btn.selected;
            if (btn.selected == YES) {
                [UIView animateWithDuration:1 animations: ^{view5.frame = CGRectMake(256, 265, 60, 150);} completion:nil];
                viewFX.hidden = YES;
            }
            else if(btn.selected == NO){
            
               [UIView animateWithDuration:1 animations: ^{view5.frame = CGRectMake(256, 415, 60, 150);} completion:nil];
                
            }
           break;
   default:
            break;
        
    }
}
- (void)begin
{
   
}
- (void)time
{
    view4.hidden =YES;
    return;
    
}
-(void)send:(NSNotification *)notification
{
    array = notification.object;
   
    detailNewsModel *model = [[detailNewsModel alloc]init];
    model = [array objectAtIndex:0];
    web.frame = CGRectMake(0, 44, 320,371);
    
    //将文本转成NSData数据
    NSData *data=[model.text dataUsingEncoding:NSUTF8StringEncoding];
   //将数据加载到UIWebView中
    [web loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
    
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
    [scroll addSubview:myView];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
    imageView.image = model.thumbnail;
    [myView addSubview:imageView];
    
    
    //self.navigationItem.title = model.title;
    
  
    

    //停止加载动画
    [animatedImageView stopAnimating];
    
    
}




@end
