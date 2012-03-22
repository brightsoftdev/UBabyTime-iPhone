//
//  ContentViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol ContentViewControllerDelegate;
@interface ContentViewController : UIViewController<UIScrollViewDelegate>
{
    NSMutableArray *_contentViewControllerHeap;
    NSUInteger _currentContentIndex;
    NSMutableArray *_contentViewIdentifierHeap;
    id<ContentViewControllerDelegate> _delegate;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIView *bgView;
@property (nonatomic, retain, readonly) NSMutableArray *contentViewControllerHeap;
@property (nonatomic) NSUInteger currentContentIndex;
@property (nonatomic, readonly) NSUInteger contentViewCount;
@property (nonatomic, assign) id<ContentViewControllerDelegate> delegate;
@property (nonatomic, readonly) BOOL isFake; 

- (id)initWithLabelIdentifiers:(NSArray *)identifiers andUsers:(NSDictionary *)userDict;
- (void)setContentViewAtIndex:(NSUInteger)index forIdentifier:(NSString *)identifier;
- (void)addUserContentViewWithIndentifier:(NSString *)identifier andUsers:(NSDictionary *)userDict;
- (void)removeContentViewAtIndex:(NSUInteger)index;
- (NSString *)currentContentIdentifierAtIndex:(NSUInteger)index;

@end


@protocol ContentViewControllerDelegate<NSObject>

- (void)contentViewController:(ContentViewController *)vc didScrollToIndex:(NSUInteger)index;

@end