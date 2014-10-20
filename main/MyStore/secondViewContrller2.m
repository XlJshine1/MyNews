//
//  secondViewContrller2.m
//  News
//
//  Created by xionglj on 14-9-26.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "secondViewContrller2.h"
#import "tableViewCell.h"
#import "headNews.h"
#import "WebImageView.h"
#import "UserModel.h"
#import "UserDB.h"
#import "detailViewController2.h"
@implementation secondViewContrller2
{
    UIImageView  * animatedImageView;
    UIView  *view10;
    UITableView *mytableView;
    NSMutableArray *arrayImage0;
    
    tableViewCell *cell;
    NSInteger number;
}
@synthesize array;
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建表－－只调用一次
    [[UserDB shareInstance]createTable];
    
    

    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [self.view addSubview:view];
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -40, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.text = @"我的收藏";
    lableH.textColor = [UIColor blackColor];
    [view addSubview:lableH];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 416) style:UITableViewStylePlain];
    
    mytableView.delegate = self;
    mytableView.dataSource = self;
    
    mytableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:mytableView];
    
    
   
    mytableView.separatorColor = [UIColor clearColor];
    mytableView.backgroundColor = [UIColor whiteColor];
    mytableView.showsVerticalScrollIndicator = NO;
    
   
    
    [self loadData];
    
}
- (void)loadData
{
    self.array = [[UserDB shareInstance]findUsers];
    [mytableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
    
}

#pragma mark - Table view data source

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
    return 88;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[tableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    UserModel *user = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = user.title;
    cell.detailTextLabel.text = user.time;

//    headNews *model = [[headNews alloc]init];
//    model = [array objectAtIndex:indexPath.row];
    WebImageView *image = [[WebImageView alloc]initWithFrame:CGRectMake(223, 7, 90, 76)];
    [image setImageURL:[NSURL URLWithString:user.image]];
    [cell.contentView addSubview:image];
    //cell.imageView.image = [UIImage imageNamed:@"shandian.png"];
    
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self create:indexPath];
    
}
- (void)create:(NSIndexPath *)indexPath
{
    detailViewController2 *dec = [[detailViewController2 alloc]init];
    UserModel *user1 = [self.array objectAtIndex:indexPath.row];
    dec.str = user1.url;
    dec.Title = user1.title;
    [self presentViewController:dec animated:YES completion:^{}];
}


@end
