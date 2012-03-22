//
//  ArticlePagingScrollView.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticlePagingScrollView.h"

@implementation ArticlePagingScrollView
@synthesize pager = _pager;
@synthesize favourButton = _favourButton;
@synthesize commentButton =_commentButton;
@synthesize otherButton = _otherButton;


- (void)dealloc {
    [_pager release],_pager=nil;
    [_favourButton release],_favourButton=nil;
    [_commentButton release],_commentButton=nil;
    [_otherButton release],_otherButton=nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        
        _pager = [[ArticlePageControl alloc] initWithFrame:self.frame];
        _pager.hidesForSinglePage = YES;
        
        
        
        // So, this is weird. Apparently if you don't set a background color on the pager control
        // then taps won't be handled anywhere but within the dot area. If you do set a background
        // color, however, then taps outside of the dot area DO change the selected page.
        //                                  \(o.o)/
        _pager.backgroundColor = [UIColor clearColor];

        // We update these background colors when the launcher view's own background color is set.
        
        // Don't update the pager when the user taps until we've handled the tap ourselves.
        // This allows us to reset the page index forcefully if necessary without flickering the
        // pager's current selection.
        _pager.defersCurrentPageDisplay = YES;
        
        // When the user taps the pager control it fires a UIControlEventValueChanged notification.
        [_pager addTarget: self
                   action: @selector(pageChanged:)
         forControlEvents: UIControlEventValueChanged];
        [_pager sizeToFit];
        _pager.frame=CGRectMake(0, self.frame.size.height - _pager.frame.size.height-20,self.frame.size.width,_pager.frame.size.height);
        
        [self addSubview:_pager];
        
    }
    return self;
}
- (void)reloadData {
    [super reloadData];
    _pager.numberOfPages = [self.dataSource numberOfPagesInPagingScrollView:self];
    [_pager setImagePageStateNormal:[UIImage imageNamed:@"pageControlStateNormal.png"]];
    [_pager setImagePageStateHighlighted:[UIImage imageNamed:@"pageControlStateHighlighted.png"]];
    _pager.frame=CGRectMake(0, 5,self.frame.size.width,_pager.frame.size.height);
    [self bringSubviewToFront:_pager];
    [self bringSubviewToFront:_favourButton];
    [self bringSubviewToFront:_commentButton];
    [self bringSubviewToFront:_otherButton];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}
- (void)updateVisiblePages {
    [super updateVisiblePages];
    _pager.currentPage = [super currentVisiblePageIndex];
    [_pager setImagePageStateNormal:[UIImage imageNamed:@"pageControlStateNormal.png"]];
    [_pager setImagePageStateHighlighted:[UIImage imageNamed:@"pageControlStateHighlighted.png"]];
}
- (void)pageChanged:(UIPageControl*)pager{
    [_pager updateCurrentPageDisplay];
}
@end
