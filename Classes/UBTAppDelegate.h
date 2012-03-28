//
//  UBTAppDelegate.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface UBTAppDelegate : UIResponder <UIApplicationDelegate>
{

    
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
