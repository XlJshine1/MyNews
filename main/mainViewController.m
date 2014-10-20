//
//  mainViewController.m
//  News
//
//  Created by xionglj on 14-9-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "mainViewController.h"
#import "headNewsEntity.h"
#import "headNews.h"
#import "mainCell.h"
#import "toutiaoViewConroller.h"
#import "separateNewsEntity.h"
#import "separateNewsModel.h"
#import "MainViewControllerCell.h"
#import "videoViewController.h"
#import "secondViewContrller2.h"
#import "SearchViewController.h"
#import "ZhezhiViewController.h"
#import "Reachability.h"

@implementation mainViewController
{
    NSArray *arrImage;
    NSArray *arrText;
    NSArray *arrDetail;
    UIScrollView *scroll;
    UIScrollView *homeScroll;
    NSInteger timer;
    UIButton *button;
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
    UIImageView *animatedImageView;
    UIView *viewRight;
    UIView *viewLeft;
    UIControl *control;
    UITableView *mytableView;
    UISwitch *swi;
    UIButton *rightBtn;
    UIView *view3;
    UIView  *view;
    UIView *viewMore;
    UIButton *btnM;
    UIButton *btn1;
    NSInteger number;
    
}
@synthesize array,myID,myID1,myID2,muArray,myViewController,mainArray,IDArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
 

    
    homeScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460 )];
    homeScroll.delegate = self;
    homeScroll.contentSize =CGSizeMake(560, 416);
    homeScroll.contentOffset = CGPointMake(240, 0);
    homeScroll.pagingEnabled = YES;
    homeScroll.scrollEnabled = NO;
    homeScroll.showsHorizontalScrollIndicator = NO;
    homeScroll.bounces = NO;
    [self.view addSubview:homeScroll];
    
    
    
    //显示左右大视图
    [self viewRightLoad];
    [self viewLeftLoad];
    
    //网络链接判断
    [self NetConnection];
    
    //网络数据请求
    [self resourceRequest];
}
//发送网络数据请求
- (void)resourceRequest
{
    //网络请求，头条
    
    NSString *str =  @"http://api.3g.ifeng.com/get_pic_list?channel=news&pageindex=1&pagesize=10&pageindex=1";
    NSURL *url = [NSURL URLWithString:str];
    headNewsEntity *entity = [[headNewsEntity alloc]init];
    [entity getNews:url];
    
    
    //网络请求，分类
    NSString *str1 = @"http://api.3g.ifeng.com/channel_list_ios?channel=origin&pageindex=1&pagesize=50";
    NSURL *url1 = [NSURL URLWithString:str1];
    separateNewsEntity *sepEntity = [[separateNewsEntity alloc]init];
    [sepEntity getNews:url1];
    
    
}
- (void)NetConnection
{
    //网络判断
    
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            NSLog(@"没有网络连接");
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            NSLog(@"使用3G网络");
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            NSLog(@"使用WiFi网络");
            break;
    }
    if (r.currentReachabilityStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请检查网络链接状态" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        return;
    }
}
#pragma mark -viewLeftView
//菜单栏视图弹出方法
- (void)viewLeftLoad
{
    viewLeft = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 240, 460)];
    viewLeft.backgroundColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    
    
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(35, 80, 200, 20)];
    lable1.backgroundColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    lable1.textColor = [UIColor whiteColor];
    lable1.text = @"登陆后，将推荐给你更多感兴趣的文章";
    lable1.font = [UIFont systemFontOfSize:10];
    [viewLeft addSubview:lable1];
    
    

    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, 240, 280) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.scrollEnabled = NO;
    mytableView.separatorColor = [UIColor blackColor];
    mytableView.backgroundColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 109, 240, 1)];
    lable.backgroundColor = [UIColor blackColor];
    [viewLeft addSubview:lable];
    
    UIButton *btnLeft = [[UIButton alloc]initWithFrame:CGRectMake(35, 30, 40, 40)];
    [btnLeft setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
    [viewLeft addSubview:btnLeft];
    
    UIButton *btnLeft1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 30, 40, 40)];
    [btnLeft1 setImage:[UIImage imageNamed:@"Y.png"] forState:UIControlStateNormal];
    [viewLeft addSubview:btnLeft1];
    
    UIButton *btnLeft2 = [[UIButton alloc]initWithFrame:CGRectMake(165, 30, 40, 40)];
    [btnLeft2 setImage:[UIImage imageNamed:@"Z.png"] forState:UIControlStateNormal];
    [viewLeft addSubview:btnLeft2];
    
    
    swi = [[UISwitch alloc]initWithFrame:CGRectMake(20, 415, 40, 20)];
    swi.backgroundColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    swi.onTintColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    swi.selected = 0;
    [swi addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    [viewLeft addSubview:swi];
    
    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(103, 413, 80, 30)];
    lable2.text =@"夜间模式";
    lable2.backgroundColor = [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2235 alpha:1];
    lable2.textColor = [UIColor whiteColor];
    [viewLeft addSubview:lable2];
    
    
    
    [viewLeft addSubview:mytableView];
    
    [homeScroll addSubview:viewLeft];
}
- (void)switchAction
{
    if (swi.selected == 0) {
        viewRight.backgroundColor = [UIColor blackColor];
    }
    else 
    {
        viewRight.backgroundColor = [UIColor whiteColor];
    }
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MainViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MainViewControllerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle  =  UITableViewCellSelectionStyleNone;
    NSArray *arrayA = [NSArray arrayWithObjects:@"搜索",@"收藏",@"通知",@"离线",@"活动",@"设置",@"反馈", nil];
    NSArray *arrayB = [NSArray arrayWithObjects:@"A.png",@"B.png",@"C.png",@"D.png",@"E.png",@"F.png",@"G.png", nil];
    cell.textLabel.text = [arrayA objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    [cell.imageView setImage:[UIImage imageNamed:[arrayB objectAtIndex:indexPath.row]]];

  

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 1) {
        secondViewContrller2 *svc2 = [[secondViewContrller2 alloc]init];
        [self presentViewController:svc2 animated:YES completion:^{}];
    }
    if (indexPath.section == 0&&indexPath.row == 0) {
        SearchViewController *svc = [[SearchViewController alloc]init];
        [self presentViewController:svc animated:YES completion:^{}];
    }
    if (indexPath.section == 0&&indexPath.row == 5) {
        //缓存路径
        NSString *cachPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PermanentStore"];
        

        ZhezhiViewController *zvc = [[ZhezhiViewController alloc]init];
        //缓存大小计算
         float a =  [self folderSizeAtPath:cachPath];
        NSString *str = [NSString stringWithFormat:@"%0.2f",a];
        zvc.strCH = str;
        
        [self presentViewController:zvc animated:YES completion:^{}];
    }
}
//单个文件的大小

