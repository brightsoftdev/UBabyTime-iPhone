//
//  TableScroller.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableScrollerDelegate

- (NSString *)tipsForCell:(UITableViewCell *)cell;

@end

@interface TableScroller : UIImageView
{
    UITableView *_tableView;
    //UIImageView *_backgroundView;
    UILabel *_tipsLabel;
}
@property (nonatomic,retain) id<TableScrollerDelegate> delegate;

-(id)initWithDelegate:(id<TableScrollerDelegate>)delegate;

- (void)scrollViewDidScroll:(UITableViewCell*)cell;

- (void)scrollViewDidEndDecelerating;

- (void)scrollViewWillBeginDragging;

- (void) scrollerShow;

- (void) scrollerHide;
@end


