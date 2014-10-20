//
//  ZhezhiViewController.m
//  News
//
//  Created by xionglj on 14-10-9.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "ZhezhiViewController.h"

@implementation ZhezhiViewController
{
    NSArray *_array;
    NSArray *_array0;
    NSArray *_array1;
    NSArray *_array2;
    float cache;
    UITableView *myTableView;
    UILabel *lable;
    UIAlertView *alert;
}
@synthesize strCH;
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cache = [strCH floatValue];
    //将要加入cell中，解决重影问题
    lable = [[UILabel alloc]initWithFrame:CGRectMake(175, 2, 100, 24)];
   
    //导航栏
    UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIImageView *imageView10 = [[UIImageView alloc]initWithFrame:view.bounds];
    [imageView10 setImage:[UIImage imageNamed:@"navigation2.png"]];
    [view addSubview:imageView10];
    [self.view addSubview:view];
    
    
    UILabel *lableH = [[UILabel alloc]initWithFrame:CGRectMake(view.bounds.size.width/2 -25, 5, 80, 30)];
    lableH.backgroundColor = [UIColor clearColor];
    lableH.text = @"设 置";
    lableH.textColor = [UIColor blackColor];
    [view addSubview:lableH];
    
    //实例化tableView
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 416) style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.scrollEnabled = NO;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_repeat.png"]];
    imageView.frame = myTableView.bounds;
    UIView *bgView = [[UIView alloc]initWithFrame:myTableView.bounds];
    [bgView addSubview:imageView];
    
    myTableView.backgroundView = bgView;
    [self.view addSubview:myTableView];
    
    //返回按钮
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 25, 25)];
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 25, 25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_back_unselect.png"] forState:UIControlStateNormal];
    [view2 addSubview:leftBtn];
    [view addSubview:view2];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"Make" withExtension:@"plist"];
    _array = [NSArray arrayWithContentsOfURL:url];
    _array0 = [_array objectAtIndex:0];
    _array1 = [_array objectAtIndex:1];
    _array2 = [_array objectAtIndex:2];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _array0.count;
    }
    else if(section == 1)
    {
        return _array1.count;
    }
    else
    {
        return _array2.count;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 28;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [[_array objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    if (indexPath.section == 0&&indexPath.row != 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
       
    }
    if (indexPath.section == 2) {
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0&&indexPath.row == 4) {
        [cell.contentView addSubview:lable];
        lable.textAlignment = UITextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:14];
        lable.backgroundColor = [UIColor clearColor]; 
        lable.text = [NSString stringWithFormat:@"当前缓存%0.2fM",cache];
        [cell.contentView addSubview:lable];
    }
    
    
    return cell;
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
    
    NSString * fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
        
    }
    
    return folderSize/(1024.0*1024.0);
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 4) {
        


        //提示窗弹出
        alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否确定清理缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        

    }
}

#pragma mark -- UIAlertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
       //删除缓存
        
        NSString *cachPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PermanentStore"];
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        
        NSLog(@"files :%d",[files count]);
        
        for (NSString *p in files) {
            
            NSError *error;
            
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                
            }
            
        }
        //计算缓存文件大小
        float a =  [self folderSizeAtPath:cachPath];
        cache = a;
        
        [myTableView reloadData];
        
    }
    else return;
}
@end
