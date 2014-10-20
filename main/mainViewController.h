//
//  mainViewController.h
//  News
//
//  Created by xionglj on 14-9-16.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "secondViewController.h"
@interface mainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSString *myID;
@property(nonatomic,strong)NSString *myID1;
@property(nonatomic,strong)NSString *myID2;
@property(nonatomic,strong)NSMutableArray *muArray;
@property(nonatomic,strong)UINavigationController *myViewController;
@property(nonatomic,strong)NSArray *mainArray;
@property(nonatomic,strong)NSMutableArray *IDArray;
- (void)viewRightLoad;   //主界面
- (void)viewLeftLoad;   //左侧工具栏
- (void)resourceRequest; //资源请求
- (void)NetConnection; //网络判断
- (void)setButtonTitle:(UIButton *)btn;
//单个文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath;
//遍历文件夹获得文件夹大小，返回多少M
- (float ) folderSizeAtPath:(NSString*) folderPath;
@end
