//
//  CurrentViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CurrentViewController.h"


@implementation CurrentViewController

@synthesize pagingScrollView = _pagingScrollView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithName:(NSString *)name{
    if(self = [self initWithStyle:UITableViewStyleGrouped]){
        self.title = @"Current";
		self.tabBarItem.image = [UIImage imageNamed:@"tabbar_events.png"];
        self.tabBarItem.badgeValue = @"123";
        self.view.layer.contents = (id)[UIImage imageNamed:@"tabview_bg.png"].CGImage;
    }
    return self;
}



- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _pagingScrollView = [[[ArticlePagingScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 389)] autorelease];
    _pagingScrollView.dataSource = [[ArticlePagingScrollDataSource alloc] init];
    _pagingScrollView.delegate = self;
    [_pagingScrollView reloadData];
    [self.view addSubview:_pagingScrollView];
}

- (void)viewDidUnload
{
    [_pagingScrollView release];
    _pagingScrollView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
   
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark NIPagingScrollViewDelegate

- (void)pagingScrollViewDidScroll:(NIPagingScrollView *)pagingScrollView{
    NSLog(@"NIPagingScrollViewDelegate-pagingScrollViewDidScroll");
}

/**
 * The current page has changed.
 *
 * pagingScrollView.centerPageIndex will reflect the changed page index.
 */
- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)pagingScrollView{
     NSLog(@"NIPagingScrollViewDelegate-pagingScrollViewDidChangePages");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}// any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2){
    // any zoom scale changes
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // called on finger up if the user dragged. velocity is in points/second. targetContentOffset may be changed to adjust where the scroll view comes to rest. not called when pagingEnabled is YES
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0){
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    // called on finger up as we are moving
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // called when scroll view grinds to a halt
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    // return a view that will be scaled. if delegate returns nil, nothing happens
    return nil;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2){
    // called before the scroll view begins zooming its content

}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale{
    // scale between minimum and maximum. called after any 'bounce' animations
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    // return a yes if you want to scroll to the top. if not defined, assumes YES
    return YES;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    // called when scrolling animation finished. may be called immediately if already at top
}
@end
