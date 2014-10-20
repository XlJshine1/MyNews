//
//  videoViewController.m
//  News
//
//  Created by xionglj on 14-9-21.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "videoViewController.h"
#import "videoNewsEntity.h"
#import "videoCell.h"
#import "videoNewsController2.h"

@implementation videoViewController
{
    UITableView *mytableView;
    UIImageView  * animatedImageView;
    UIButton *btn;
    UIButton *btn1;
}
@synthesize array,arrayUrl,arrayImage,arrayTitle,str2;
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
    
    NSString *str = @"http://api.3g.ifeng.com//news/zhuanti/sbjszqh/sbjszqhi?json=y";
    NSURL *url = [NSURL URLWithString:str];
    videoNewsEntity *entity = [[videoNewsEntity alloc]init];
    [entity getNews:url];
    
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
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view10.bounds.size.width/2 -35, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.text = str2;
    lableH.textColor = [UIColor blackColor];
    [view10 addSubview:lableH];
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 416) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
    
    
    //加载动画
    animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    animatedImageView.animationImages = [NSArray arrayWithObjects:   
                                         
                                         [UIImage imageNamed:@"0.gif"],
                                         [UIImage imageNamed:@"1.tiff"],
                                         [UIImage imageNamed:@"2.tiff"],
                                         [UIImage imageNamed:@"3.tiff"],
                                         [UIImage imageNamed:@"4.tiff"],
                                         [UIImage imageNamed:@"5.tiff"],
                                         [UIImage imageNamed:@"6.tiff"],
                                         [UIImage imageNamed:@"7.tiff"],
                                         [UIImage imageNamed:@"8.tiff"],
                                         [UIImage imageNamed:@"9.tiff"],
                                         [UIImage imageNamed:@"10.tiff"],
                                         
                                         
                                         nil];
    animatedImageView.animationDuration = 0.8f;
    
    animatedImageView.animationRepeatCount = 0;
    
    [animatedImageView startAnimating];
    
    
    mytableView.backgroundView = animatedImageView;
    mytableView.separatorColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sender:) name:@"toVideo" object:nil];
}
- (void)sender:(NSNotification *)notification
{
    array = notification.object;
    NSLog(@"array=======%@",array);
    arrayUrl = [[NSMutableArray alloc]init];
    arrayTitle = [[NSMutableArray alloc]init];
    arrayImage = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < array.count; i++) {
        videoNewsModel *model = [[videoNewsModel alloc]init];
        model = [array objectAtIndex:i];
        NSString *image = model.image;
        NSString *title = model.title;
        NSString *url = model.url;
        
        [arrayImage addObject:image];
        [arrayTitle addObject:title];
        [arrayUrl addObject:url];
        
        
    }
    NSLog(@"===%@",arrayImage);
    [animatedImageView stopAnimating];
    mytableView.separatorColor = [UIColor clearColor];
    mytableView.backgroundColor = [UIColor colorWithRed:0.1529 green:0.3843 blue:0.6824 alpha:1];
    //刷新tableView的数据，很重要
    [mytableView reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    videoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[videoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    
    cell.textLabel.text = [arrayTitle objectAtIndex:indexPath.row];
    

    WebImageView *image = [[WebImageView alloc]initWithFrame:CGRectMake(235, 9, 80, 68)];
    [image setImageURL:[NSURL URLWithString:[arrayImage objectAtIndex:indexPath.row]]];
    [cell.contentView addSubview:image];
    
    

    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [self create:indexPath];
    
}
- (void)create:(NSIndexPath *)indexPath
{
    videoNewsController2 *vnc = [[videoNewsController2 alloc]init];
    vnc.Titlearray = arrayTitle;
    NSString *a = [NSString stringWithFormat:@"%i",indexPath.row];
    vnc.Number = a ;
    vnc.IDarray = arrayUrl;
    //vnc.str = [arrayUrl objectAtIndex:indexPath.row];
    [self presentViewController:vnc animated:YES completion:^{}];
}


@end
