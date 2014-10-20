//
//  WebImageView.h
//  ASIHttpDemo2
//
//  Created by xionglj on 14-8-29.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//



@interface WebImageView : UIImageView<UIWebViewDelegate>

- (void)setImageURL:(NSURL *)url;
- (void)synchronous:(NSURL *)url;
- (void)aSynchronous:(NSURL *)url;
@end
