//
//  HomeViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentViewController.h"
#import "TodoViewController.h"

@interface HomeViewController : UITabBarController<UITabBarControllerDelegate>
{
    NSString *_username;
}
-(id)initWithUsername:(NSString *)user;
@end
