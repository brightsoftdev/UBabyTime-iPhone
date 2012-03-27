//
//  TimeLineViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeScroller.h"
@interface TimeLineViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource,TimeScrollerDelegate>

{
    
}

@property (nonatomic,retain)TimeScroller * timeScroller;
@property (nonatomic,assign)UITableView *tableView;
-(id)init;
@end