- (long long) fileSizeAtPath:(NSString*) filePath
{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
        
    }
    
    return 0;
    
}

//遍历文件夹获得文件夹大小，返回多少M

- (float ) folderSizeAtPath:(NSString*) folderPath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
        
    }
    
    return folderSize/(1024.0*1024.0);
    
}
//滑出菜单栏
- (void)change
{
    
    
    //设置动画,即改变homeScroll的偏移量
    [UIView animateWithDuration:0.4 animations:^{
        homeScroll.contentOffset = CGPointMake(0, 0);} completion:nil];
    
    control = [[UIControl alloc]initWithFrame:viewRight.bounds];
    [viewRight addSubview:control];
    [control addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
    viewLeft.hidden = NO;
    homeScroll.scrollEnabled = YES;
    
}
//将界面还原到初始状态，即收起菜单栏
- (void)begin
{
    
    [UIView animateWithDuration:0.3 animations:^{
        homeScroll.contentOffset = CGPointMake(240, 0);} completion:nil];
    control.hidden = YES;
}
#pragma mark -- 代理方法，监听homescroll的偏移量，
-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if (scrollView.contentOffset.x == 240) {
        control.hidden = YES;
        homeScroll.scrollEnabled = NO;
    }
}


-(void)more
{
    rightBtn.selected = !rightBtn.selected;
    if (rightBtn.selected == YES) {
        
         //viewMore.hidden = NO;
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"ico_content_open.png"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{viewMore.frame = CGRectMake(0, 44, 320, 30);} completion:nil];
    }
    else if(rightBtn.selected == NO){
        
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"bg_item9.png"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{viewMore.frame = CGRectMake(0, 14, 320, 30);} completion:nil];
        //viewMore.hidden = YES;
    }
}

