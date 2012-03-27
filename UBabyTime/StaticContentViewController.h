//
//  StaticContentViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LabelConverter.h"
#import "CoverViewController.h"
#import "TimeLineViewController.h"
#import "CMTableViewController.h"
@protocol StaticContentViewControllerDelegate;

@interface StaticContentViewController : UIViewController<CoverViewDelegate,ArticleViewControllerDelegate>
{
    
}

@property (nonatomic, assign) id<StaticContentViewControllerDelegate> delegate;
@property (nonatomic, retain) UIViewController *currentController;
@property (nonatomic,assign)  NSString *labelIdentifier;

-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier;
-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier withAnimationOptions:(UIViewAnimationOptions)options;

@end


@protocol StaticContentViewControllerDelegate

@end