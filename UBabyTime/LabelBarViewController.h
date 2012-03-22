//
//  LabelBarViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelPageViewController.h"
#import "LabelViewController.h"
#import "LabelConverter.h"

@protocol LabelBarViewControllerDelegate;
typedef void (^PopPageMnuallyCompletion)(void);

@interface LabelBarViewController : UIViewController<UIScrollViewDelegate ,LabelPageViewControllerDelegate>
{
    NSMutableArray *_labelPagesStack;
    NSMutableArray *_labelInfoArrayStack;
    NSUInteger _pageCount;
    NSMutableArray *_pageIndexStack;
    NSUInteger _currentParentLabelIndex;
    id<LabelBarViewControllerDelegate> _delegate;
    PopPageMnuallyCompletion _popPageManuallyCompletion;
    BOOL _selectUserLock;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) IBOutlet UIButton *loginButton;

@property (nonatomic, readonly) NSMutableArray *labelInfoArray;
@property (nonatomic, readonly) NSMutableArray *labelPages;
@property (nonatomic, readonly) NSUInteger pageIndex;
@property (nonatomic) NSUInteger pageCount;
@property (nonatomic, assign) id<LabelBarViewControllerDelegate> delegate;
@property (nonatomic, readonly) NSUInteger parentLabelCount;
@property (nonatomic, readonly,getter = isSelectUserLock) BOOL selectUserLock;

- (IBAction)didClickLoginButton:(id)sender;

- (id)initWithLabelInfoArray:(NSArray *)infoArray;
- (void)createLabelWithInfo:(LabelInfo *)info;
- (void)selectParentLabelAtIndex:(NSUInteger)index;
- (void)selectChildLabelWithIdentifier:(NSString *)identifier;

- (void)showLoginLabelAnimated:(BOOL)animated;
- (void)hideLoginLabelAnimated:(BOOL)animated;
@end

@protocol LabelBarViewControllerDelegate <NSObject>

@optional
- (void)labelBarView:(LabelBarViewController *)labelBar didOpenParentLabelAtIndex:(NSUInteger)index;

@required
- (void)labelBarView:(LabelBarViewController *)labelBar didSelectParentLabelAtIndex:(NSUInteger)index;
- (void)labelBarView:(LabelBarViewController *)labelBar didSelectChildLabelWithIndentifier:(NSString *)identifier inParentLabelAtIndex:(NSUInteger)index;
- (void)labelBarView:(LabelBarViewController *)labelBar didRemoveParentLabelAtIndex:(NSUInteger)index;
- (void)labelBarView:(LabelBarViewController *)labelBar willOpenParentLabelAtIndex:(NSUInteger)index;
- (void)didSelectLoginLabel;

@end