#pragma mark -viewRightLoad
//显示默认主界面方法
- (void)viewRightLoad
{
    viewRight = [[UIView alloc]initWithFrame:CGRectMake(240, 0, 320, 460)];
    [homeScroll addSubview:viewRight];
    
    
   
    UIImage *imageBack = [UIImage imageNamed:@"backgroud2"];
    UIImageView *imageViewBack = [[UIImageView alloc]initWithImage:imageBack];
    imageViewBack.frame = viewRight.bounds;
    [viewRight addSubview:imageViewBack];
    

    //头条
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 320, 200)];
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.backgroundColor = [UIColor clearColor];
    scroll.showsHorizontalScrollIndicator = NO;
    
    [viewRight addSubview:scroll];
    
    
    
    //创建更多新闻视图
    viewMore = [[UIView alloc]initWithFrame:CGRectMake(0, 14, 320, 30)];
    viewMore.backgroundColor = [UIColor colorWithRed:0.0706 green:0.4863 blue:0.6510 alpha:1];
    viewMore.alpha = 1 ;
    //viewMore.hidden = YES;
    [viewRight addSubview:viewMore];

    
    //自定义导航栏
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [viewRight addSubview:view];
    
    //导航栏主题
    UILabel *lableR1 = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -25, 5, 50, 30)];
    lableR1.backgroundColor = [UIColor clearColor];
    lableR1.text = @"新 闻";
    lableR1.textColor = [UIColor blackColor];
    [view addSubview:lableR1];
    
    
    //功能按钮
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_right_more_select.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    //更多按钮
    view3 = [[UIView alloc]initWithFrame:CGRectMake(290, 5, 25, 25)];
    rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 25, 25);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"bg_item9.png"] forState:UIControlStateNormal];
    [view3 addSubview:rightBtn];
    [view addSubview:view3];
    [rightBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
     
    
    




    
    

    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:scroll.bounds];
    
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
    [scroll addSubview:animatedImageView];
    
    

    
    
    UIScrollView *scrollMore = [[UIScrollView alloc]initWithFrame:CGRectMake(30, 0, 290, 30)];
    scrollMore.contentSize = CGSizeMake(540, 30);
    scrollMore.delegate = self;
    scrollMore.showsHorizontalScrollIndicator = NO;
    [viewMore addSubview:scrollMore];
    
    
    UIImageView *imageViewM = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imageViewM setImage:[UIImage imageNamed:@"fenghuang.png"]];
    [viewMore addSubview:imageViewM];
    
      //给srollMore添加按钮
      for (int i = 0; i < 9; i ++) {
        btnM = [[UIButton alloc]initWithFrame:CGRectMake(0 + i*60, 0, 60, 30)];
        UILabel *lableM = [[UILabel alloc]initWithFrame:CGRectMake(58, 5, 2, 20)];
        lableM.backgroundColor = [UIColor whiteColor];
        btnM.tag = i + 9;
        btnM.backgroundColor = [UIColor colorWithRed:0.0706 green:0.4863 blue:0.6510 alpha:1];
        [btnM addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
        [self setButtonTitle:btnM];
        
        [scrollMore addSubview:btnM];
        [btnM addSubview:lableM];
    }
    
    
    
    
    //视图中间的分隔线
    UILabel *lableX1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 244, 320, 2)];
    lableX1.backgroundColor = [UIColor colorWithRed:0.0706 green:0.4863 blue:0.6510 alpha:1];
    [viewRight addSubview:lableX1];
    
    
    UIView *viewX = [[UIView alloc]initWithFrame:CGRectMake(0, 246, 320, 32)];
    UILabel *lableX = [[UILabel alloc]initWithFrame:CGRectMake(10, 2, 100, 30)];
    lableX.text = @"热门推荐";
    lableX.textColor = [UIColor redColor];
    lableX.font = [UIFont fontWithName:@"GillSans-BoldItalic" size:20];
    lableX.backgroundColor = [UIColor clearColor];
    [viewX addSubview:lableX];
    [viewRight addSubview:viewX];
    
    
    
    
    //
    button = [[UIButton alloc]initWithFrame:CGRectMake(2, 236 + 44, 104, 58)];
    [viewRight addSubview:button];
    UIImage *image = [UIImage imageNamed:@"2.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView setImage:image];
    [button addSubview:imageView];
    
    
    button1 = [[UIButton alloc]initWithFrame:CGRectMake(108, 236+ 44, 104, 58)];
    [viewRight addSubview:button1];
    UIImage *image1 = [UIImage imageNamed:@"1.png"];
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:button1.bounds];
    [imageView1 setImage:image1];
    [button1 addSubview:imageView1];
    
    button2 = [[UIButton alloc]initWithFrame:CGRectMake(214, 236+ 44, 104, 58)];
    [viewRight addSubview:button2];
    UIImage *image2 = [UIImage imageNamed:@"3.png"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView2 setImage:image2];
    [button2 addSubview:imageView2];
    
    button3 = [[UIButton alloc]initWithFrame:CGRectMake(2, 296+ 44, 104, 58)];
    [viewRight addSubview:button3];
    UIImage *image3 = [UIImage imageNamed:@"4.png"];
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView3 setImage:image3];
    [button3 addSubview:imageView3];
    
    button4 = [[UIButton alloc]initWithFrame:CGRectMake(108, 296+ 44, 104, 58)];
    [viewRight addSubview:button4];
    UIImage *image4 = [UIImage imageNamed:@"5.png"];
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView4 setImage:image4];
    [button4 addSubview:imageView4];
    
    
    button5 = [[UIButton alloc]initWithFrame:CGRectMake(214, 296+ 44, 104, 58)];
    [viewRight addSubview:button5];
    UIImage *image5 = [UIImage imageNamed:@"6.png"];
    UIImageView *imageView5 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView5 setImage:image5];
    [button5 addSubview:imageView5];
    
    
    
    button6 = [[UIButton alloc]initWithFrame:CGRectMake(2, 356 + 44, 104, 58)];
    [viewRight addSubview:button6];
    UIImage *image6 = [UIImage imageNamed:@"7.png"];
    UIImageView *imageView6 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView6 setImage:image6];
    [button6 addSubview:imageView6];
    
    
    
    button7 = [[UIButton alloc]initWithFrame:CGRectMake(108, 356 + 44, 104, 58)];
    [viewRight addSubview:button7];
    UIImage *image7 = [UIImage imageNamed:@"8.png"];
    UIImageView *imageView7 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView7 setImage:image7];
    [button7 addSubview:imageView7];
    
    
    
    button8 = [[UIButton alloc]initWithFrame:CGRectMake(214, 356+ 44, 104, 58)];
    [viewRight addSubview:button8];
    UIImage *image8 = [UIImage imageNamed:@"9.png"];
    UIImageView *imageView8 = [[UIImageView alloc]initWithFrame:button.bounds];
    [imageView8 setImage:image8];
    [button8 addSubview:imageView8];
    
    
    
    
    
    //接受通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"hehe" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send2:) name:@"separate" object:nil];
    
    //定时器
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pageTimer) userInfo:nil repeats:YES];
}

