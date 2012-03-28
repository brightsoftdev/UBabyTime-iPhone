//
//  CoverPagingScrollDataSource.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NimbusPagingScrollView.h"
#import "CoverView.h"

@interface CoverPagingScrollDataSource : NSObject<NIPagingScrollViewDataSource>


@property (nonatomic, assign) id<CoverViewDelegate> coverViewDelegate;
@end
