//
//  TimeLineProvider.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TimeLineProvider.h"
@interface TimeLineProvider()
+(NSDate *)pregnancyDate;
+(NSDate *)dateFromPregnancy:(NSInteger)day;
@end


@implementation TimeLineProvider


+(void)populateCell:(UITableViewCell *)cell{
    CGFloat cellHeight = CELL_HEIGHT;
    //CGFloat cellWidth = CELL_WIDTH;
    
    UIImageView *sp = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SPREAD_LINE_OFFSET_X, cellHeight+10)] autorelease];
    sp.selectiveBorderFlag = AUISelectiveBordersFlagRight;
    sp.selectiveBordersColor = [UIColor lightGrayColor];
    sp.selectiveBordersWidth = 1.5;
    [cell addSubview:sp];
    
    UIImage *dotImg = [UIImage imageNamed:@"feed-dot-large-overlay"];
    UIImage *storyImg = [UIImage imageNamed:@"feed-story-place-food"];
    UIImageView *dot = [[[UIImageView alloc] initWithImage:dotImg] autorelease];
    UIImageView *story = [[[UIImageView alloc] initWithImage:storyImg] autorelease];
    dot.frame = CGRectMake(SPREAD_LINE_OFFSET_X-dotImg.size.width/2, 5, CGRectGetWidth(dot.frame), CGRectGetHeight(dot.frame));
    dot.backgroundColor = [UIColor greenColor];
    [cell addSubview:dot];
    story.center = dot.center;
    [cell addSubview:story];
    
    UIImage *proposalImg = [UIImage imageNamed:@"table-checked"];
    UIImageView *proposalImgView = [[[UIImageView alloc] initWithImage:proposalImg] autorelease];
    proposalImgView.frame = CGRectMake(SPREAD_LINE_OFFSET_X-dotImg.size.width/2, cellHeight*2/3-3, CGRectGetWidth(dot.frame), CGRectGetHeight(dot.frame));
    [cell addSubview:proposalImgView];
    
    //    UIImageView *accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activity-chevron-highlighted"]];
    //    CGRect accessoryFrame = CGRectMake(cell.accessoryView.frame.origin.x, cell.accessoryView.frame.origin.y, 30, cell.accessoryView.frame.size.height);
    //    cell.accessoryView.frame = accessoryFrame;
    //    cell.accessoryView = accessory;
    //    [accessory release];
    
    CGRect tipsViewFrame = CGRectMake(SPREAD_LINE_OFFSET_X+10, 0, TIPS_BUBBLE_WIDTH, (cellHeight*2)/3);
    UIView *tipsView = [[[UIView alloc] initWithFrame:tipsViewFrame] autorelease];
    tipsView.backgroundColor = [UIColor clearColor];
    
    
    CGRect titleFrame = CGRectMake(0, 0, tipsViewFrame.size.width, tipsViewFrame.size.height/3);
    UITextView *title = [[[UITextView alloc] initWithFrame:titleFrame] autorelease];
    title.backgroundColor = [UIColor clearColor];
    title.text = @"小贴士";
    [title setEditable:NO];
    [title setScrollEnabled:NO];
    title.font = [UIFont boldSystemFontOfSize:14];
    title.textColor = [UIColor brownColor];
    [tipsView addSubview:title];
    
    CGRect tipsFrame = CGRectMake(0, tipsViewFrame.size.height/5, tipsViewFrame.size.width, (tipsViewFrame.size.height*2)/3);
    //tips bg
    UIImage *tipsBG = [[UIImage imageNamed:@"feed-comment-bubble"] stretchableImageWithLeftCapWidth:40 topCapHeight:10];
    UIImageView *tipsBGView = [[[UIImageView alloc] initWithImage:tipsBG] autorelease];
    tipsBGView.frame =CGRectMake(5, tipsViewFrame.size.height/5+3, tipsFrame.size.width, tipsFrame.size.height+5);
    [tipsView addSubview:tipsBGView];
    
    UITextView *tips = [[[UITextView alloc] initWithFrame:tipsFrame] autorelease];
    tips.backgroundColor = [UIColor clearColor];
    tips.text = @"测试一下测试一宿啊测试一下测试测试一下测试一宿啊测试一下测试测试一下测试一宿啊测试一下测试测试一下测试一宿啊测试一下测试";
    [tips setEditable:NO];
    [tips setScrollEnabled:NO];
    tips.font = [UIFont systemFontOfSize:12];
    tips.textColor = [UIColor lightGrayColor];
    [tipsView addSubview:tips];
    [cell addSubview:tipsView];
    
    
    CGRect proposalViewFrame = CGRectMake(SPREAD_LINE_OFFSET_X+10, tipsViewFrame.size.height-10,TIPS_BUBBLE_WIDTH, cellHeight/3);
    UIView * proposalView = [[UIView alloc] initWithFrame:proposalViewFrame];
    proposalView.backgroundColor = [UIColor clearColor];
    
    
    CGRect proposalTitleFrame = CGRectMake(0, 0, proposalViewFrame.size.width, proposalViewFrame.size.height/2);
    UITextView *proposal = [[[UITextView alloc] initWithFrame:proposalTitleFrame] autorelease];
    proposal.backgroundColor = [UIColor clearColor];
    proposal.text = @"运动建议";
    [proposal setEditable:NO];
    [proposal setScrollEnabled:NO];
    proposal.font = [UIFont systemFontOfSize:14];
    proposal.textColor = [UIColor brownColor];
    [proposalView addSubview:proposal];
    
    CGRect proposalTextFrame = CGRectMake(0, proposalTitleFrame.size.height, proposalViewFrame.size.width, proposalViewFrame.size.height/2);
    UITextView *proposalText = [[[UITextView alloc] initWithFrame:proposalTextFrame] autorelease];
    proposalText.backgroundColor = [UIColor clearColor];
    proposalText.text = @"去散步吧";
    [proposalText setEditable:NO];
    [proposalText setScrollEnabled:NO];
    proposalText.font = [UIFont systemFontOfSize:12];
    proposalText.textColor = [UIColor lightGrayColor];
    [proposalView addSubview:proposalText];
    
    [cell addSubview:proposalView];
}


+(NSString *)convertIndexPathToDate:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    NSDate *date = [self dateFromPregnancy:row+section*7];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    return [NSString stringWithFormat:@"%d/%d",components.month,components.day];
}

+(NSString *)convertIndexPathToWeek:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    NSDate *date = [self dateFromPregnancy:row+section*7];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    NSInteger weekday = components.weekday;
    return [NSString stringWithFormat:@"%d",weekday];
}
+(NSDate *)pregnancyDate{
    NSDate *today = [NSDate date];
    NSDate *preg = [today dateByAddingTimeInterval:-50*24*60*60];
    return preg;
    //NSCalendar *calendar = [NScalendar 
    //today dateByAddingTimeInterval:<#(NSTimeInterval)#>
}

+(NSDate *)dateFromPregnancy:(NSInteger)day{
    NSDate *preg = [self pregnancyDate];
    return [preg dateByAddingTimeInterval:day*24*60*60];
}

@end
