//
//  videoNewsController2.h
//  News
//
//  Created by xionglj on 14-9-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface videoNewsController2 : UIViewController
{
    MPMoviePlayerController *moviePalyer;
     NSInteger number;
}
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)NSArray *IDarray;
@property(nonatomic,strong)NSArray *Titlearray;
@property(nonatomic,strong)NSString *Number;
- (void)sender:(NSNotification *)notification;
@end
