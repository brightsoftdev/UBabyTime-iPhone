//
//  ContentViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ContentViewController.h"
#import "LabelConverter.h"
#import "CoverViewController.h"

@interface ContentViewController()
- (id)addContentViewWithIndentifier:(NSString *)identifier andUsers:(NSDictionary *)userDict;
@property (nonatomic, retain) NSMutableArray *contentViewIndentifierHeap;
@end


@implementation ContentViewController
@synthesize scrollView = _scrollView;
@synthesize contentViewControllerHeap = _contentViewControllerHeap;
@synthesize currentContentIndex = _currentContentIndex;
@synthesize contentViewIndentifierHeap = _contentViewIndentifierHeap;
@synthesize delegate = _delegate;
@synthesize bgView = _bgView;

- (id)init {
    self = [super init];
    if(self) {
        _contentViewControllerHeap = [[NSMutableArray alloc] init];
        _contentViewIndentifierHeap = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithLabelIdentifiers:(NSArray *)identifiers andUsers:(NSDictionary *)userDict {
    self = [self init];
    if(self) {
        for(NSString *identifier in identifiers) {
            [self addUserContentViewWithIndentifier:identifier andUsers:userDict];
        }
    }
    return self;
}

- (void)dealloc {
    [_contentViewControllerHeap release];
    [_contentViewIndentifierHeap release];
    [_scrollView release];
    [_bgView release];
    self.delegate = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)refreshScrollViewContentSize {
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.contentViewCount, self.scrollView.frame.size.height);
}

- (void)scrollContentViewAtIndexPathToVisble:(NSUInteger)index animated:(BOOL)animate{
    if(animate)
        animate = abs(index - _currentContentIndex) <= 3 && index / 4 == _currentContentIndex / 4 ? YES : NO;
    [self.scrollView scrollRectToVisible:CGRectMake(self.scrollView.frame.size.width * index, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:animate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshScrollViewContentSize];
    [self.contentViewControllerHeap enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = obj;
        CGRect frame = vc.view.frame;
        frame.origin.x = self.scrollView.frame.size.width * idx;
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
    }];
    self.scrollView.delegate = self;
    
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5.0f;
    
    self.scrollView.scrollsToTop = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.scrollView = nil;
    self.bgView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)addLastContentViewToScrollView {
    [self refreshScrollViewContentSize];
    UIViewController *vc = [self.contentViewControllerHeap lastObject];
    CGRect frame = vc.view.frame;
    frame.origin.x = self.scrollView.frame.size.width * (self.contentViewCount - 1);
    vc.view.frame = frame;
    [self.scrollView addSubview:vc.view];
}

- (void)removeContentViewAtIndexFromScrollView:(NSUInteger)index {
    UIViewController *vc = [self.contentViewControllerHeap objectAtIndex:index];
    [vc.view removeFromSuperview];
    [self.contentViewControllerHeap enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(idx > index) {
            UIViewController *vc = obj;
            CGRect frame = vc.view.frame;
            frame.origin.x -= self.scrollView.frame.size.width;
            vc.view.frame = frame;
        }
    }];
    [self.contentViewControllerHeap removeObjectAtIndex:index];
    [self refreshScrollViewContentSize];
    if(_currentContentIndex == index) {
        self.currentContentIndex = self.currentContentIndex - 1;
    }
    
}

- (id)addContentViewWithIndentifier:(NSString *)identifier andUsers:(NSDictionary *)userDict {
    CoverViewController *cvc = [[CoverViewController alloc] init];
    return cvc;
}

- (void)forceRefreshScrollsToTopProperty {
    [_contentViewControllerHeap enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
    }];
}

- (void)setCurrentContentIndex:(NSUInteger)currentContentIndex {
    if(currentContentIndex >= self.contentViewControllerHeap.count)
        return;
    if(currentContentIndex == _currentContentIndex)
        return;
    [self scrollContentViewAtIndexPathToVisble:currentContentIndex animated:YES];
    _currentContentIndex = currentContentIndex;
    [self forceRefreshScrollsToTopProperty];
}

- (NSUInteger)contentViewCount {
    return self.contentViewControllerHeap.count;
}

- (BOOL)isFake{
    return (self.contentViewCount == 0);
}

- (void)setContentViewAtIndex:(NSUInteger)index forIdentifier:(NSString *)identifier {
    
}

- (void)addUserContentViewWithIndentifier:(NSString *)identifier andUsers:(NSDictionary *)userDict {
    NSString *childIdentifier = [LabelConverter getDefaultChildIdentifierWithParentIdentifier:identifier];
    id vc = [self addContentViewWithIndentifier:childIdentifier andUsers:userDict];
    if(!vc)
        return;
    [self.contentViewControllerHeap addObject:vc];
    [self addLastContentViewToScrollView];
    [self.contentViewIndentifierHeap addObject:childIdentifier];
}

- (void)removeContentViewAtIndex:(NSUInteger)index {
    [self removeContentViewAtIndexFromScrollView:index];
    [self.contentViewIndentifierHeap removeObjectAtIndex:index];
    if(self.currentContentIndex >= index)
        self.currentContentIndex = self.currentContentIndex - 1;
}

- (NSString *)currentContentIdentifierAtIndex:(NSUInteger)index {
    NSString *result = [self.contentViewIndentifierHeap objectAtIndex:index];
    return result;
}

#pragma mark -
#pragma mark UIScrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    if(index < 0 || index >= self.contentViewCount)
        return;
    self.currentContentIndex = index;
    if([self.delegate respondsToSelector:@selector(contentViewController:didScrollToIndex:)]) {
        [self.delegate contentViewController:self didScrollToIndex:index];
    }
}
@end
