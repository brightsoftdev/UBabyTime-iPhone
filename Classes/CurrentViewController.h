//
//  CurrentViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuadCurveMenu.h"
#import "NimbusPagingScrollView.h"
#import "ArticlePagingScrollDataSource.h"
#import "ArticlePagingScrollView.h"


@interface CurrentViewController : UIViewController<QuadCurveMenuDelegate,NIPagingScrollViewDelegate>
{
    @private
    ArticlePagingScrollView *_pagingScrollView;
}
@property (nonatomic, readonly, retain) NIPagingScrollView *pagingScrollView;

-(id)initWithName:(NSString *)name;
@end
