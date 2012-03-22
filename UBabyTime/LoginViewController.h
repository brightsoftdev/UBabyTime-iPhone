//
//  LoginViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppInfoViewController.h"

@interface LoginViewController : UIViewController<AppInfoViewControllerDelegate>
@property(nonatomic, retain) IBOutlet UILabel *weiboUserNameLabel;
@property(nonatomic, retain) IBOutlet UILabel *renrenUserNameLabel;
@property(nonatomic, retain) IBOutlet UIImageView *weiboPhotoImageView;
@property(nonatomic, retain) IBOutlet UIImageView *renrenPhotoImageView;
@property(nonatomic, retain) IBOutlet UIView *weiboPhotoView;
@property(nonatomic, retain) IBOutlet UIView *renrenPhotoView;

- (IBAction)didClickInfoButton:(id)sender;
@end
