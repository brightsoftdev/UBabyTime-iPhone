//
//  AppInfoViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppInfoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIApplication+Addition.h"

#define POCKET_SOCIAL_SINA_WEIBO_ID @"2497693760"
#define POCKET_SOCIAL_EMAIL @"PocketSocial@live.com"
#define WZC_EMAIL   @"wzc345@gmail.com"

@implementation AppInfoViewController
@synthesize iconImageView = _iconImageView;
@synthesize delegate = _delegate;

- (void)dealloc {
    [_iconImageView release];
    self.delegate = nil;
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.iconImageView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 7.0f;    
}  



- (void)dismissView
{
    [self.delegate didFinishShow];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissView];
}

#pragma mark - 
#pragma mark IBActions

- (IBAction)didClickFeedbackButton {
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    if (!picker) {
        [[UIApplication sharedApplication] presentErrorToast:@"您的设备未设置邮件账户。" withVerticalPos:kToastBottomVerticalPosition];
        return;
    }
    picker.mailComposeDelegate = self;
    [picker setSubject:@"Pocket Social 0.9.0 用户反馈"];
    [picker.navigationBar setBarStyle:UIBarStyleBlack];
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObjects:POCKET_SOCIAL_EMAIL, nil];
    NSString *emailBody = @"请将需要反馈的信息填入邮件正文，您的宝贵建议会直接送达Pocket Social开发团队。";
    [picker setToRecipients:toRecipients];
    [picker setMessageBody:emailBody isHTML:NO];
    [self presentModalViewController:picker animated:YES];
    [picker release];
}

- (IBAction)didClickFollowUsButton
{
    
}

- (IBAction)didClickEvaluateUsButton {
    NSString *urlString = @"http://itunes.apple.com/cn/app/id507420048?mt=8";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    //[[UIApplication sharedApplication] presentErrorToast:@"抱歉！请移步App Store。" withVerticalPos:kToastBottomVerticalPosition];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissModalViewControllerAnimated:YES];
}
@end