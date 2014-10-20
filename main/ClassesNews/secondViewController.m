//
//  secondViewController.m
//  News
//
//  Created by xionglj on 14-9-17.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "secondViewController.h"
#import "tableViewEntity.h"
#import "tableViewCell.h"
#import "deailViewController.h"
#import "PullRefreshTableViewController.h"
#import "WebImageView.h"
#import "headNews.h"
@implementation secondViewController
{
    UIImageView  * animatedImageView;
    UIView  *view10;
    UITableView *mytableView;
    NSMutableArray *arrayImage0;
    tableViewCell *cell;
    NSInteger number;
}
@synthesize str,str1,array,arrayId,arrayThum,arrayTitle,arrayUpdateTime,arrayImageData;


- (void)back
{
      [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
      arrayImage0 = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor grayColor];
    
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
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 416) style:UITableViewStylePlain];
   
    mytableView.delegate = self;
    mytableView.dataSource = self;
    
    mytableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:mytableView];
    
    
    NSLog(@"str = %@",str);

    
    
    NSURL *url = [NSURL URLWithString:str];
    tableViewEntity *entity = [[tableViewEntity alloc]init];
    [entity getNews:url];
    
    
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
    mytableView.backgroundColor = [UIColor whiteColor];
    mytableView.showsVerticalScrollIndicator = NO;
         
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"totableView" object:nil];

    
    
}

- (void)send:(NSNotification *)notification
{
    array = notification.object;
    number = array.count;
    NSLog(@"array = %@",array);
    arrayId = [[NSMutableArray alloc]init];
    arrayThum = [[NSMutableArray alloc]init];
    arrayTitle = [[NSMutableArray alloc]init];
    arrayUpdateTime = [[NSMutableArray alloc]init];
    arrayImageData = [[NSMutableArray alloc]init];

    for (int i = 0; i < number; i ++) {
        headNews *model = [[headNews alloc]init];
        model = [array objectAtIndex:i];
        [arrayThum addObject:model.thumbnail1];
        [arrayId addObject:model.ID];
        [arrayTitle addObject:model.title];
        [arrayUpdateTime addObject:model.updateTime];
     }
     
    
    [mytableView reloadData];
    
    //终止加载动画
    [animatedImageView stopAnimating];
     mytableView.backgroundColor = [UIColor colorWithRed:0.4510 green:0.8275 blue:0.9843 alpha:1];
    
     mytableView.separatorColor = [UIColor clearColor];
     mytableView.backgroundView = nil;
    
    
    
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
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    //cell.imageView.image = [arrayThum objectAtIndex:indexPath.row];
    
    
    headNews *model = [[headNews alloc]init];
    model = [array objectAtIndex:indexPath.row];
    WebImageView *image = [[WebImageView alloc]initWithFrame:CGRectMake(223, 7, 90, 76)];
    [image setImageURL:[NSURL URLWithString:model.thumbnail1]];
    [cell.contentView addSubview:image];
    
    cell.textLabel.text = [arrayTitle objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [arrayUpdateTime objectAtIndex:indexPath.row];
    
    cell.btn.tag = indexPath.row + 10;
    
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
    deailViewController *dec = [[deailViewController alloc]init];
    dec.IDarray = arrayId;
    NSString *a = [NSString stringWithFormat:@"%i",indexPath.row];
    dec.Number = a ;
    dec.Titlearray = arrayTitle;
    dec.imageData = arrayThum;
    dec.Timearray = arrayUpdateTime;
    dec.Urlarray = arrayId;
    [self presentViewController:dec animated:YES completion:^{}];
}




@end
