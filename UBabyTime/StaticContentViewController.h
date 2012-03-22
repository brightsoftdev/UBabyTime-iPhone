//
//  StaticContentViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CoverViewController.h"
@protocol StaticContentViewControllerDelegate;

@interface StaticContentViewController : UIViewController<CoverViewDelegate,ArticleViewControllerDelegate>
{
    
}

@property (nonatomic, assign) id<StaticContentViewControllerDelegate> delegate;
@property (nonatomic, retain) UIViewController *currentController;
@property (nonatomic,assign)  NSString *labelIdentifier;

-(id)initWithLabelIdentifier:(NSString *)labelIdentifier;
-(void)addContentByLabelIdentifier:(NSString*)labelIdentifier;

@end


@protocol StaticContentViewControllerDelegate

@end