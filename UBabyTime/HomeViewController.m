//
//  HomeViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}
-(id)initWithUsername:(NSString *)user{
    if (self = [super init]) {
        _username = [user retain];
		self.title = _username;
		self.delegate = self;
		self.hidesBottomBarWhenPushed = YES;
        CurrentViewController *currentViewController = [[CurrentViewController alloc] initWithName:_username];
        TodoViewController *todoViewController = [[TodoViewController alloc] initWithName:_username];
        [self setViewControllers:[NSArray arrayWithObjects:currentViewController,[[UINavigationController alloc] initWithRootViewController:todoViewController], nil] animated:YES];
        [currentViewController release];
        [todoViewController release];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