//给按钮附标题
- (void)setButtonTitle:(UIButton *)btn
{
    switch (btn.tag) {
        case 9:
            [btn setTitle:@"健康" forState:UIControlStateNormal];
            break;
        case 10:
            [btn setTitle:@"卫视" forState:UIControlStateNormal];
            break;
        case 11:
            [btn setTitle:@"有报" forState:UIControlStateNormal];
            break;
        case 12:
            [btn setTitle:@"史林" forState:UIControlStateNormal];
            break;
        case 13:
            [btn setTitle:@"财经" forState:UIControlStateNormal];
            break;
        case 14:
            [btn setTitle:@"精英范" forState:UIControlStateNormal];
            break;
        case 15:
            [btn setTitle:@"年代访" forState:UIControlStateNormal];
            break;
        case 16:
            [btn setTitle:@"特约" forState:UIControlStateNormal];
            break;
        case 17:
            [btn setTitle:@"自由谈" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
- (void)pageTimer
{
    
    [scroll scrollRectToVisible:CGRectMake(320*timer, 0, 320, scroll.frame.size.height) animated:YES];
    timer ++;
    if(timer==number)
    {
        
        timer = 0;
        
    }
}
- (void)send2:(NSNotification *)notification;
{
    NSLog(@"notification = %@",notification.object);
    if (notification.object != nil) {
        muArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 22; i ++) {
            separateNewsModel *model = [[separateNewsModel alloc]init];
            model.ID = [notification.object objectAtIndex:i];
            if (model.ID.length != 0) {
                [muArray addObject:model.ID];
            }
            
    }
    

    }
    NSLog(@"MuArray = %@",muArray);
    
    
    button.tag = 0;
    button1.tag = 1;
    button2.tag = 2;
    button3.tag = 3;
    button4.tag = 4;
    button5.tag = 5;
    button6.tag = 6;
    button7.tag = 7;
    button8.tag = 8;
    
    [button  addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button1 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button4 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button5 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button6 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button7 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [button8 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
- (void)push:(UIButton *)sender
{
    secondViewController *scv = [[secondViewController alloc]init];
    videoViewController *vvc = [[videoViewController alloc]init];
    switch (sender.tag) {
        case 0:
            scv.str = [muArray objectAtIndex:2];
            scv.str1 = @"FUN 来了";
            [self presentViewController:scv animated:YES completion:^{}];
           break;
        case 1:
            scv.str = [muArray objectAtIndex:3];
            scv.str1 = @"知 道";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 2:
            scv.str = [muArray objectAtIndex:4];
            scv.str1 = @"最大声";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 3:
            scv.str = [muArray objectAtIndex:5];
            scv.str1 = @"军 魂";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 4:
            scv.str = [muArray objectAtIndex:7];
            scv.str1 = @"一周人物";
           [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 5:
            scv.str = [muArray objectAtIndex:11];
            scv.str1 = @"防 务";
            [self presentViewController:scv animated:YES completion:^{}];            
            break;
        case 6:
            scv.str = [muArray objectAtIndex:12];
            scv.str1 = @"体育评论";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 7:
            scv.str = [muArray objectAtIndex:15];
            scv.str1 = @"热追踪";
           [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 8:
            scv.str = [muArray objectAtIndex:20];
            scv.str1 = @"大学问";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        
        
        
        case 9:
            scv.str = [muArray objectAtIndex:0];
            scv.str1 = @"健 康";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 10:
            vvc.str2 = @"凤凰新闻";
            [self presentViewController:vvc animated:YES completion:^{}];
            break;
        case 11:
            scv.str = [muArray objectAtIndex:1];
            scv.str1 = @"有 报";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 12:
            scv.str = [muArray objectAtIndex:6];
            scv.str1 = @"史林拍案";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 13:
            scv.str = [muArray objectAtIndex:9];
            scv.str1 = @"财 经";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 14:
            scv.str = [muArray objectAtIndex:16];
            scv.str1 = @"精英范";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 15:
            scv.str = [muArray objectAtIndex:17];
            scv.str1 = @"年代访";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 16:
            scv.str = [muArray objectAtIndex:18];
            scv.str1 = @"特 约";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
        case 17:
            scv.str = [muArray objectAtIndex:19];
            scv.str1 = @"自由谈";
            [self presentViewController:scv animated:YES completion:^{}];
            break;
            
        default:
            break;
    }
}
- (void)send:(NSNotification *)notification
{
    
    if (notification.object != nil) {
        mainArray = notification.object;
        number = mainArray.count;
        scroll.contentSize = CGSizeMake(320 * number, 200);
        IDArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < number; i ++) {
            
            //头条
            
            btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0 + 320 * i, 0, 320, 200)];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
            imageView.backgroundColor = [UIColor grayColor];
            [btn1 addSubview:imageView];
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 160, 190, 40)];
            lable.numberOfLines = 2;
            lable.backgroundColor = [UIColor clearColor];
            [btn1 addSubview:lable];
            UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(200, 160, 160, 40)];
            lable1.backgroundColor = [UIColor clearColor];
            lable1.font = [UIFont systemFontOfSize:13];
            [btn1 addSubview:lable1];
            
            [scroll addSubview:btn1];
            btn1.tag = i + 20;
            [btn1 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
            
            headNews *model = [[headNews alloc]init];
            model = [notification.object objectAtIndex:i];
            imageView.image = model.thumbnail;
            lable.text = model.title;
            lable1.text = model.updateTime;
            self.myID = model.ID;
            if (self.myID.length != 0) {
                [IDArray addObject:self.myID];
            }
            
        }
    }
    

    

    //动画停止
    [animatedImageView stopAnimating];
}
- (void)action:(UIButton *)sender
{
    toutiaoViewConroller * snc = [[toutiaoViewConroller alloc]init];
    NSString *str = @"详 情";
    snc.str1 = str;
    
    snc.str = [IDArray objectAtIndex:(sender.tag - 20)];
    [self presentViewController:snc animated:YES completion:^{}];
    
   
}


@end
