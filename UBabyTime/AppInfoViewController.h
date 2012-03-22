//
//  AppInfoViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
@protocol AppInfoViewControllerDelegate;

@interface AppInfoViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIImageView *iconImageView;
@property (nonatomic, assign) id<AppInfoViewControllerDelegate> delegate;

- (IBAction)didClickFeedbackButton;
- (IBAction)didClickFollowUsButton;
- (IBAction)didClickEvaluateUsButton;

@end

@protocol AppInfoViewControllerDelegate <NSObject>

- (void)didFinishShow;

@end