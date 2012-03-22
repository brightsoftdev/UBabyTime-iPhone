//
//  CoverViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoverViewController.h"

@implementation CoverViewController

-(id)initWithCoverViewDelegate:(id<CoverViewDelegate>) coverViewDelegate{
    if([self initWithNibName:@"CoverViewController" bundle:nil]){
        CoverPagingScrollDataSource *dataSource =[[CoverPagingScrollDataSource alloc] init];
        dataSource.coverViewDelegate = coverViewDelegate;
        CoverPagingScrollView *scrollView = (CoverPagingScrollView *)self.view;
        scrollView.dataSource = dataSource;
        scrollView.delegate = self;
        [scrollView reloadData];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    CoverPagingScrollView *scrollView = (CoverPagingScrollView *)self.view;
    scrollView.layer.cornerRadius = 5;
    scrollView.layer.masksToBounds = YES;
    scrollView.layer.shadowColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:0.2] CGColor];
    scrollView.layer.shadowRadius = 3;
    scrollView.layer.borderWidth = 1;
    scrollView.layer.borderColor = [[UIColor colorWithRed:0.42 green:0.09 blue:0.07 alpha:0.12] CGColor];

}

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

#pragma mark - NIPagingScrollViewDelegate

/**
 * The user is scrolling between two photos.
 */
- (void)pagingScrollViewDidScroll:(NIPagingScrollView *)pagingScrollView{
    //NSLog(@"pagingScrollViewDidScroll");
}

/**
 * The current page has changed.
 *
 * pagingScrollView.centerPageIndex will reflect the changed page index.
 */
- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)pagingScrollView{
    NSLog(@"pagingScrollViewDidChangePages");
    [pagingScrollView centerPageIndex];

}

@end
