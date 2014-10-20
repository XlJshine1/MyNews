//
//  SearchViewController.m
//  News
//
//  Created by xionglj on 14-9-28.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchModel.h"
#import "SearchDetailController.h"
#import "SearchCell.h"

@implementation SearchViewController

{
    UIImageView  * animatedImageView;
    UIView  *view10;
    UITableView *mytableView;
    NSMutableArray *arrayImage0;
    NSInteger number;
    NSArray *array;
    NSMutableArray *arrayTitle;
    NSMutableArray *arraySource;
    NSMutableArray *arrayImageUrl;
    NSMutableArray *arrayUrl;
    NSMutableArray *arrayImage;
    UITextField *field;
    
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [self.view addSubview:view];
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -40, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.textAlignment = UITextAlignmentCenter;
    lableH.text = @"搜 索";
    lableH.textColor = [UIColor blackColor];
    [view addSubview:lableH];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIView * searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 40)];
    searchView.backgroundColor = [UIColor colorWithRed:0.0706 green:0.4863 blue:0.6510 alpha:1];    
    [self.view addSubview:searchView];
    
    
    field = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, 270, 30)];
    field.borderStyle = UITextBorderStyleLine;
    field.backgroundColor = [UIColor whiteColor];
    field.delegate = self;
    [searchView addSubview:field];
    
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(280, 5, 30, 30)];
    UIImage *image = [UIImage imageNamed:@"search.png"];
    [searchBtn setImage:image forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:searchBtn];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 39, 320, 1)];
    lable.backgroundColor = [UIColor colorWithRed:0.0706 green:0.4863 blue:0.6510 alpha:1];

    [searchView addSubview:lable];
    
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 84, 320, 376) style:UITableViewStylePlain];
    
    mytableView.delegate = self;
    mytableView.dataSource = self;
    
    mytableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:mytableView];
    
    
    
    mytableView.separatorColor = [UIColor clearColor];
    mytableView.backgroundColor = [UIColor whiteColor];
    mytableView.showsVerticalScrollIndicator = NO;
    
    
    arrayImage = [[NSMutableArray alloc]init];
    
    
    arrayImageUrl = [[NSMutableArray alloc]init];
    
    arraySource = [[NSMutableArray alloc]init];
    arrayTitle = [[NSMutableArray alloc]init];
    arrayUrl = [[NSMutableArray alloc]init];
    
    
  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send:) name:@"toSearchView" object:nil];
  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(send2:) name:@"toSearchView2" object:nil];
    
}
- (void)search
{
    NSString *str0 = field.text;
    NSString *str1 = [str0 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    SearchEntity *entity = [[SearchEntity alloc]init];
    NSString *str = [NSString stringWithFormat:@"http://ic.snssdk.com/2/article/v11/search/?keyword=%@&offset=0&count=20&iid=2321753631&device_id=2746999911&ac=wifi&channel=huawei&aid=13&app_name=news_article&version_code=362&device_platform=android&device_type=H30-U10&os_api=17&os_version=4.2.2&uuid=359209021254366&openudid=c892a205deb2cb3c",str1];
    NSURL *url = [NSURL URLWithString:str];
    [entity getNews:url];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/*- (void)send:(NSNotification *)notication
{
    SearchModel *model = [[SearchModel alloc]init];
    model = notication.object;
    
    
    [arrayImageUrl addObject:model.image_url];
    [arraySource addObject:model.source];
    [arrayTitle addObject:model.title];
    [arrayUrl addObject:model.url];
    
    [mytableView reloadData];
      
}*/

- (void)send:(NSNotification *)notication
{
    array = notication.object;
    //arrayImageUrl = [[NSMutableArray alloc]init];
    arraySource = [[NSMutableArray alloc]init];
    arrayTitle = [[NSMutableArray alloc]init];
    arrayUrl = [[NSMutableArray alloc]init];
    number = array.count;
    for (int i = 0; i < number; i ++) {
        SearchModel *model = [[SearchModel alloc]init];
        model = [array objectAtIndex:i];
        
        //[arrayImageUrl addObject:model.image_url];
        [arraySource addObject:model.source];
        [arrayTitle addObject:model.title];
        [arrayUrl addObject:model.url];
    
    }
    
    

    [mytableView reloadData];
    
    mytableView.separatorColor = [UIColor grayColor];
    
}
- (void)send2:(NSNotification *)notication
{
    UIImage *image = notication.object;
    [arrayImage addObject:image];
    
    [mytableView reloadData];
    
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
    
    
   /* CGFloat contentWidth = mytableView.frame.size.width;
    UIFont *Font = [UIFont systemFontOfSize:15];
    NSString *content = [arrayTitle objectAtIndex:indexPath.row];
    
    CGSize size = [content sizeWithFont:Font constrainedToSize:CGSizeMake((contentWidth - 70), 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
    
    if (size.height + 20 < 55) {
        return 55;
    }
    else{
      return size.height +20;
    }*/
    
    return 70;
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
     SearchCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  
    }
   

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [arrayTitle objectAtIndex:indexPath.row];
    
    SearchModel *model = [[SearchModel alloc]init];
    model = [array objectAtIndex:indexPath.row];
    
    WebImageView *image = [[WebImageView alloc]initWithFrame:CGRectMake(248, 2, 70, 68)];
    [image setImageURL:[NSURL URLWithString:model.image_url]];
    [cell.contentView addSubview:image];
    
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self create:indexPath];
    
}
- (void)create:(NSIndexPath *)indexPath
{
    SearchDetailController *sdc = [[SearchDetailController alloc]init];
    sdc.str = [arrayUrl objectAtIndex:indexPath.row];
    [self presentViewController:sdc animated:YES completion:^{}];
}




@end
