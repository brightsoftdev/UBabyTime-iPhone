//
//  TimeLineProvider.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "UIView+AUISelectiveBorder.h"

#define CELL_HEIGHT 160.0f
#define CELL_WIDTH 306.0f
#define TIPS_BUBBLE_WIDTH 205.0f
#define SPREAD_LINE_OFFSET_X 60.0f


@interface TimeLineProvider : NSObject


+(void)populateCell:(UITableViewCell *)cell;

+(NSString *)convertIndexPathToDate:(NSIndexPath *)indexPath;

+(NSString *)convertIndexPathToWeek:(NSIndexPath *)indexPath;
@end
