//
//  ArticlePagingScrollDataSource.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticlePagingScrollDataSource.h"

@implementation ArticlePagingScrollDataSource

/**
 * Fetches the total number of pages in the scroll view.
 *
 * The value returned in this method will be cached by the scroll view until reloadData
 * is called again.
 */
- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)pagingScrollView{
    NSLog(@"ArticlePagingScrollDataSource-numberOfPagesInPagingScrollView");
    return 5;
}

/**
 * Fetches a page that will be displayed at the given page index.
 *
 * You should always try to reuse pages by calling dequeueReusablePageWithIdentifier: on the
 * paging scroll view before allocating a new page.
 */
- (UIView<NIPagingScrollViewPage> *)pagingScrollView:(NIPagingScrollView *)pagingScrollView pageViewForIndex:(NSInteger)pageIndex{
    NSLog(@"ArticlePagingScrollDataSource-pagingScrollView");
    ArticlePagingScrollViewPage *page = [[[ArticlePagingScrollViewPage alloc] initWithFrame:CGRectMake(0, 0, pagingScrollView.frame.size.width, pagingScrollView.frame.size.height)] autorelease];
    [page setContentToHTMLString:[NSString stringWithFormat:@"<b>test%d</b>", pageIndex]];
    [page setEditable:NO];
    return page;
}
@end
