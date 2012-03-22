//
//  LoginViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController
@synthesize weiboUserNameLabel = _weiboUserNameLabel;
@synthesize renrenUserNameLabel = _renrenUserNameLabel;
@synthesize weiboPhotoImageView = _weiboPhotoImageView, renrenPhotoImageView = _renrenPhotoImageView;
@synthesize weiboPhotoView = _weiboPhotoView, renrenPhotoView = _renrenPhotoView;

- (void)dealloc
{
    [_weiboUserNameLabel release];
    [_renrenUserNameLabel release];
    [_weiboPhotoImageView release];
    [_renrenPhotoImageView release];
    [_weiboPhotoView release];
    [_renrenPhotoView release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.weiboUserNameLabel = nil;
    self.renrenUserNameLabel = nil;
    self.weiboPhotoImageView = nil;
    self.renrenPhotoImageView = nil;
    self.weiboPhotoView = nil;
    self.renrenPhotoView = nil;
}
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.weiboPhotoView.layer.masksToBounds = YES;
    self.weiboPhotoView.layer.cornerRadius = 2.0f;
    self.renrenPhotoView.layer.masksToBounds = YES;
    self.renrenPhotoView.layer.cornerRadius = 2.0f;
}
- (IBAction)didClickInfoButton:(id)sender {
    AppInfoViewController *vc = [[AppInfoViewController alloc] init];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationCurrentContext;
    vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentModalViewController:vc animated:YES];
    [vc release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -
#pragma mark AppInfoViewController delegate

- (void)didFinishShow {
    [self dismissModalViewControllerAnimated:YES];
}
@end
