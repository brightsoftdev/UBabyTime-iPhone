//
//  ArticlePagingScrollView.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NIPagingScrollView.h"
#import "NimbusPagingScrollView.h"
#import "ArticlePageControl.h"

@interface ArticlePagingScrollView : NIPagingScrollView
{
    NSMutableArray* _pagesOfButtons;
}
@property (retain,readwrite) IBOutlet ArticlePageControl *pager;
@property (retain,readwrite) IBOutlet UIButton * favourButton;
@property (retain,readwrite) IBOutlet UIButton * commentButton;
@property (retain,readwrite) IBOutlet UIButton * otherButton;

- (void)pageChanged:(UIPageControl*)pager;
@end
