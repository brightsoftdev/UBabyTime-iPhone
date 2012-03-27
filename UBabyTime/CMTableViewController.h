//
//  CMTableViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TableScroller.h"
#import "CellViewController.h"
#import "CoverView.h"
#import "TimeLineProvider.h"


@interface CMTableViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource,TableScrollerDelegate>
{
    TableScroller *_scroller;
}

@property (nonatomic,assign)UITableView *tableView;
@end
