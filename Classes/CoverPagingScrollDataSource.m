//
//  CoverPagingScrollDataSource.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoverPagingScrollDataSource.h"

@implementation CoverPagingScrollDataSource
@synthesize coverViewDelegate=_coverViewDelegate;

/**
 * Fetches the total number of pages in the scroll view.
 *
 * The value returned in this method will be cached by the scroll view until reloadData
 * is called again.
 */
- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)pagingScrollView{
    //NSLog(@"ArticlePagingScrollDataSource-numberOfPagesInPagingScrollView");
    return 5;
}

/**
 * Fetches a page that will be displayed at the given page index.
 *
 * You should always try to reuse pages by calling dequeueReusablePageWithIdentifier: on the
 * paging scroll view before allocating a new page.
 */
- (UIView<NIPagingScrollViewPage> *)pagingScrollView:(NIPagingScrollView *)pagingScrollView pageViewForIndex:(NSInteger)pageIndex{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CoverView" owner:nil options:nil];
    CoverView *view = [views lastObject];
    view.coverViewDelegate = _coverViewDelegate;
    return  view;
}


@end
