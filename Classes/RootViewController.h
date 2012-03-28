//
//  RootViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LabelBarViewController.h"
#import "StaticContentViewController.h"
#import "LoginViewController.h"

@interface RootViewController : UIViewController<LabelBarViewControllerDelegate,StaticContentViewControllerDelegate>
{
    LabelBarViewController *_labelBarViewController;
    StaticContentViewController *_contentViewController;
    NSMutableDictionary *_openedUserHeap;
}
@property (nonatomic, retain) LabelBarViewController *labelBarViewController;
@property (nonatomic, retain) StaticContentViewController *contentViewController;

@end
