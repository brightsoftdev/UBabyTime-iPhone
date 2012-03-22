//
//  CoverView.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NimbusPagingScrollView.h"

@protocol CoverViewDelegate;

@interface CoverView : UIView<NIPagingScrollViewPage>
@property (nonatomic, retain) IBOutlet UIView *titleView;
@property (nonatomic, retain) IBOutlet UIView *tipsView;
@property (nonatomic, retain) IBOutlet UIView *proposalView;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *tipsImage;
@property (nonatomic, retain) IBOutlet UITextView *tipsText;
@property (nonatomic, retain) IBOutlet UITextView *proposalText;
@property (nonatomic, retain) IBOutlet UIButton *proposalDetailButton;
@property (nonatomic, assign) id<CoverViewDelegate> coverViewDelegate;
-(IBAction)proposalDetailButtonClick:(id)sender;

@end


@protocol CoverViewDelegate

-(void)proposalDetailButtonClick:(id)sender;

@end
