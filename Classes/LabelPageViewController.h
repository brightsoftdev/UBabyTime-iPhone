//
//  LabelPageViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelViewController.h"

@protocol LabelPageViewControllerDelegate;
@interface LabelPageViewController : UIViewController<LabelViewControllerDelegate> {
    NSMutableArray *_labelViews;
    NSUInteger _page;
    id<LabelPageViewControllerDelegate> _delegate;
    NSMutableArray *_labelInfoSubArray;
    
    CGRect _reservedFrame;
}

@property NSUInteger page;
@property (nonatomic, assign) id<LabelPageViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *labelInfoSubArray;
@property (nonatomic, retain, readonly) NSMutableArray *labelViews;

- (id)initWithInfoSubArray:(NSMutableArray *)array pageIndex:(NSUInteger)page;
- (void)selectOtherPage:(NSUInteger)page;
- (void)activateLastLabel:(LabelInfo *)info delayed:(BOOL)delay;
- (void)openLabelPostAnimation;
- (void)closeParentLabelAnimation;
- (void)closePageWithReturnLabel:(LabelViewController *)labelView;

- (void)reserveParentLabelPageData;
- (void)forceRefreshParentLabelPageData;

@end

@protocol LabelPageViewControllerDelegate <NSObject>

@optional
- (void)labelPageView:(LabelPageViewController *)pageView didStretchOpenLabel:(LabelViewController *)label;

@required
- (void)labelPageView:(LabelPageViewController *)pageView didSelectLabel:(LabelViewController *)label;
- (void)labelPageView:(LabelPageViewController *)pageView didRemoveLabel:(LabelViewController *)label;
- (void)labelPageView:(LabelPageViewController *)pageView willOpenLabel:(LabelViewController *)label;
- (void)labelPageView:(LabelPageViewController *)pageView didOpenLabel:(LabelViewController *)label;
- (void)labelPageView:(LabelPageViewController *)pageView willCloseLabel:(LabelViewController *)label;
- (void)labelPageView:(LabelPageViewController *)pageView didCloseLabel:(LabelViewController *)label;

@end
