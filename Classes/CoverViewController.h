//
//  CoverViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NimbusPagingScrollView.h"
#import "CoverPagingScrollDataSource.h"
#import "CoverPagingScrollView.h"
#import "ArticleViewController.h"

@interface CoverViewController : UIViewController<NIPagingScrollViewDelegate>
-(id)initWithCoverViewDelegate:(id<CoverViewDelegate>) coverViewDelegate;
@end
